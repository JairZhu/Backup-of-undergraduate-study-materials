
<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="blogID" required="true" %>
<%@ attribute name="sign" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="commentCount" required="true" %>
<%@ attribute name="fabulousCount" required="true" %>

<div class="art">
    <div class="art-title">
        <span id="s1"><%=sign%></span>
        <a href="article.jsp?id=<%=blogID%>"><%=title%></a>
    </div>
    <div class="count">
        评论（<div class="cnt"><%=commentCount%></div>)
        <span id="like"> ♡ <%=fabulousCount%> </span>
    </div>
</div>
