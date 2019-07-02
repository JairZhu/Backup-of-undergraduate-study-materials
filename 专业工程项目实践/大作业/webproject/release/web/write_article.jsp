<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.sql.*" %>
<%
    String userID = (String) session.getAttribute("userID");
    String headSignature = "";
    String flybyText = "";
    String headTitle = userID + "的博客";
    String connectString = "jdbc:mysql://172.18.35.96:3306/myblogdb?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection(connectString, "root", "zhuzhiru");
    Statement stmt = connect.createStatement();
    //取出个性签名
    ResultSet resultSet = stmt.executeQuery("select signature from User where userID = \"" + userID + "\"");
    while (resultSet.next())
        headSignature = resultSet.getString("signature");
    flybyText = headSignature;
    List<Map<String, String>> comment = new ArrayList<>();
    resultSet = stmt.executeQuery("select * from Label");
    List<String> labels = new ArrayList<>();
    while (resultSet.next()){
        labels.add(resultSet.getString("labelID"));
    }
    pageContext.setAttribute("labels", labels);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>写日志</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage.css">
    <link rel="stylesheet" type="text/css" href="css/mainpage_header.css">
    <link rel="stylesheet" type="text/css" href="css/write_article.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="text/javascript">
        function popBox(id) {
            var popBox = document.getElementById(id);
            var popLayer = document.getElementById('popLayer');

            popLayer.style.width = document.body.scrollWidth + "px";
            popLayer.style.height = document.body.scrollHeight + "px";

            popLayer.style.display = "block";
            popBox.style.display = "block";
        }


        function closeBox(id) {
            var popBox = document.getElementById(id);
            var popLayer = document.getElementById('popLayer');

            popLayer.style.display = "none";
            popBox.style.display = "none";

        }
    </script>
    <script type="text/javascript">
        function fontEdit(x,y)
        {
            textEditor.document.execCommand(x,"",y);
            textEditor.focus();
        }
    </script>
    <script type="text/javascript" src="jscolor/jscolor.js"></script>
</head>
<body>
<div id="wrapper">
<div id="userID" class="messenger"><%=userID%></div>
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
            <li><a href="/?blogger=<%=userID%>">主页</a></li>
            <li class="first-page"><a href="/blog?blogger=<%=userID%>">日志</a></li>
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
                这是用来测试的无意义的一句话啦啦啦。
            </marquee>
        </div>
        <div class="write-article-content">
            <div class="title">
                <span>写日志</span>
            </div>
            <p class="input-area">
                <label for="article-title" class="article-title-label"> 标题： </label>
                <input class="textareas" id="article-title" name="article-title" required="required" type="text" />
            </p>
            <div class="select-block">
                <div class="select-title">标签选择：</div>
                <select id="select-sign">
                    <c:forEach items="${labels}" var="i" varStatus="count">
                        <option value="${i}">#${i}</option>
                    </c:forEach>
                </select>
                <button type="button" id="add-sign-button" onclick="popBox('popShowBox-addsign')">添加标签</button>
            </div>
            <div class="write-block">
                <div class="title">正文：</div>
                <div id="editor" style="margin:auto; margin-bottom:10px;margin-top: 10px;">
                    <input type="button" id="bold" style="height:16px; width:16px; font-weight:bold;" value="" onClick="fontEdit('bold')" title="加粗"/>
                    <input type="button" id="italic" style="height:16px; width:16px; font-style:italic;" value="" onClick="fontEdit('italic')" title="斜体" />
                    <input type="button" id="underline" style="height:16px; width:16px; " value="" onClick="fontEdit('underline')" title="下划线" /> |
                    <input type="button" id="align-left" style="height:16px; width:16px;"  onClick="fontEdit('justifyleft')" title="左对齐" />
                    <input type="button" id="align-center" style="height:16px; width:16px;"  onClick="fontEdit('justifycenter')" title="居中" />
                    <input type="button" id="align-right" style="height:16px; width:16px;" v onClick="fontEdit('justifyright')" title="右对齐" />  |
                    <img src="img/font.png" id="font" >
                    <select id="fonts" onChange="fontEdit('fontName',this[this.selectedIndex].value)">
                        <option value="Arial" >Arial</option>
                        <option value="Comic Sans MS">Comic Sans MS</option>
                        <option value="Courier New">Courier New</option>
                        <option value="Monotype Corsiva">Monotype</option>
                        <option value="Tahoma">Tahoma</option>
                        <option value="Times">Times</option>
                    </select>
                    <select id="size" onChange="fontEdit('fontSize',this[this.selectedIndex].value)">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                    </select> |
                    <!--Color: <input class="color {hash:true}" value="000000" onChange="fontEdit('foreColor','#'+this.color)" />-->
                    <img src="img/color.png" id="color-icon"> <input class="color" value="000000" onChange="fontEdit('foreColor','#' +this.color)" style="border:0;padding-left:5px;">
                </div>
            </div>
            <button type="button" id="make-public">发表日志</button>
        </div>

    </div>
    <footer>&copy;2019-2030 啦啦啦</footer>
</div>
<div id="popLayer">
</div>
<div id="popBox-addsign">
    <div class="close"><a href="javascript:void(0)" onclick="closeBox('popShowBox-addsign')"><img src="img/close-popbox.png"></a></div>
    <div class="title"><span>添加标签</span></div>
    <p id="sign-title-p">
        <label for="sign-title" class="sign-title-label"> 标签名： </label>
        <input class="textareas" id="sign-title" name="sign-title" required="required" type="text" />
    </p>
    <p id="sign-submit-button-p">
        <input type="submit" id="submit-sign" value="确定" />
    </p>
</div>
</body>
<script type="text/javascript">
    window.onload = () => {
      let userID = document.getElementById("userID").innerText;
      if (userID === "null"){
          alert("请先登录！");
          window.location.href = "sign_in.jsp";
      }
    };

    let textbox = document.createElement("iframe");
    textbox.name = textbox.id = "textEditor";
    textbox.style = "margin-top:1rem;width:80%;height:400px;";
    if (textbox.addEventListener){
        textbox.addEventListener("load",function(e){this.contentWindow.document.designMode = "on";}, false);
    } else if (textbox.attachEvent){
        textbox.attachEvent("load", function(e){this.contentWindow.document.designMode = "on";});
    }
    document.getElementById("editor").appendChild(textbox);
    textEditor.document.designMode="on";
</script>
<script type="module">
    import {getJSON} from "./js/jsonResolver.js";
    document.getElementById("make-public").addEventListener("click", upload);
    function upload() {
        let title = document.getElementById("article-title").value;
        let tagIdx = document.getElementById("select-sign").selectedIndex;
        let tag = document.getElementById("select-sign").options[tagIdx].value;
        let blog = document.getElementById("textEditor").contentWindow.document.body.innerHTML;
        let params = {
            "title": title,
            "tag": tag,
            "blog": blog
        };
        getJSON(this, 'template/write_article.jsp', params, (data) => {
            let jsonObj = JSON.parse(data);
            if (jsonObj['status'] === "success") {
                alert("发表成功！");
                window.location.href = document.referrer;
            } else {
                alert("未知错误");
            }
        })
    }
</script>
</html>

