<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
  String userID = (String) session.getAttribute("userID");
  String bloggerID = request.getParameter("blogger");
  if (bloggerID == null) {
    if (userID == null)
      response.sendRedirect("sign_in.jsp");
    else
      bloggerID = userID;
  }
  pageContext.setAttribute("userID", userID);
  String headTitle = bloggerID + "的博客";
  String headSignature = "这个人很懒，什么都没有说。";
  String flybyText = "这是用来测试的无意义的一句话啦啦啦。";
  int blogCount = 0;
  String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
  Class.forName("com.mysql.jdbc.Driver");
  Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
  Statement stmt = connect.createStatement();
  //取出个性签名
  ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
  while (resultSet.next())
    headSignature = resultSet.getString("signature");
  flybyText = headSignature;
  //获取第一个相册的封面
  String sideAlbum = "";
  resultSet = stmt.executeQuery("select * from Album A, Picture P where A.pictureID = P.pictureID and userID = \"" + bloggerID + "\" limit 1");
  while (resultSet.next()){
    sideAlbum = resultSet.getString("P.content");
  }
  //从数据库中取出置顶文章，放入以下形式的List中
  List<Map<String, String> > topArticle = new ArrayList<>();
  ResultSet result = stmt.executeQuery("select * from Blog where (sign = 0 or sign = 1) and userID = \"" + bloggerID + "\"");
  while (result.next()) {
    int sign = result.getInt("sign");
    if (sign == 0) {
      Map<String, String> map = new HashMap<>();
      map.put("blogID", result.getString("blogID"));
      map.put("sign", "顶");
      map.put("title", result.getString("title"));
      map.put("commentCount", Integer.toString(result.getInt("commentCount")));
      map.put("fabulousCount", Integer.toString(result.getInt("likeCount")));
      topArticle.add(map);
    }
  }
  pageContext.setAttribute("topArticle", topArticle);

  //TODO: Acquire tag clouds from database
  //从数据库中取出标签，放入以下形式的List中
  List<String> tag = new ArrayList<>(); //所有标签载入
  result = stmt.executeQuery("select * from Label");
  while (result.next()) {
    tag.add("#" + result.getString("labelID"));
  }
  /*for (int i = 1;i < 10;i ++){
    tag.add("#" + new String(new char[i]).replace("\0","字"));
  }*/
  pageContext.setAttribute("tag", tag);

  //定义script的正则表达式，去除js可以防止注入
  String scriptRegex="<script[^>]*?>[\\s\\S]*?<\\/script>";
  //定义style的正则表达式，去除style样式，防止css代码过多时只截取到css样式代码
  String styleRegex="<style[^>]*?>[\\s\\S]*?<\\/style>";
  //定义HTML标签的正则表达式，去除标签，只提取文字内容
  String htmlRegex="<[^>]+>";
  //定义空格,回车,换行符,制表符
  String spaceRegex = "\\s*|\t|\r|\n";


  //TODO: Acquire article list from database
  //从数据库中取出前j篇文章，放入以下形式的List中
  List<Map<String, String> > mainArticle = new ArrayList<>();
  result = stmt.executeQuery("select * from Blog where userID = \"" + bloggerID +"\" limit 4");
  while (result.next()) {
    Map<String, String> map = new HashMap<>();
    int sign = result.getInt("sign");
    if (sign == 0)
      map.put("sign", "原创");
    map.put("blogID", result.getString("blogID"));
    map.put("title", result.getString("title"));
    map.put("img", result.getString("img"));
    String rawContent = result.getString("content");

    // 过滤script标签
    rawContent = rawContent.replaceAll(scriptRegex, "");
    // 过滤style标签
    rawContent = rawContent.replaceAll(styleRegex, "");
    // 过滤html标签
    rawContent = rawContent.replaceAll(htmlRegex, "");
    // 过滤空格等
    rawContent = rawContent.replaceAll(spaceRegex, "");
    map.put("article", rawContent);
    map.put("time", result.getString("time"));
    map.put("readCount", result.getString("pageviews"));
    map.put("commentCount", result.getString("commentCount"));
    map.put("fabulousCount", result.getString("likeCount"));
    mainArticle.add(map);
    ++ blogCount;
  }
  pageContext.setAttribute("mainArticle", mainArticle);

  //TODO: Acquire comment from database
  //从数据库中取出前j条评论，放入以下形式的List中
  List<Map<String, String> > comment = new ArrayList<>();
  result = stmt.executeQuery("select * from BlogComment C, Blog B where C.blogID = B.blogID and B.userID = \""+ bloggerID +"\" limit 4");
  while (result.next()) {
    Map<String, String> map = new HashMap<>();
    map.put("name", result.getString("C.userID"));
    map.put("message", result.getString("content"));
    comment.add(map);
  }
  /*for (int i = 0;i < 5;i ++){
    Map<String, String> stringMap = new HashMap<>();
    stringMap.put("name", "志儒" + i + "号");
    stringMap.put("message", "我永远喜欢李新锐");
    comment.add(stringMap);
  }*/
  pageContext.setAttribute("comment", comment);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <title><%=headTitle%></title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_article.css">
  <link rel="stylesheet" type="text/css" href="css/mainpage_aside.css">
  <meta name="description" content="666的博客,心随你动!"/>
  <script src="js/DOM.js" type="module" charset="utf-8"></script>
  <script src="js/htmlResolver.js" type="module" charset="utf-8"></script>
  <script type="module">
    import {MainPage} from "/js/DOM.js";
    var mainpage;
    window.onload = function(){mainpage = new MainPage();}
  </script>
