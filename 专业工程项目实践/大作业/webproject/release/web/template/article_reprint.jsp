<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String notification = "error";
    String userID = (String) session.getAttribute("userID");
    int blogID = Integer.parseInt(request.getParameter("blogID"));
    String action = request.getParameter("action");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    int currentId = 0;
    if (action.equals("reprint")) {
        ResultSet resultSet = stmt.executeQuery("select * from Blog");
        while (resultSet.next())
            currentId++;
        stmt.execute("insert into Blog(blogID, userID, labelID, title, content, sign) select " + currentId + ", \"" + userID
                + "\", "
                + "labelID, title, content, 3 from Blog where blogID = " + blogID);
    }
    else if (action.equals("cancel")){
        stmt.execute("delete from Blog where blogID = " + blogID);
    }
    notification = "success";
%>
{"status": "<%=notification%>", "id": <%=currentId%>}