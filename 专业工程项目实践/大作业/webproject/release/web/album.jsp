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
    int id = Integer.parseInt(request.getParameter("id"));
    if (id < 0)
        id = 0;
    String sign = "";
    String title = "";
    String content = "";
    String time = "";
    String readCount = "";
    int fabulousCount = 0;
    int currentPage = 1;
    if (request.getParameter("page") != null){
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //获取个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + bloggerID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;

    //获取相册详情
    Map<String, String> albumInfo = new HashMap<>();
    resultSet = stmt.executeQuery("select * from Album where albumID = \"" + id + "\"");
    while (resultSet.next()){
        albumInfo.put("name", resultSet.getString("name"));
        albumInfo.put("description", resultSet.getString("description"));
        albumInfo.put("date", resultSet.getString("time"));
    }
    //获取相片的个数
    int blogCount = 0;
    ResultSet resultCount = stmt.executeQuery("select count(*) from Picture where albumID = \"" + id + "\"");
    while (resultCount.next()){
        blogCount = resultCount.getInt(1);
    }
    ResultSet result;
    //每页显示10个
    int pageCount = (int)Math.ceil(blogCount / 10.0);
    if (pageCount == 0)
        pageCount = 1;
    if (currentPage <= 0)
        currentPage = 1;
    else if (currentPage > pageCount)
        currentPage = pageCount;
    pageContext.setAttribute("currentPage", currentPage);
    pageContext.setAttribute("pageCount", pageCount);
    //获取赞数
    resultSet = stmt.executeQuery("select * from Picture where albumID = \"" + id + "\"");
    while (resultSet.next()){
        fabulousCount += resultSet.getInt("likeCount");
    }

    //获取图片
    //取出10个图
    int tempi = 0;
    List<Map<String, String> > pictures = new ArrayList<>();
    result = stmt.executeQuery("select * from Picture where albumID = \"" + id + "\" limit " + (currentPage - 1) * 10 + ", 10");
    while (result.next()) {
        Map<String, String> map = new HashMap<>();
        map.put("num", Integer.toString(tempi));
        map.put("id", result.getString("pictureID"));
        map.put("name", result.getString("name"));
        map.put("pictureSrc", result.getString("content"));
        map.put("fabulousCount", result.getString("likeCount"));
        ++ tempi;
        pictures.add(map);
    }
    pageContext.setAttribute("pictures", pictures);

    //获取评论
    Map<String, List<Map<String, String> > > photoComment = new HashMap<>();
    result = stmt.executeQuery("select COUNT(*) from PictureComment, Picture where PictureComment.pictureID = Picture.pictureID and Picture.albumID = " + id);
    tempi = 1;
    int commentCount = 0;
    while (result.next()){
        commentCount = result.getInt(1);
    }
    pageContext.setAttribute("photoComment", photoComment);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>相册详情</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/album.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="text/javascript">
        function getHTML(context, uri, params, onSuccess) {
            let XMLRequest = new XMLHttpRequest();
            let request = uri;
            let first = 1;
            for (let key in params){
                if (params.hasOwnProperty(key)) {
                    if (first === 1) {
                        request = request + "?" + key + "=" + params[key];
                        first = 0;
                    } else
                        request = request + "&" + key + "=" + params[key];
                }
            }
            XMLRequest.open('GET', request);
            XMLRequest.onreadystatechange = () => {
                if (XMLRequest.readyState === 4 && XMLRequest.status === 200) {
                    onSuccess(XMLRequest.responseText);
                }
            };
            XMLRequest.send();
        }
        function uploadPicture() {
            let albumID = document.getElementById("albumID").innerText;
            let pictureName = document.getElementById("photo-title").value;
            let pictureFile = document.getElementById("test-image-file").files[0];
            let params = {
                "albumID": albumID,
                "name": pictureName,
                "file": pictureFile
            };
            postFile(this, 'template/album_upload.jsp', params, (data) => {
                let jsonObj = JSON.parse(data);
                if (jsonObj['status'] === "success") {
                    alert("上传成功！");
                }
                else if(jsonObj['status'] === "error"){
                    alert("上传错误！");
                }
                else{
                    alert("未知错误");
                }
            })
        }
        function like(obj, pictureID) {
            let likeCount = document.querySelector(".like-count");
            if (hasClass(obj, "liked")){
                likeCount.innerText = parseInt(likeCount.innerText) - 1;
                obj.classList.remove("liked");
                obj.src = "img/good_32px.png";
                let params = {
                    "pictureID": pictureID,
                    "action": "cancel"
                };
                getJSON(this, 'template/picture_like.jsp', params, (data) => {
                    let jsonObj = JSON.parse(data);
                    if (jsonObj['status'] === "success") {

                    } else {
                        alert("未知错误");
                    }
                })
            }
            else {
                likeCount.innerText = parseInt(likeCount.innerText) + 1;
                obj.classList.add("liked");
                obj.src = "img/good_checked_32px.png";
                let params = {
                    "pictureID": pictureID,
                    "action": "like"
                };
                getJSON(this, 'template/picture_like.jsp', params, (data) => {
                    let jsonObj = JSON.parse(data);
                    if (jsonObj['status'] === "success") {

                    } else {
                        alert("未知错误");
                    }
                })
            }
        }

        function comment(pictureID) {
            let content = document.querySelector(".write-comment textarea").value;
            let params = {
                "pictureID": pictureID,
                "content": content
            };
            getJSON(this, 'template/picture_comment.jsp', params, (data) => {
                let jsonObj = JSON.parse(data);
                if (jsonObj['status'] === "success") {
                    alert("评论成功！")
                } else {
                    alert("未知错误");
                }
            })
        }

        function popShowBox(obj) {
            var popBox = document.getElementById('popBox');
            var popLayer = document.getElementById('popLayer');

            document.getElementById("pop-img").src = obj.src;
            let pictureID = obj.dataset.pictureid;
            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            let params = {
                "pictureID": pictureID
            };
            getHTML(this,'/template/album_comment.jsp', params, (data) => {
                document.querySelector(".photo-comment-list").insertAdjacentHTML("beforeend", data);
            });
            popLayer.style.display = "block";
            popBox.style.display = "block";
        }
        function popBox(id, imgID=null) {
            var popBox = document.getElementById(id);
            var popLayer = document.getElementById('popLayer');
            if (imgID != null)
                document.querySelector(".photo-comment-button").onclick = () => {comment(pictureID=imgID)};

            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            popLayer.style.display = "block";
            popBox.style.display = "block";
        }
        function closeBox(id) {
            let popBox = document.getElementById(id);
            let popLayer = document.getElementById('popLayer');
            document.querySelector(".photo-comment-list").innerHTML = "<div class=\"title\">\n" +
                "评论列表\n" +
                "</div>";
            popLayer.style.display = "none";
            popBox.style.display = "none";

        }

        function hasClass(element,className){
            let aSameClassEle = document.getElementsByClassName(className);
            for(let i = 0;i < aSameClassEle.length;i++){
                if(aSameClassEle[i] === element){
                    return true;
                }
            }
            return false;
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
        function postFile(context, uri, params, onSuccess) {
            let XMLRequest = new XMLHttpRequest();
            let request = new FormData();
            for (let key in params){
                if (params.hasOwnProperty(key)) {
                    request.append(key, params[key]);
                }
            }
            XMLRequest.open('POST', uri);
            XMLRequest.setRequestHeader("encType", "multipart/form-data");
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
<div id="albumID" class="messenger"><%=id%></div>
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
        <div class="subalbum">
            <div class="title">
                <span>相册详情</span>
            </div>
            <div class="album-content">
                <div class="album-header">
                    <div class="cover"><img src="img/lengtu3.jpg" class="cover"></div>
                    <div class="album-inf">
                        <div class="album-title"><%=albumInfo.get("name")%></div>
                        <button type="button" class="add-photos" <c:if test="${userID != bloggerID}">style="display: none;"</c:if> onclick="popBox('popBox-addphoto')">
                            添加照片
                        </button>
                    </div>
                    <div class="album-stat">
                        <div class="album-comment">
                            <div class="comment-title">评论</div>
                            <div class="comment-count"><%=commentCount%></div>
                        </div>
                        <div class="album-like">
                            <div class="like-title">赞</div>
                            <div class="like-count"><%=fabulousCount%></div>
                        </div>
                    </div>
                </div>
                <ul class="photo-list">
                    <c:forEach items="${pictures}" var="i">
                        <mainpage:Photo
                                id="${i.get(\"id\")}"
                                num="${i.get(\"num\")}"
                                name="${i.get(\"name\")}"
                                pictureSrc="${i.get(\"pictureSrc\")}"
                                ></mainpage:Photo>
                    </c:forEach>
                </ul>
            </div>
            <!-- 换页 -->
            <div class="pagi">
                <ul class="pagination">
                    <li><a href="album.jsp?blogger=<%=bloggerID%>&page=${currentPage - 1}">«</a></li>
                    <c:forEach var="i" begin="1" end="${pageCount}">
                        <li><a href="album.jsp?page=${i}" class="<c:if test="${i == currentPage}">active</c:if>">${i}</a></li>
                    </c:forEach>
                    <li><a href="album.jsp?blogger=<%=bloggerID%>&page=${currentPage + 1}">»</a></li>
                </ul>
            </div>
        </div>

    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>
<div id="popLayer">
</div>
<div id="popBox-comment">
    <div class="close2"><a href="javascript:void(0)" onclick="closeBox('popBox-comment')"><img src="img/close-popbox.png"></a></div>
    <div class="title"><span>添加评论</span></div>
    <div class="write-comment">
        <textarea rows="5" cols="69" id="write-textarea"></textarea>
    </div>
    <button type="submit" class="photo-comment-button" onclick="comment()">评论</button>
</div>
<div id="popBox-addphoto">
    <div class="close3"><a href="javascript:void(0)" onclick="closeBox('popBox-addphoto')"><img src="img/close-popbox.png"></a></div>
    <div class="title"><span>添加照片</span></div>
    <p id="photo-title-p">
        <label for="photo-title" class="photo-title-label"> 照片标题： </label>
        <input class="textareas" id="photo-title" name="photo-title" required="required" type="text" />
    </p>
    <p id="submit-photo-p">
        <input type="file" id="test-image-file" name="test" accept="image/gif, image/jpeg, image/png, image/jpg">
    </p>
    <p id="submit-button-p">
        <input type="submit" id="submit-photo" value="上传" onclick="uploadPicture()" />
    </p>
</div>
<div id="popBox">
    <div class="close"><a href="javascript:void(0)" onclick="closeBox('popBox')"><img src="img/close-popbox.png"></a></div>
    <div class="photoinf">
        <img id="pop-img" src="img/lengtu.jpg">
        <div class="photo-comment-list">
            <div class="title">
                评论列表
            </div>
            
        </div>

    </div>

</div>
</body>
<script type="text/javascript">
    function over(id) {
        let index = id.substr(id.length - 1, 1);
        document.getElementById("photo-operation-" + index).style.visibility = "visible";
    }

    function out(id) {
        let index = id.substr(id.length - 1, 1);
        document.getElementById("photo-operation-" + index).style.visibility = "hidden";
    }
</script>
</html>

