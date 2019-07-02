<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String notification = "error";
    String userID = (String) session.getAttribute("userID");
    String title = request.getParameter("title");
    String tag = request.getParameter("tag");
    String blog = request.getParameter("blog");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    String arg1 = Character.toString('\"');
    String arg2 = "\\\\"+'"';

    String ret = blog.replaceAll(arg1,arg2);

    String arg3 = Character.toString('\'');
    String arg4 = "\\\\'";

    blog = ret.replaceAll(arg3,arg4);
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    int currentId = 0;
    ResultSet resultSet = stmt.executeQuery("select * from Blog");
    while (resultSet.next())
        currentId ++;
    String values = "(" + currentId + ", \"" + userID + "\",\"" + tag + "\",\"" + title + "\",\"" + blog + "\")";
    stmt.execute("insert into Blog(blogID, userID, labelID, title, content) values " + values);
    notification = "success";
%>
{"status": "<%=notification%>"}