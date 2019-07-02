<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
  request.setCharacterEncoding("utf-8");
  String msg ="";
  String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
          + "?autoReconnect=true&useUnicode=true"
          + "&characterEncoding=UTF-8"; 
  String info = request.getParameter("inf");
  if (info == null) info = "";
  StringBuilder table=new StringBuilder("");
  table.append("<table>");
  table.append("<tr><th>id</th><th>学号</th><th>姓名</th><th>-</th></tr></tr>");
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, 
                   "user", "123");
    Statement stmt=con.createStatement();
    if (request.getParameter("sub") == null) {
        ResultSet rs = stmt.executeQuery("select * from stu");
        while(rs.next()) {
        table.append("<tr>");
        table.append("<td>" + rs.getString("id") + "</td>");
        table.append("<td>" + rs.getString("num") + "</td>");
        table.append("<td>" + rs.getString("name") + "</td>");
        table.append("<td>" + "<a href='updateStu.jsp?pid=" + rs.getString("id") + "'>修改</a> " + "<a href='deleteStu.jsp?pid=" + rs.getString("id") + "'>删除</a></td>");
        table.append("</tr>");
        }
        rs.close();
    }
    else {
        ResultSet rs = stmt.executeQuery("select * from stu where num like '%" + info + "%' or name like '%" + info +"%'");
        while(rs.next()) {
        table.append("<tr>");
        table.append("<td>" + rs.getString("id") + "</td>");
        table.append("<td>" + rs.getString("num") + "</td>");
        table.append("<td>" + rs.getString("name") + "</td>");
        table.append("<td>" + "<a href='updateStu.jsp?pid=" + rs.getString("id") + "'>修改</a> " + "<a href='deleteStu.jsp?pid=" + rs.getString("id") + "'>删除</a></td>");
        table.append("</tr>");
        }
        rs.close();
    }
    stmt.close();
    con.close();
  }
  catch (Exception e){
    msg += e.getMessage();
  }
  table.append("</table>");
%><!DOCTYPE HTML>
<html>
<head>
<style>
  td, th {
    border: solid 1px black;
    width: 15rem;
    height: 2rem;
  }
  a:link, a:visited {
    color: blue;
  }
  .container {
    margin: auto;
    width: 500px;
    text-align: center;
  }
  table {
    border-collapse: collapse;
  }
</style>
<title>查询学生名单</title>
</head>
<body>
  <div class="container">
    <h1>查询学生名单</h1>
    <form action="queryStu.jsp" method="post" name="f">
    输入查询：<input id="inf" name="inf" type="text" value="<%=info%>">
    <input type="submit" name="sub" value="查询"><br><br>
    </form>  
    <div><%=table%></div><br><br>  
    <div style="float:left">
      <a href="addStu.jsp">新增</a>
      <a href="browseStu.jsp">返回</a>
    </div><br><br>
  </div>
</body>
</html>
