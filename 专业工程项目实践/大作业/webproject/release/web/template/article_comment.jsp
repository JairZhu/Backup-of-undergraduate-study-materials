<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String notification = "error";
    String userID = request.getParameter("userID");
    String bloggerID = request.getParameter("bloggerID");
    String blogID = request.getParameter("blogID");
    String comment = request.getParameter("comment");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    int currentId = 0;
    ResultSet resultSet = stmt.executeQuery("select * from BlogComment");
    while (resultSet.next())
        currentId ++;
    String values = "(" + currentId + ", \"" + userID + "\"," + blogID + ",\"" + comment + "\")";
    stmt.execute("insert into BlogComment(commentID, userID, blogID, content) values " + values);
    notification = "success";
%>
{"status": "<%=notification%>"}