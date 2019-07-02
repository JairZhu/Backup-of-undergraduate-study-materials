<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<% String course = (String) session.getAttribute("course");
  String id = session.getId();
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session Z</title>
</head>
<body>
  <h1>Session Z</h1>
  session ID:<%=id%><br><br>
  course:<%=course%><br><br>
  <a href="X.jsp">X.jsp</a><br><br>
  <a href="Y.jsp">Y.jsp</a><br><br> 
</body>
</html>