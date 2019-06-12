import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.net.*;
import java.io.*;

public class UnpackApplet extends JApplet
{
	int fileSelectedFlag=1;

	JLabel  jl1=new JLabel("发送方的用于验证其签名的证书：");
	JTextField jf1=new JTextField(20);
	JButton jb1=new JButton("选择文件...");
	JPanel jp1=new JPanel();
	JButton jb1c1=new JButton("本地验证该证书");	
	JButton jb1c2=new JButton("服务器验证该证书是否被撤消");
	JPanel jpc1=new JPanel();

 	JRadioButton jrb2=new JRadioButton("分别选择用于解密的私钥和证书：",true);

	JLabel  jl21=new JLabel("您的解密私钥文件：");
	JTextField jf21=new JTextField(20);
	JButton jb21=new JButton("选择文件...");
	JPanel jp21=new JPanel();
	JLabel  jl22=new JLabel("相应的加密证书：");
	JTextField jf22=new JTextField(20);
	JButton jb22=new JButton("选择文件...");
	JPanel jp22=new JPanel();
	JButton jb2c1=new JButton("本地验证该证书");
	JButton jb2c2=new JButton("服务器验证该证书是否被撤消");
	JPanel jpc2=new JPanel();

 	JRadioButton jrb3=new JRadioButton("选择用于解密的PKCS12文件（内含私钥）：");

	JLabel  jl3=new JLabel("您的PKCS12文件：");
	JTextField jf3=new JTextField(20);
	JButton jb3=new JButton("选择文件...");
	JPanel jp3=new JPanel();
	JButton jb3c1=new JButton("本地验证该证书");
	JButton jb3c2=new JButton("服务器验证该证书是否被撤消");
	JPanel jpc3=new JPanel();

	ButtonGroup bg=new ButtonGroup();

	JLabel  jl4=new JLabel("要解密解包的文件：");
	JTextField jf4=new JTextField(20);
	JButton jb4=new JButton("选择文件...");	
	JPanel jp4=new JPanel();
	
	JButton unpackBtn=new JButton("解密解包");

	JDialog processDialog=new JDialog();
	
	public void init()
	{
		processDialog.getContentPane().setLayout(new BorderLayout());
		processDialog.getContentPane().add(new JLabel("处理中，请稍后......"));
		processDialog.setTitle("处理中");
		processDialog.setSize(300,150);
		processDialog.setLocation(300,150);
	}

	public void start()
	{
		jp1.add(jl1);jp1.add(jf1);jp1.add(jb1);
		jpc1.add(jb1c1);jpc1.add(jb1c2);

		jp21.add(jl21);jp21.add(jf21);jp21.add(jb21);
		jp22.add(jl22);jp22.add(jf22);jp22.add(jb22);
		jpc2.add(jb2c1);jpc2.add(jb2c2);

		jp3.add(jl3);jp3.add(jf3);jp3.add(jb3);
		jpc3.add(jb3c1);jpc3.add(jb3c2);

		bg.add(jrb2);bg.add(jrb3);

		jp4.add(jl4);jp4.add(jf4);jp4.add(jb4);	jp4.add(unpackBtn);

		getContentPane().setLayout(new GridLayout(10,1));
		getContentPane().add(jp1);
		getContentPane().add(jpc1);
		getContentPane().add(jrb2);
		getContentPane().add(jp21);
		getContentPane().add(jp22);
		getContentPane().add(jpc2);
		getContentPane().add(jrb3);
		getContentPane().add(jp3);
		getContentPane().add(jpc3);
		getContentPane().add(jp4);

		fileSelectedFlag=1;
		jl3.setEnabled(false);jf3.setEnabled(false);jb3.setEnabled(false);
		jb3c1.setEnabled(false);jb3c2.setEnabled(false);

		jrb2.addActionListener(new MyRadioListener());
		jrb3.addActionListener(new MyRadioListener());

		jb1.addActionListener(new MySelectListener());
		jb21.addActionListener(new MySelectListener());
		jb22.addActionListener(new MySelectListener());
		jb3.addActionListener(new MySelectListener());
		jb4.addActionListener(new MySelectListener());
		

		jb1c1.addActionListener(new MyLocalValidListener());
		jb2c1.addActionListener(new MyLocalValidListener());
		jb3c1.addActionListener(new MyLocalValidListener());

		unpackBtn.addActionListener(new FileUnpackListener());
		
	}
	
	public void stop()
	{
	}
	
	public void destroy()
	{
	}

