<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");
  if (request.getParameter("submit2") != null)
    response.sendRedirect("http://172.18.187.6/");%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>注册</title>
  </head>  
  <body>
    id: <%= request.getParameter("stuid") %><br>
    同学名: <%= request.getParameter("name") %><br>
    密码: <%= request.getParameter("password") %><br>
    校区: <%= request.getParameter("campus") %><br>
    社团：<% 
      out.print("[");
      String[] values=null;
      if(request.getMethod().equalsIgnoreCase("post"))
        values = request.getParameterValues("club");
      if(values != null) out.print(values[0]);
      for(int i = 1; i < values.length; i++)
          out.print(", " + values[i]);
      out.println("]");
    %><br>
    年级: <%= request.getParameter("grade") %><br>
    说明: <%= request.getParameter("explain") %><br>
    submit1：<%= request.getParameter("submit1") %><br>
    submit2：<%= request.getParameter("submit2") %><br>
  </body>
</html>