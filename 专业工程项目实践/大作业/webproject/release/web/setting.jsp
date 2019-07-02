<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String userID = (String) session.getAttribute("userID");
    if (userID == null)
        response.sendRedirect("/");
    pageContext.setAttribute("userID", userID);
    String headTitle = userID + "的博客";
    String headSignature = "这个人很懒，什么都没有说。";
    String flybyText = new String();
    int blogCount = 0;
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //取出个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + userID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    if (headSignature == null)
        headSignature = "这个人很懒，什么都没有说。";
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
    <link rel="stylesheet" type="text/css" href="css/settings.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="module">
        import { Setting } from './js/DOM.js';
        var setting;
        window.onload = () => {
            setting = new Setting();
        }
    </script>
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
            <c:if test="${userID != null}">欢迎，<a href=""><%=userID%></a></c:if>
        </div>
    </header>
    <!-- 导航条 -->
    <nav>
        <ul>
            <li class="first-page"><a href="/">主页</a></li>
            <li><a href="/blog">日志</a></li>
            <li><a href="/album_list.jsp?blogger=<%=userID%>">相册</a></li>
            <li><a href="#">留言板</a></li>
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
        <div class="settings">
            <div class="title">
                <span>个人设置</span>
            </div>
            <div class="setting-content">
                <div class="input-areas">
                    <div class="input-title">
                        <span>基本资料</span>
                    </div>
                    <p class="input-area">
                        <label for="password" class="password-label"> 用户密码： </label>
                        <input class="textareas" id="password" name="password" required="required" type="password" />
                    </p>
                    <p class="input-area">
                        <label for="re-password" class="re-password-label"> 重复密码： </label>
                        <input class="textareas" id="re-password" name="password" required="required" type="password" />
                    </p>
                    <p class="input-area">
                        <label for="set-signature" class="re-password-label"> 个性签名： </label>
                        <input class="textareas" id="set-signature" name="set-signature" required="required" type="text" value="<%=headSignature%>" />
                    </p>
                    <p>
                        <button type="submit" class="correct-inf">
                            修改
                        </button>
                    </p>
                </div>
                <div class="icon">
                    <div class="icon-title">
                        <span>上传头像</span>
                    </div>
                    <div class="icon-pre">
                        <img id="upload-icon-preview" src="img/lengtu3.jpg" >
                        <div class="icon-upload">
                            <div class="upload-icon-text">选择图片</div>
                            <input id="upload-icon-input" type="file" size="24" class="input-icon" accept="image/png, image/jpeg, image/gif, image/jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>
</body>
</html>