</head>
<body>
<div id="blog-count" class="messenger"><%=blogCount%></div>
<div id="bloggerID" class="messenger"><%=bloggerID%></div>
<div id="wrapper">
  <!-- 头部 -->
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
  <!-- 导航条 -->
  <nav>
    <ul>
      <li class="first-page"><a href="/?blogger=<%=bloggerID%>">主页</a></li>
      <li><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
      <li><a href="/album_list.jsp?blogger=<%=bloggerID%>">相册</a></li>
      <li><a href="#">留言板</a></li>
      <li><a href="#">我的访客</a></li>
      <input type="text" id="search" value="文章搜索..." onfocus="if (value =='文章搜索...'){value =''}" onblur="if (value ==''){value='文章搜索...'}" >
      <button type="button" id="search-btn"></button>
    </ul>

  </nav>
  <div id="container">
    <!-- 浮动横幅 -->
    <div class="flytext">
      <img src="img/widespread.png" />
      <marquee behavior="scroll" direction="left">
        <%=flybyText%>
      </marquee>
    </div>
    <!-- 主内容区 -->
    <div class="content">
      <section>
        <!-- 置顶文章 -->
        <div class="top-article">
          <div class="top-title">
            <div class="text-title">置顶文章</div>
          </div>
          <div class="cont">
            <c:forEach items="${topArticle}" var="i">
              <mainpage:TopArticle
                      blogID="${i.get(\"blogID\")}"
                      sign="${i.get(\"sign\")}"
                      title="${i.get(\"title\")}"
                      commentCount="${i.get(\"commentCount\")}"
                      fabulousCount="${i.get(\"fabulousCount\")}"></mainpage:TopArticle>
            </c:forEach>
          </div>
        </div>
        <!-- 文章列表 -->
        <div class="article-list">
          <c:forEach items="${mainArticle}" var="i">
            <mainpage:ArticleListItem
              blogID="${i.get(\"blogID\")}"
              sign="${i.get(\"sign\")}"
              title="${i.get(\"title\")}"
              img="${i.get(\"img\")}"
              article="${i.get(\"article\")}"
              time="${i.get(\"time\")}"
              readCount="${i.get(\"readCount\")}"
              commentCount="${i.get(\"commentCount\")}"
              fabulousCount="${i.get(\"fabulousCount\")}"
            ></mainpage:ArticleListItem>
          </c:forEach>
        </div>
        <div class="more">
          <button type="button" id="moreclick">点击加载更多...</button>
        </div>
      </section>
      <!-- 右边栏 -->
      <aside>
        <div class="shareclick">
          <img alt="qq" src="img/qq.png" />
          <img alt="qzone" src="img/qqzone.png" />
          <img alt="sina" src="img/weibo.png" />
        </div>
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
        <div class="lately-comment">
          <div class="title">
            <span>最新留言</span>
          </div>
          <div class="content">
            <c:forEach items="${comment}" var="i">
              <mainpage:LatelyComment
                      name="${i.get(\"name\")}"
                      message="${i.get(\"message\")}"></mainpage:LatelyComment>
            </c:forEach>
          </div>
        </div>
        <div class="album">
          <div class="title">
            <span>相册</span>
          </div>
          <div class="content">
            <img src="<%=sideAlbum%>">
          </div>
        </div>
      </aside>
    </div>

  </div>
  <footer>&copy;2019-2030 啦啦啦</footer>
</div>
</body>
</html>

