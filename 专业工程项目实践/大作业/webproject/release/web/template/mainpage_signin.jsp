<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String notification = "";
    if (request.getMethod().equalsIgnoreCase("post")) {
        String userID = request.getParameter("username");
        String password = request.getParameter("password");
        String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
        Statement stmt = connect.createStatement();
        ResultSet resultSet = stmt.executeQuery("select count(*) from User where userID = \"" + userID + "\" and password = \"" + password + "\"");
        boolean flag = false;
        while (resultSet.next()){
            if (resultSet.getInt(1) != 0)
                flag = true;
        }
        if (flag){
            session.setAttribute("userID", userID);
            notification = "success";
        }
        else{
            notification = "error";
        }
    }
%>
{"status": "<%=notification%>"}