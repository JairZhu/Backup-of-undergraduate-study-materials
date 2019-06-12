import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.net.*;
import java.io.*;

import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.KeyPair; 
import java.security.PrivateKey; 		
import java.security.PublicKey; 
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import javax.crypto.*;

import org.bouncycastle.jce.provider.*;

public class ApplyApplet extends JApplet
{
	JLabel[]  labels={
				new JLabel("用户名："),	new JLabel("岗位："),
				new JLabel("所属单位："),	new JLabel("所属部门："),
				new JLabel("地址："),	new JLabel("城市："),
				new JLabel("省份："),	new JLabel("邮政编码："),
				new JLabel("国家："),		new JLabel("电子邮箱："),
				new JLabel("电话："),	new JLabel("传真：")
			    };
	JTextField[]  fields=new JTextField[12];
	JPanel[]  jps=new JPanel[12];
	JPanel  centerPanel=new JPanel();
	JButton  accept=new JButton("接受声明条款并提交申请");
	JPanel  btnPanel=new JPanel();
	
	public void init()
	{
		java.security.Security.addProvider(new BouncyCastleProvider());
	}

	public void start()
	{
		centerPanel.setLayout(new GridLayout(6,2));
		FlowLayout fl=new FlowLayout();
		fl.setAlignment(FlowLayout.RIGHT);
		for(int x=0;x<12;x++) 
		{	
			jps[x]=new JPanel();
			fields[x]=new JTextField(20);
			jps[x].setLayout(fl);
			jps[x].add(labels[x]);jps[x].add(fields[x]);
			centerPanel.add(jps[x]);
		}
		
		btnPanel.add(accept);
		Container c=getContentPane();
		c.add(centerPanel,BorderLayout.CENTER);
		c.add(btnPanel,BorderLayout.SOUTH);
		accept.addActionListener(new ApplyListener());
	}
	
	public void stop()
	{
	}
	
	public void destroy()
	{
	}

	class ApplyListener  implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			ApplySource as=new ApplySource();
			for(int x=0;x<12;x++)
			{
				as.source[x]=new String(fields[x].getText());
			}
			
			try{
				KeyPairGenerator kpg=KeyPairGenerator.getInstance("RSA","BC");
				SecureRandom rd=SecureRandom.getInstance("SHA1PRNG");
				rd.setSeed(new java.util.Date().getTime());
				kpg.initialize(1024,rd);
				KeyPair kp=kpg.genKeyPair();
				PrivateKey myPvk=kp.getPrivate();
				PublicKey myPbk=kp.getPublic();  
				//System.out.println(myPvk);
				//System.out.println(myPbk);

				as.applyPbk=myPbk;

				JOptionPane.showMessageDialog(null, "您用于签名的公/私钥对已经生成\n按[确定]后请选择用于加密您的申请信息的根CA证书\n如果您的机器上没有该证书，请先在首页下载", "注意", JOptionPane.INFORMATION_MESSAGE); 				

				JFileChooser openChooser = new JFileChooser();
   				ExampleFileFilter filefilter = new ExampleFileFilter("cer", "X.509证书");
   				openChooser.addChoosableFileFilter(filefilter);
				openChooser.setDialogTitle("请选择用于加密申请信息的根CA证书：");
   				int returnVal = openChooser.showOpenDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=openChooser.getSelectedFile();
    					System.out.println("You chose to open this file: "+chosenFile);

					DataInputStream dis=new DataInputStream(new FileInputStream(chosenFile));
					CertificateFactory cf=CertificateFactory.getInstance("X.509");
					byte[]  bytes=new byte[dis.available()];
					dis.readFully(bytes);
					ByteArrayInputStream bais=new ByteArrayInputStream(bytes);
					Certificate CAEncryptCert=cf.generateCertificate(bais);
					PublicKey  CAEncryptPbk=CAEncryptCert.getPublicKey();
					
					//System.out.println(CAEncryptPbk);

				
					Cipher cipher = Cipher.getInstance("DES","BC");
					KeyGenerator keygen = KeyGenerator.getInstance("DES","BC");
   					SecretKey desKey = keygen.generateKey();
					cipher.init(Cipher.ENCRYPT_MODE,desKey);		
					as.daytime=new java.util.Date();			
					SealedObject encryptedSource=new SealedObject(as,cipher);

					cipher=Cipher.getInstance("RSA","BC");
					cipher.init(Cipher.WRAP_MODE,CAEncryptPbk);
					byte[]  wrapedKey=cipher.wrap(desKey);
					

					boolean sendOk=ApplySender.send("127.0.0.1",8888,encryptedSource,wrapedKey);
					if(sendOk==true)
					{
					//	System.out.println("Send ok!");
						JOptionPane.showMessageDialog(null, "您的用于签名的证书的申请已经发送成功\n请记录您的发送时间：    \n"+as.daytime.toLocaleString()+"\n按[确定]后请把您的签名私钥保存到本地文件中", "注意", JOptionPane.INFORMATION_MESSAGE); 				
	
						JFileChooser saveChooser = new JFileChooser();
 						filefilter = new ExampleFileFilter("pem", "DER编码格式的私钥");
   						saveChooser.addChoosableFileFilter(filefilter);
						saveChooser.setDialogTitle("请保存您的签名私钥到文件：");
						saveChooser.setSelectedFile(new File("pkiUser_Pvk_applyId("+Date2Id.change(as.daytime)+")_forSign&Verify"));
   						int returnSaveVal = saveChooser.showSaveDialog(null);
						if(returnSaveVal == JFileChooser.APPROVE_OPTION) 
						{
							File  chosenSaveFile=new File(saveChooser.getSelectedFile().toString()+".pem");
							DataOutputStream dos=new DataOutputStream(new FileOutputStream(chosenSaveFile));
							byte[] myPvkDer=myPvk.getEncoded();
							dos.write(myPvkDer, 0,myPvkDer.length);
							dos.flush();
							dos.close();
							JOptionPane.showMessageDialog(null, "您的签名私钥已经保存成功\n请妥善保管好该文件以作以后签名所用\n并请您带备所有个人资料到CA注册大厅以供审查", "注意", JOptionPane.INFORMATION_MESSAGE); 		
						}
						else
						{
							JOptionPane.showMessageDialog(null,"您的签名私钥没有保存\n这会使您所申请的证书没有作用\n请重新申请","对不起",JOptionPane.ERROR_MESSAGE);

						}
					}
					else
					{
						//System.out.println("NetWork Error!");
						JOptionPane.showMessageDialog(null,"对不起，您的证书申请未能发送成功\n可能是由于网络或数据库或服务器的问题\n请重新申请","对不起",JOptionPane.ERROR_MESSAGE);
					}
				}
				
			}
			catch(Exception ex)
			{
				System.out.println(ex); ex.printStackTrace();
				JOptionPane.showMessageDialog(null,"对不起，您的证书申请失败\n很可能是由于以下原因：\n     您选择的用于加密申请信息的根CA证书不正确\n请重新申请","对不起",JOptionPane.ERROR_MESSAGE);
			}
		}
			
		
	}

}