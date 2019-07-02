<%--
  Created by IntelliJ IDEA.
  User: williamzheng
  Date: 19-6-16
  Time: 上午10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    String userID = (String) session.getAttribute("userID");
    String bloggerID = request.getParameter("blogger");
    if (bloggerID == null) {
        if (userID == null)
            response.sendRedirect("sign_in.jsp");
        bloggerID = userID;
    }
    pageContext.setAttribute("userID", userID);
    pageContext.setAttribute("bloggerID", bloggerID);
    String headTitle = bloggerID + "的博客";
    String headSignature = "这个人很懒，什么都没有说。";
    String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
    int currentPage = 1;
    if (request.getParameter("page") != null){
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //取出个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;
    //获取文章的篇数
    int blogCount = 0;
    ResultSet resultCount = stmt.executeQuery("select count(*) from Blog where userID = \"" + bloggerID + "\"");
    while (resultCount.next()){
        blogCount = resultCount.getInt(1);
    }
    //每页显示10篇
    int pageCount = (int)Math.ceil(blogCount / 10.0);
    if (pageCount == 0)
        pageCount = 1;
    if (currentPage <= 0)
        currentPage = 1;
    else if (currentPage > pageCount)
        currentPage = pageCount;
    pageContext.setAttribute("currentPage", currentPage);
    pageContext.setAttribute("pageCount", pageCount);
    //生成
    //从数据库中取出前k篇文章，放入以下形式的List中
    List<Map<String, String> > mainArticle = new ArrayList<>();
    ResultSet result = stmt.executeQuery("select * from Blog where userID = \"" + bloggerID + "\" limit " + (currentPage - 1) * 10 + ", 10");
    while (result.next()) {
        Map<String, String> map = new HashMap<>();
        int sign = result.getInt("sign");
        if (sign == 0 || sign == 2)
            map.put("sign", "原创");
        else if (sign == 1 || sign == 3)
            map.put("sign", "转载");
        map.put("id", result.getString("blogID"));
        map.put("title", result.getString("title"));
        map.put("img", result.getString("img"));
        map.put("article", result.getString("content"));
        map.put("time", result.getString("time"));
        map.put("readCount", result.getString("pageviews"));
        map.put("commentCount", result.getString("commentCount"));
        map.put("fabulousCount", result.getString("likeCount"));
        mainArticle.add(map);
    }
    pageContext.setAttribute("mainArticle", mainArticle);
    List<String> tag = new ArrayList<>();
    result = stmt.executeQuery("select * from Label");
    while (result.next()) {
        tag.add("#" + result.getString("labelID"));
    }
    pageContext.setAttribute("tag", tag);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>日志详情</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_aside.css">
    <link rel="stylesheet" type="text/css" href="css/articlelist.css">
    <meta name="description" content="666的博客,心随你动!" />
    <script type="module" src="js/DOM.js"></script>
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
            <li class="first-page"><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
            <li><a href="/album_list.jsp?blogger=<%=bloggerID%>">相册</a></li>
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
        <div class="content">
            <section>
                <!-- 日志列表 -->
                <div class="title">
                    <span>日志列表</span>
                </div>
                <button type="button" id="write-article" <c:if test="${userID != bloggerID}">style="display: none;"</c:if> onclick="javascript:window.location.href='write_article.jsp'">写日志</button>
                <ul class="article-list">
                    <c:forEach items="${mainArticle}" var="i">
                        <mainpage:BlogListItem
                                id="${i.get(\"id\")}"
                                sign="${i.get(\"sign\")}"
                                title="${i.get(\"title\")}"
                                time="${i.get(\"time\")}"
                                readCount="${i.get(\"readCount\")}"
                                commentCount="${i.get(\"commentCount\")}"
                                fabulousCount="${i.get(\"fabulousCount\")}"
                        ></mainpage:BlogListItem>
                    </c:forEach>
                </ul>
                <!-- 换页 -->
                <div class="pagi">
                    <ul class="pagination">
                        <li><a href="article_list.jsp?blogger=<%=bloggerID%>&page=${currentPage - 1}">«</a></li>
                            <c:forEach var="i" begin="1" end="${pageCount}">
                                <li><a href="article_list.jsp?page=${i}" class="<c:if test="${i == currentPage}">active</c:if>">${i}</a></li>
                            </c:forEach>
                        <li><a href="article_list.jsp?blogger=<%=bloggerID%>&page=${currentPage + 1}">»</a></li>
                    </ul>
                </div>

            </section>
            <!-- 右边栏 -->
            <aside>
                <div class="label-cloud">
                    <div class="title">
                        <span>标签云</span>
                    </div>
                    <div class="content">
                        <c:forEach items="${tag}" var="i">
                            <div class="labels">
                                <span>${i}</span>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </aside>
        </div>
    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>

</body>
</html>

