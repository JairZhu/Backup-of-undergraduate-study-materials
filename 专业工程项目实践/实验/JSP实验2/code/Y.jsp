<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<% String course = (String) session.getAttribute("course");
  String id = session.getId();
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Session Y</title>
</head>
<body>
  <h1>Session Y</h1>
  session ID:<%=id%><br><br>
  course:<%=course%><br><br>
  <a href="X.jsp">X.jsp</a><br><br>
  <a href="Z.jsp">Z.jsp</a><br><br>
</body>
</html>