<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="num" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="pictureSrc" required="true" %>

<li class="single-photo-inf" id="single-photo-inf-${num}" onmouseover="over(this.id)" onmouseout="out(this.id)">
    <a href="#">
        <img class="single-photo"data-pictureid="${id}" src="${pictureSrc}" width="150" height="150" onclick="popShowBox(this)">
    </a>
    <div class="photo-operation" id="photo-operation-${num}">
        <img class="like-icon" src="img/good_32px.png" onclick="like(this, ${id})">
        <img class="comment-icon" src="img/comment_32px.png" onclick="popBox('popBox-comment', ${id})">
        <span class="photo-reblog">转载</span>
    </div>
    <div class="photo-description">${name}</div>
</li>