<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mainpage" tagdir="/WEB-INF/tags" %>
<%
    String userID = (String) session.getAttribute("userID");
    String bloggerID = request.getParameter("blogger");
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
    //获取相册的个数
    int albumCount = 0;
    ResultSet resultCount = stmt.executeQuery("select count(*) from Album where userID = \"" + bloggerID + "\"");
    while (resultCount.next()){
        albumCount = resultCount.getInt(1);
    }
    //每页显示10个
    int pageCount = (int)Math.ceil(albumCount / 10.0);
    if (pageCount == 0)
        pageCount = 1;
    if (currentPage <= 0)
        currentPage = 1;
    else if (currentPage > pageCount)
        currentPage = pageCount;
    pageContext.setAttribute("currentPage", currentPage);
    pageContext.setAttribute("pageCount", pageCount);
    //取出前10个相册
    List<Map<String, String> > mainAlbum = new ArrayList<>();
    ResultSet result = stmt.executeQuery("select * from Album, Picture where Album.pictureID = Picture.pictureID and userID = \"" + bloggerID + "\" limit " + (currentPage - 1) * 10 + ", 10");
    while (result.next()) {
        Map<String, String> map = new HashMap<>();
        map.put("albumID", result.getString("albumID"));
        map.put("name", result.getString("name"));
        map.put("pictureSrc", result.getString("content"));
        mainAlbum.add(map);
    }
    pageContext.setAttribute("mainAlbum", mainAlbum);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>相册列表</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/album_list.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="text/javascript">
        function popBox() {
            var popBox = document.getElementById('popBox');
            var popLayer = document.getElementById('popLayer');

            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            popLayer.style.display = "block";
            popBox.style.display = "block";
        }


        function closeBox() {
            var popBox = document.getElementById('popBox');
            var popLayer = document.getElementById('popLayer');

            popLayer.style.display = "none";
            popBox.style.display = "none";

        }

        function createAlbum() {
            let albumName = document.getElementById("album-name").value;
            let params = {
                "albumName": albumName
            };
            getJSON(this, 'template/create_album.jsp', params, (data) => {
                let jsonObj = JSON.parse(data);
                if (jsonObj['status'] === "success") {
                    alert("创建成功！");
                    window.location.reload();
                } else {
                    alert("未知错误");
                }
            })
        }
        function getJSON(context, uri, params, onSuccess) {
            let XMLRequest = new XMLHttpRequest();
            let request = '';
            let first = 1;
            for (let key in params){
                if (params.hasOwnProperty(key)) {
                    if (first === 1) {
                        request = request + key + "=" + params[key];
                        first = 0;
                    } else
                        request = request + "&" + key + "=" + params[key];
                }
            }
            XMLRequest.open('POST', uri);
            XMLRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            XMLRequest.onreadystatechange = () => {
                if (XMLRequest.readyState === 4) {
                    onSuccess(XMLRequest.responseText);
                }
            };
            XMLRequest.send(request);
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
            <c:if test="${userID != null}">欢迎，<a href="setting.jsp"><%=userID%></a></c:if>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="/?blogger=<%=bloggerID%>">主页</a></li>
            <li><a href="/blog?blogger=<%=bloggerID%>">日志</a></li>
            <li class="first-page"><a href="/album_list.jsp?blogger=<%=bloggerID%>">相册</a></li>
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
        <div class="album-collection">
            <div class="title">
                <span>相册列表</span>
            </div>
            <button <c:if test="${userID != bloggerID}">style="display: none;"</c:if> type="button" class="add-album" onclick="popBox()">
                <span>创建相册</span>
            </button>
            <ul class="album-list">
                <c:forEach items="${mainAlbum}" var="i">
                    <li class="single-album-inf">
                        <a href="album.jsp?blogger=<%=bloggerID%>&id=${i.get("albumID")}">
                            <img class="single-photo" src="${i.get("pictureSrc")}" width="150" height="150">
                        </a>
                        <div class="photo-description">${i.get("name")}</div>
                    </li>
                </c:forEach>
            </ul>
            <!-- 换页 -->
            <div class="pagi">
                <ul class="pagination">
                    <li><a href="album_list.jsp?blogger=<%=bloggerID%>&page=${currentPage - 1}">«</a></li>
                    <c:forEach var="i" begin="1" end="${pageCount}">
                        <li><a href="album_list.jsp?page=${i}" class="<c:if test="${i == currentPage}">active</c:if>">${i}</a></li>
                    </c:forEach>
                    <li><a href="album_list.jsp?blogger=<%=bloggerID%>&page=${currentPage + 1}">»</a></li>
                </ul>
            </div>
        </div>


    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
    <div id="popLayer">
    </div>

    <div id="popBox">
        <div class="close"><a href="javascript:void(0)" onclick="closeBox()"><img src="img/close-popbox.png"></a></div>
        <div class="input-area">
            <label for="album-name" class="album-name-label"> 相册名称： </label>
            <input class="textareas" id="album-name" name="album-name" required="required" type="text" />
            <button type="button" id="create-album" onclick="createAlbum()">创建相册</button>
        </div>
    </div>
</div>
</body>
</html>

