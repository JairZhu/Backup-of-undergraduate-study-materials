<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String msg =" ";
  String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
          + "?autoReconnect=true&useUnicode=true"
          + "&characterEncoding=UTF-8"; 
  String pid = request.getParameter("pid");
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, 
                   "user", "123");
    Statement stmt=con.createStatement();
    stmt.executeUpdate(String.format("delete from stu where id=%s", pid));
    msg = "Delete Success!";  
    stmt.close();
    con.close();
  }
  catch (Exception e){
    msg = "Delete Failure!\n" + e.getMessage();
  }
%>
<!DOCTYPE HTML>
<html>
<head>
<style>
  .container {
    margin: auto;
    width: 500px;
    text-align: center;
  }
</style>
<title>删除学生记录</title>
</head>
<body>
    <div class="container">
    <h1>删除学生记录</h1>
    <%= msg%><br><br>
    <a href='browseStu.jsp'>返回</a>
    </div>
</body>
</html>
