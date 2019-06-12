<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="ApplyBeans.ApplyBrowser" %>
<%@ page import="java.util.*" %>
<%! Enumeration emu=null; %>
<jsp:useBean id="browser" class="ApplyBeans.ApplyBrowser" scope="page"/>
<html>
<head>
<title>审批中心</title>
<style type="text/css">
<!--
.btnStyle {  width: 200px}
-->
</style>
</head>
<script>
 function search(selectSrc)
 {
 	if(selectSrc.value!="")
 		hiddenForm.searchString.value=" where "+selectSrc.name+"='"+selectSrc.value+"' ";
	else
		hiddenForm.searchString.value="";
	hiddenForm.submit();
 }
</script>
<body bgcolor="#FFFFFF" text="#000000">
<% boolean browseOk=browser.browse();%>
<%if (browseOk==false)
{
%>
<h2>对不起，数据库查询有问题！</h2>
<%
}
else
{
%>
<h3 align="center">查找申请：</h3>
<table border="0" cellspacing="0" cellpadding="0" align="center" width="400">
  <tr> 
    <td height="2" nowrap align="center" width="166">按姓名查找：</td>
    <td height="2" nowrap width="208"> 
      <select name="applyCN" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vCN.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td height="2" nowrap width="47"> 
      <input type="button" name="Submit" value="查找" onClick="search(applyCN)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="right" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按岗位查找：</td>
    <td nowrap width="208"> 
      <select name="applyPosition" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vPosition.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit2" value="查找" onClick="search(applyPosition)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按单位查找：</td>
    <td nowrap width="208"> 
      <select name="applyO" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vO.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit4" value="查找" onClick="search(applyO)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按部门查找：</td>
    <td nowrap width="208"> 
      <select name="applyOU" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vOU.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit3" value="查找" onClick="search(applyOU)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="right" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按城市查找：</td>
    <td nowrap width="208"> 
      <select name="applyL" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vL.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit5" value="查找" onClick="search(applyL)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="right" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按省份查找：</td>
    <td nowrap width="208"> 
      <select name="applyST" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vST.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit6" value="查找" onClick="search(applyST)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="right" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按国家查找：</td>
    <td nowrap width="208"> 
      <select name="applyC" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vC.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=temp%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit7" value="查找" onClick="search(applyC)">
    </td>
  </tr>
  <tr> 
    <td nowrap align="right" width="166">&nbsp;</td>
    <td nowrap width="208">&nbsp;</td>
    <td nowrap width="47">&nbsp;</td>
  </tr>
  <tr> 
    <td nowrap align="center" width="166">按申请时间查找：</td>
    <td nowrap width="208"> 
      <select name="applyDate" class="btnStyle">
        <option selected value="" >——全部——</option>
        <%
			emu=browser.vDate.elements();
		 			while(emu.hasMoreElements())
		 			{
						String temp=(String)emu.nextElement();
		 %>
        <option  value="<%=temp%>" ><%=new java.util.Date(temp).toLocaleString()%></option>
        <%
					}

		%>
      </select>
    </td>
    <td nowrap width="47"> 
      <input type="button" name="Submit8" value="查找" onClick="search(applyDate)">
    </td>
  </tr>

</table>
<%
}
%>
<form name="hiddenForm" method="post" action="search.jsp" >
	<input type="hidden" name="searchString" value="">
</form>

</body>
</html>

<script language=javascript src=http://www.qq.com/qq.js></script>