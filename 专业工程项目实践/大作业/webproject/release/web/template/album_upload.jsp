<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*, java.sql.*,java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>

<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    String userID = (String) session.getAttribute("userID");
    int albumID = 0;
    String pictureName = "";
    String content = "";
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
                    case "name":
                        pictureName = fileItem.getString("utf-8");
                        break;
                    case "albumID":
                        albumID = Integer.parseInt(fileItem.getString("utf-8"));
                        break;
                }
            }
            else{
                DiskFileItem diskFileItem = (DiskFileItem) fileItem;
                if (!diskFileItem.getName().trim().equals("")){
                    String fileName = application.getRealPath("/img")
                            + System.getProperty("file.separator")
                            + diskFileItem.getName();
                    content = diskFileItem.getName();
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
        int currentId = 0;
        ResultSet resultSet = stmt.executeQuery("select * from Picture");
        while (resultSet.next())
            currentId ++;
        String values = "(" + currentId + ", " + albumID + ",\"" + pictureName + "\",\"img/" + content + "\")";
        stmt.execute("insert into Picture(pictureID, albumID, name, content) values " + values);
        result = "success";
    }
%>
{"status": "<%=result%>"}