	public class MyRadioListener implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			if(ae.getSource()==jrb2)
			{
				fileSelectedFlag=1;
				jl21.setEnabled(true);jf21.setEnabled(true);jb21.setEnabled(true);
				jl22.setEnabled(true);jf22.setEnabled(true);jb22.setEnabled(true);
				jb2c1.setEnabled(true);jb2c2.setEnabled(true);
				jl3.setEnabled(false);jf3.setEnabled(false);jb3.setEnabled(false);
				jb3c1.setEnabled(false);jb3c2.setEnabled(false);
			}
			else
			{
				fileSelectedFlag=2;
				jl21.setEnabled(false);jf21.setEnabled(false);jb21.setEnabled(false);
				jl22.setEnabled(false);jf22.setEnabled(false);jb22.setEnabled(false);
				jb2c1.setEnabled(false);jb2c2.setEnabled(false);
				jl3.setEnabled(true);jf3.setEnabled(true);jb3.setEnabled(true);
				jb3c1.setEnabled(true);jb3c2.setEnabled(true);
			}
		}
	}


	public class MySelectListener implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			String userFilename=null;
			String[] filterStr=null;
			JTextField  tempJf=null;

			if(ae.getSource()==jb1)	
				{ filterStr=new String[]{"cer","X.509证书"}; tempJf=jf1;}
			if(ae.getSource()==jb21)	
				{ filterStr=new String[]{"pem", "DER编码格式的私钥文件"}; tempJf=jf21;}
			if(ae.getSource()==jb22)	
				{ filterStr=new String[]{"cer","X.509证书"}; tempJf=jf22;}
			if(ae.getSource()==jb3)	
				{ filterStr=new String[]{"pfx","PKCS12编码格式文件"}; tempJf=jf3;}

			if(ae.getSource()==jb4)	
			{ 
				tempJf=jf4;					
				JFileChooser openChooser = new JFileChooser();
   				openChooser.setDialogTitle("请选择任何要打包的文件：");
   				int returnVal = openChooser.showOpenDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=openChooser.getSelectedFile();
					tempJf.setText(chosenFile.toString());
					return;
				}
				else return;
			}	

			JFileChooser openChooser = new JFileChooser();
   			ExampleFileFilter filefilter = new ExampleFileFilter(filterStr[0], filterStr[1]);
   			openChooser.addChoosableFileFilter(filefilter);
			openChooser.setDialogTitle("请选择文件：");
   			int returnVal = openChooser.showOpenDialog(null);
   			if(returnVal == JFileChooser.APPROVE_OPTION) 
			{
				File  chosenFile=openChooser.getSelectedFile();
				tempJf.setText(chosenFile.toString());
				return;
			}
			else return;

		}
	}

	public class MyLocalValidListener implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			int fileflag=1;
			String userFilename=null,caFilename=null;
			if(ae.getSource()==jb1c1)
				userFilename=jf1.getText();
			else if(ae.getSource()==jb2c1)
				userFilename=jf22.getText();
			else if(ae.getSource()==jb3c1)
				{ userFilename=jf3.getText(); fileflag=2;}
			else return;
		
			if(fileflag==1)
			{	
				JFileChooser openChooser = new JFileChooser();
   				ExampleFileFilter filefilter = new ExampleFileFilter("cer", "X.509证书");
   				openChooser.addChoosableFileFilter(filefilter);
				openChooser.setDialogTitle("请选择验证该证书的根CA证书：");
   				int returnVal = openChooser.showOpenDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=openChooser.getSelectedFile();
						caFilename=chosenFile.toString();
					LocalValid  localvalid=new LocalValid(userFilename,caFilename);
					int validResult=localvalid.valid();
					if(validResult==0)
						JOptionPane.showMessageDialog(null, "该证书通过了本地验证！", "验证完毕", JOptionPane.INFORMATION_MESSAGE); 				
					else if(validResult==1)	
						JOptionPane.showMessageDialog(null, "该证书已经过期！", "验证完毕", JOptionPane.ERROR_MESSAGE); 						
					else if(validResult==2)
						JOptionPane.showMessageDialog(null, "该证书未能通过CA证书的验证！", "验证完毕", JOptionPane.ERROR_MESSAGE); 				
					else if(validResult==-1)
						JOptionPane.showMessageDialog(null, "验证出错！您可能选择了错误格式的文件。", "验证出错", JOptionPane.ERROR_MESSAGE); 				
				
				}
			}
			else if(fileflag==2)
			{	

				String password = JOptionPane.showInputDialog("请输入该PKCS12文件的密码：");
				if(password==null) password="";
				JFileChooser openChooser = new JFileChooser();
   				ExampleFileFilter filefilter = new ExampleFileFilter("cer", "X.509证书");
   				openChooser.addChoosableFileFilter(filefilter);
				openChooser.setDialogTitle("请选择验证该证书的根CA证书：");
   				int returnVal = openChooser.showOpenDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=openChooser.getSelectedFile();
						caFilename=chosenFile.toString();
					LocalValidPKCS12  localvalid=new LocalValidPKCS12(userFilename,caFilename,password);
					int validResult=localvalid.valid();
					if(validResult==0)
						JOptionPane.showMessageDialog(null, "该证书通过了本地验证！", "验证完毕", JOptionPane.INFORMATION_MESSAGE); 				
					else if(validResult==1)	
						JOptionPane.showMessageDialog(null, "该证书已经过期！", "验证完毕", JOptionPane.ERROR_MESSAGE); 						
					else if(validResult==2)
						JOptionPane.showMessageDialog(null, "该证书未能通过CA证书的验证！", "验证完毕", JOptionPane.ERROR_MESSAGE); 				
					else if(validResult==-1)
						JOptionPane.showMessageDialog(null, "验证出错！您可能选择了错误格式的文件。或输入了错误的密码。", "验证出错", JOptionPane.ERROR_MESSAGE); 				
				
				}				
			}

		}
	}
	

	class FileUnpackListener implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			String filenameToUnpack=jf4.getText();
			String filenameAfterUnpack=null;
			String yourCertFilename=jf1.getText();
			String myPrivateFilename;

			if(fileSelectedFlag==1)
			{
				myPrivateFilename=jf21.getText();
			
				JFileChooser saveChooser = new JFileChooser();
				saveChooser.setDialogTitle("请选择解密解包后保存到的文件：");
   				int returnVal = saveChooser.showSaveDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=saveChooser.getSelectedFile();
					filenameAfterUnpack=chosenFile.toString();
					FileUnpack fu=new FileUnpack(filenameToUnpack,filenameAfterUnpack,yourCertFilename,myPrivateFilename);
					int unpackResult=fu.unpack();
					if(unpackResult==0)
						JOptionPane.showMessageDialog(null, "文件: "+filenameToUnpack+"\n已经被解密解包为:\n"+filenameAfterUnpack+"\n并且验证签名成功！", "成功", JOptionPane.INFORMATION_MESSAGE); 				
					else if(unpackResult==-1)	
						JOptionPane.showMessageDialog(null, "对不起，解密解包失败！\n请检查您所选择的文件是否正确。", "解包失败", JOptionPane.ERROR_MESSAGE); 
					else if(unpackResult==-2)	
						JOptionPane.showMessageDialog(null, "文件: "+filenameToUnpack+"\n已经被解密解包为:\n"+filenameAfterUnpack+"\n但是验证签名失败！", "验证签名失败", JOptionPane.ERROR_MESSAGE); 
						
				}				
			}
			else if(fileSelectedFlag==2)
			{
				myPrivateFilename=jf3.getText();

				String password = JOptionPane.showInputDialog("请输入该PKCS12文件的密码：");
				if(password==null) password="";

				JFileChooser saveChooser = new JFileChooser();
				saveChooser.setDialogTitle("请选择解密解包后保存到的文件：");
   				int returnVal = saveChooser.showSaveDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=saveChooser.getSelectedFile();
					filenameAfterUnpack=chosenFile.toString();
					FileUnpackPKCS12 fuPkcs12=new FileUnpackPKCS12(filenameToUnpack,filenameAfterUnpack,yourCertFilename,myPrivateFilename,password);
					int unpackResult=fuPkcs12.unpack();					
					if(unpackResult==0)
						JOptionPane.showMessageDialog(null, "文件: "+filenameToUnpack+"\n已经被解密解包为:\n"+filenameAfterUnpack+"\n并且验证签名成功！", "成功", JOptionPane.INFORMATION_MESSAGE); 				
					else if(unpackResult==-1)	
						JOptionPane.showMessageDialog(null, "对不起，解密解包失败！\n请检查您所选择的文件是否正确，或密码输入是否错误。", "解包失败", JOptionPane.ERROR_MESSAGE); 
					else if(unpackResult==-2)	
						JOptionPane.showMessageDialog(null, "文件: "+filenameToUnpack+"\n已经被解密解包为:\n"+filenameAfterUnpack+"\n但是验证签名失败！", "验证签名失败", JOptionPane.ERROR_MESSAGE); 
				}				
			}
			
		}		
	}
	

}