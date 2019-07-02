<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="sign" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="time" required="true" %>
<%@ attribute name="readCount" required="true" %>
<%@ attribute name="commentCount" required="true" %>
<%@ attribute name="fabulousCount" required="true" %>

<li class="single-article">
    <div class="sign">
        <span class="<c:if test="${sign == \"原创\"}">sign-original</c:if><c:if test="${sign == \"转载\"}">sign-reprint</c:if>"><%=sign%></span>
    </div>
    <a href="article.jsp?id=${id}"><div class="article-title"><%=title%></div></a>
    <div class="article-date"><%=time%></div>
    <div class="article-stat">
        <img src="img/comment.png" ><span class="comment-count"><%=commentCount%></span><img src="img/eye_gray.png" ><span class="read-count"><%=readCount%></span>
    </div>
    <div class="article-operation">
        <span class="article-delete">删除</span>
        <span class="article-ontop">置顶</span>
    </div>
</li>