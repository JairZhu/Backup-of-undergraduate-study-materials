<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String notification = "error";
    String userID = (String) session.getAttribute("userID");
    String pictureID = request.getParameter("pictureID");
    String content = request.getParameter("content");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    int currentId = 0;
    ResultSet resultSet = stmt.executeQuery("select * from PictureComment");
    while (resultSet.next())
        currentId ++;
    String values = "(" + currentId + ", \"" + userID + "\"," + pictureID + ",\"" + content + "\")";
    stmt.execute("insert into PictureComment(commentID, userID, pictureID, content) values " + values);
    notification = "success";
%>
{"status": "<%=notification%>"}
