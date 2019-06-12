package rvBeans;
import java.util.*;
import java.sql.*;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;
public class RvMail
{
	public int sendMail(String certId,String rvReason)	//0:send ok, -1:no this applyId,  -2:db or mailsever error
	{
		int flag=-2;
		Connection conn=null;
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
			PreparedStatement pstmt=conn.prepareStatement("select applyCN,applyEmail from EmailView_byCertId where certId=?");
			pstmt.setString(1,certId);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{

				String applyCN=rs.getString("applyCN");
				String applyEmail=rs.getString("applyEmail");
				String caEmail="RootCA@hjy.com";
				String subject="您有证书已经被撤消！";
				String content="<h3>您好，"+applyCN+"！</h3><hr>";
			   	 	content+="<h4>您有一个证书已经被撤消！</h4>";
					content+="<h5>其序列号为："+certId+"</h5>";
					content+="<h5>撤消的原因是："+rvReason+"</h5><hr>";
				Properties props = System.getProperties();
				props.put("mail.smtp.auth","false");	
				props.put("mail.smtp.host","hjy.com");  
				Session sess=Session.getInstance(props,null);
				Message msg= new MimeMessage(sess);
				msg.setFrom(new InternetAddress(caEmail));
				msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(applyEmail,false));
				msg.setSubject(subject);
				msg.setSentDate(new java.util.Date());
				msg.setDataHandler(new DataHandler(content,"text/html;charset=gb2312"));
				Transport.send(msg);

				flag=0;
			}
			else
			{
				flag=-1;
			}
		
		}
		catch(Exception ex)
		{
			flag=-2;
		}	
		try{conn.close();}catch(Exception ex){}
		return flag;
	}
}