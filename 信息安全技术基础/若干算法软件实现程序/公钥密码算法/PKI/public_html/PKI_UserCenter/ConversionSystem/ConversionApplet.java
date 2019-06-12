import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.net.*;
import java.io.*;

public class ConversionApplet extends JApplet
{
	JLabel jl1=new JLabel("X509证书文件：");
	JTextField jf1=new JTextField(20);
	JButton jb1=new JButton("选择文件...");
	JPanel jp1=new JPanel();

	JLabel jl2=new JLabel("密钥文件(DER编码)：");
	JTextField jf2=new JTextField(20);
	JButton jb2=new JButton("选择文件...");
	JPanel jp2=new JPanel();

	JLabel funjl1=new JLabel("用途：");
	JComboBox jcb1=new JComboBox(new String[]{"加密/解密","签名/验证"});
	JButton convertBtn1=new JButton("生成PKCS12格式文件");
	JPanel jpb1=new JPanel();

	JLabel splitLabel=new JLabel("");	

	JLabel jl3=new JLabel("PKCS12文件：");
	JTextField jf3=new JTextField(20);
	JButton jb3=new JButton("选择文件...");
	JPanel jp3=new JPanel();

	JLabel funjl2=new JLabel("用途：");
	JComboBox jcb2=new JComboBox(new String[]{"加密/解密","签名/验证"});
	JButton convertBtn2=new JButton("生成X509证书文件和DER编码的密钥文件");
	JPanel jpb2=new JPanel();

	String[] funcStr={"_forEncryp&Decrypt","_forSign&Verify"};

	public void init()
	{
		
	}

