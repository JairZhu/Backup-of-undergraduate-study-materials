<%@ tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="userIcon" required="true" %>
<%@ attribute name="userName" required="true" %>
<%@ attribute name="floor" required="true" %>
<%@ attribute name="time" required="true" %>
<%@ attribute name="content" required="true" %>

<div class="single-comment">
    <div class="personal-commentinf">
        <img class="personal-icon" src="<%=userIcon%>" alt="<%=userName%>">
        <div class="personal-name">
            <a href="#"><%=userName%></a>
        </div>
    </div>
    <div class="personal-comment">
        <div class="floor">
            <span id="floor-count"><span ><%=floor%></span>楼</span>
            <span id="comment-time">评论时间：<span><%=time%></span></span>
        </div>
        <div class="personal-comment-content">
            <%=content%>
        </div>
    </div>
</div>