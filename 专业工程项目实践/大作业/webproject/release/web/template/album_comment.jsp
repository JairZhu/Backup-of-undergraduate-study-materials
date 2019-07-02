<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    request.setCharacterEncoding("utf-8");
    String pictureID = request.getParameter("pictureID");
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    List<Map<String, String>> comment = new ArrayList<>();
    ResultSet resultSet = stmt.executeQuery("select * from PictureComment where pictureID = " + pictureID + " limit 2");
    int tempi = 1;
    while (resultSet.next()){
        Map<String, String> map = new HashMap<>();
        map.put("num", Integer.toString(tempi));
        map.put("userID", resultSet.getString("userID"));
        map.put("content", resultSet.getString("content"));
        map.put("time", resultSet.getString("time"));
        ++ tempi;
        comment.add(map);
    }
    pageContext.setAttribute("comment", comment);
%>
<c:forEach items="${comment}" var="i">
    <mainpage:AlbumComment
            num="${i.get(\"num\")}"
            userID="${i.get(\"userID\")}"
            comment="${i.get(\"content\")}"
            time="${i.get(\"time\")}"></mainpage:AlbumComment>
</c:forEach>
<div class="more">
    <button type="button" id="moreclick">点击加载更多...</button>
</div>