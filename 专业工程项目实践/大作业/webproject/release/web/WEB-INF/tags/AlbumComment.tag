<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="num" required="true" %>
<%@ attribute name="userID" required="true" %>
<%@ attribute name="comment" required="true" %>
<%@ attribute name="time" required="true" %>

<div class="single-comment" id="single-comment-${num}">
    <div class="personal-commentinf">
        <img class="personal-icon" src="img/lengtu3.jpg">
        <div class="personal-name">
            <a href="#">${userID}</a>
        </div>
    </div>
    <div class="personal-comment">
        <div class="floor">
            <span id="floor-count"><span>${num}</span>楼</span>
            <span id="comment-time">评论时间：<span>${time}</span></span>
        </div>
        <div class="comment-time-content">
            ${comment}
        </div>
    </div>
    <div class="comment-opration">
        <div class="reply">
            <span>回复</span>
        </div>
        <div class="delete">
            <span>删除</span>
        </div>
    </div>
</div>