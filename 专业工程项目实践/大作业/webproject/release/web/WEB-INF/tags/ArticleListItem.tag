
<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="blogID" required="true" %>
<%@ attribute name="sign" required="true" %>
<%@ attribute name="title" required="true" %>
<%@ attribute name="img" required="true" %>
<%@ attribute name="article" required="true" %>
<%@ attribute name="time" required="true" %>
<%@ attribute name="readCount" required="true" %>
<%@ attribute name="commentCount" required="true" %>
<%@ attribute name="fabulousCount" required="true" %>

<article class="all-article">
  <header>
    <div class="sign">
      <span class="sign-span"><%=sign%></span>
      <div></div>
    </div>
    <h3><a href="article.jsp?id=<%=blogID%>"><%=title%></a></h3>
  </header>
  <section>
    <img src="<%=img%>" id="tinyimage">
    <div class="tiny-article">
      <%=article%>
    </div>
  </section>
  <footer>
    <img src="img/time_gray.png" /> <%=time%>
    <img src="img/eye_gray.png" /> <%=readCount%>
    <img src="img/comment_gray.png" /> <span class="comment-count"><%=commentCount%></span>
    <img src="img/fabulous_gray.png" /> <span class="fabulous-count"><%=fabulousCount%></span>
  </footer>
</article>