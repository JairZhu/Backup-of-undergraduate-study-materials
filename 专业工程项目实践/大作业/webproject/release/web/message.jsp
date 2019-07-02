<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    String userID = (String) session.getAttribute("userID");
    String bloggerID = request.getParameter("blogger");
    String headTitle = bloggerID + "的博客";
    String headSignature = "这个人很懒，什么都没有说。";
    String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //取出个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>个人设置</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/messages.css">
    <meta name="Description" content="666的博客,心随你动!" />
</head>
<body>
<div id="wrapper">
    <header>
        <div id="header-text">
            <h1><%=headTitle%></h1>
            <div id="signature"><%=headSignature%></div>
        </div>
        <div class="login">
            <c:if test="${userID == null}">您好，请 <a href="sign_in.jsp">登录</a></c:if>
            <c:if test="${userID != null}">欢迎，<a href="setting.jsp"><%=userID%></a></c:if>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="/?blogger=<%=bloggerID%>">主页</a></li>
            <li><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
            <li><a href="#">相册</a></li>
            <li class="first-page"><a href="#">留言板</a></li>
            <li><a href="#">我的访客</a></li>
            <input type="text" id="search" value="文章搜索..." onfocus="if (value =='文章搜索...'){value =''}" onblur="if (value ==''){value='文章搜索...'}" >
            <button type="button" id="search-btn"></button>
        </ul>

    </nav>
    <div id="container">
        <div class="flytext">
            <img src="img/widespread.png" />
            <marquee behavior="scroll" direction="left">
                <%=flybyText%>
            </marquee>
        </div>
        <div class="messages">
            <div class="title">
                <span>留言板</span>
            </div>
            <div class="write-message">
                <div class="title">
                    <span>我要留言</span>
                </div>
                <div class="write-block">
                    文本编辑框todo
                </div>
            </div>
            <div class="message-list">
                <div class="title">
                    <span>留言列表</span>
                </div>

            </div>
        </div>
        <div class="more">
            <button type="button" id="moreclick" >点击加载更多...</button>
        </div>
    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>
</body>
</html>