	public void start()
	{
		jp1.setLayout(new FlowLayout(FlowLayout.LEFT));jp1.add(jl1);jp1.add(jf1);jp1.add(jb1);
		jp2.setLayout(new FlowLayout(FlowLayout.LEFT));jp2.add(jl2);jp2.add(jf2);jp2.add(jb2);
		jpb1.setLayout(new FlowLayout(FlowLayout.LEFT));jpb1.add(funjl1);jpb1.add(jcb1);jpb1.add(convertBtn1);
		jp3.setLayout(new FlowLayout(FlowLayout.LEFT));jp3.add(jl3);jp3.add(jf3);jp3.add(jb3);
		jpb2.setLayout(new FlowLayout(FlowLayout.LEFT));jpb2.add(funjl2);jpb2.add(jcb2);jpb2.add(convertBtn2);

		getContentPane().setLayout(new GridLayout(6,1));
		getContentPane().add(jp1);
		getContentPane().add(jp2);
		getContentPane().add(jpb1);
		getContentPane().add(splitLabel);
		getContentPane().add(jp3);
		getContentPane().add(jpb2);

		jb1.addActionListener(new MySelectListener());
		jb2.addActionListener(new MySelectListener());
		jb3.addActionListener(new MySelectListener());

		convertBtn1.addActionListener(new ConvertListener());
		convertBtn2.addActionListener(new ConvertListener());

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
			if(ae.getSource()==jb2)	
				{ filterStr=new String[]{"pem", "DER编码格式的私钥文件"}; tempJf=jf2;}
			if(ae.getSource()==jb3)	
				{ filterStr=new String[]{"pfx","PKCS12编码格式文件"}; tempJf=jf3;}

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

	public class ConvertListener implements ActionListener
	{
		public void actionPerformed(ActionEvent ae)
		{
			if(ae.getSource()==convertBtn1)	
			{
				String certFile=jf1.getText();
				String pvkFile=jf2.getText();
				String pkcs12File=null;
				String password=null;
			
				JFileChooser saveChooser = new JFileChooser();
   				ExampleFileFilter filefilter = new ExampleFileFilter("pfx","PKCS12编码格式文件");
   				saveChooser.addChoosableFileFilter(filefilter);
				saveChooser.setDialogTitle("请选择保存到的PKCS12文件：");
   				int returnVal = saveChooser.showSaveDialog(null);
   				if(returnVal == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=saveChooser.getSelectedFile();
					pkcs12File=chosenFile.toString();
					password = JOptionPane.showInputDialog("请输入您要保存到的PKCS12文件的密码（可空）：\n按取消表示空密码\n密码不能超过6位");
					if(password==null) password="";

					X2P x2p=new X2P(certFile,pvkFile,pkcs12File,password,funcStr[jcb1.getSelectedIndex()]);
					int result=x2p.convert();
					if(result==0)
						JOptionPane.showMessageDialog(null, "文件已经被转换成功并保存！", "转换完毕", JOptionPane.INFORMATION_MESSAGE); 				
					else if(result==-1)	
						JOptionPane.showMessageDialog(null, "对不起，转换失败！\n请检查您所选择的证书文件是否正确。", "转换失败", JOptionPane.ERROR_MESSAGE); 						
					else if(result==-2)	
						JOptionPane.showMessageDialog(null, "对不起，转换失败！\n请检查您所选择的私钥文件是否正确。", "转换失败", JOptionPane.ERROR_MESSAGE); 						
					else if(result==-3)	
						JOptionPane.showMessageDialog(null, "对不起，保存失败！\n请检查您是否有权限保存文件，或输入的密码过长。", "保存失败", JOptionPane.ERROR_MESSAGE); 						
				}				

			}
			else if(ae.getSource()==convertBtn2)	
			{
				String certFile=null;
				String pvkFile=null;
				String pkcs12File=jf3.getText();
				String password=null;

				password = JOptionPane.showInputDialog("请输入该PKCS12文件的密码：(按取消表示无密码)");
				if(password==null) password="";	
		
				JFileChooser saveChooser1 = new JFileChooser();
   				ExampleFileFilter filefilter1 = new ExampleFileFilter("cer","X.509证书");
   				saveChooser1.addChoosableFileFilter(filefilter1);
				saveChooser1.setDialogTitle("请选择您要保存到的X509证书文件：");
   				int returnVal1 = saveChooser1.showSaveDialog(null);
   				if(returnVal1 == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=saveChooser1.getSelectedFile();
					certFile=chosenFile.toString();
				}
				else
				{
					//JOptionPane.showMessageDialog(null, "", "", JOptionPane.INFORMATION_MESSAGE); 				
					return;
				}

   				JFileChooser saveChooser2 = new JFileChooser();
   				ExampleFileFilter filefilter2 = new ExampleFileFilter("pem", "DER编码格式的私钥文件");
   				saveChooser2.addChoosableFileFilter(filefilter2);
				saveChooser2.setDialogTitle("请选择您要保存到的私钥文件：");
   				int returnVal2 = saveChooser2.showSaveDialog(null);
   				if(returnVal2 == JFileChooser.APPROVE_OPTION) 
				{
					File  chosenFile=saveChooser2.getSelectedFile();
					pvkFile=chosenFile.toString();
				}
				else
				{
					//JOptionPane.showMessageDialog(null, "", "", JOptionPane.INFORMATION_MESSAGE); 				
					return;
				}

				P2X p2x=new P2X(certFile,pvkFile,pkcs12File,password,funcStr[jcb2.getSelectedIndex()]);
				int result=p2x.convert();
				if(result==0)
					JOptionPane.showMessageDialog(null, "原PKCS12文件已经被分别保存为一个X509证书文件和一个密钥文件！", "转换完毕", JOptionPane.INFORMATION_MESSAGE); 				
				else if(result==-1)	
					JOptionPane.showMessageDialog(null, "对不起，原PKCS12文件转换失败！\n请检查您所选择的PKCS12文件是否正确，或是否输入了错误的密码。", "转换失败", JOptionPane.ERROR_MESSAGE); 						
				else if(result==-2)	
					JOptionPane.showMessageDialog(null, "对不起，保存X509证书文件失败！\n请检查您是否有权限保存文件。", "保存失败", JOptionPane.ERROR_MESSAGE); 						
				else if(result==-3)	
					JOptionPane.showMessageDialog(null, "对不起，保存密钥失败！\n请检查您是否有权限保存文件。", "保存失败", JOptionPane.ERROR_MESSAGE); 						
									
			}
		}
	}

}