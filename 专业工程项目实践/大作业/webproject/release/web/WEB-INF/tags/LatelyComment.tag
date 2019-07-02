<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="message" required="true" %>
<div class="visitor comment-spliter">
    <div class="name">
        <a href="#"><%=name%></a>:
    </div>
    <div class="message">
        <%=message%>
    </div>
</div>