<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*, java.sql.*,java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    String userID = (String) session.getAttribute("userID");
    String password = "";
    String signature = "";
    String userIcon = "";
    String result = "error";
    if (isMultipart){
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = upload.parseRequest(request);
        for (int i = 0;i < items.size();i ++){
            FileItem fileItem = (FileItem) items.get(i);
            if (fileItem.isFormField()){
                String name = fileItem.getFieldName();
                switch (name){
                    case "password":
                        password = fileItem.getString("utf-8");
                        break;
                    case "signature":
                        signature = fileItem.getString("utf-8");
                        break;
                }
            }
            else{
                DiskFileItem diskFileItem = (DiskFileItem) fileItem;
                if (!diskFileItem.getName().trim().equals("")){
                    String fileName = application.getRealPath("/img")
                            + System.getProperty("file.separator")
                            + diskFileItem.getName();
                    userIcon = diskFileItem.getName();
                    File fileObj = new File(fileName);
                    if (fileObj.exists())
                        fileObj.delete();
                    diskFileItem.write(fileObj);
                }
            }
        }
        String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
        Statement stmt = connect.createStatement();
        stmt.execute("update User set password = \"" + password + "\", signature = \"" + signature + "\", profilePhoto = \"img/"
        + userIcon + "\" where userID = \"" + userID + "\"");
        result = "success";
    }
%>
{"status": "<%=result%>"}

