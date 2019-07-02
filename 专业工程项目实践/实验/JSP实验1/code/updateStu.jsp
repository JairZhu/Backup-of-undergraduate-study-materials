<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String msg =" ";
  String connectString = "jdbc:mysql://172.18.187.6:3306/teaching"
          + "?autoReconnect=true&useUnicode=true"
          + "&characterEncoding=UTF-8"; 
  String num = request.getParameter("num");
  String name = request.getParameter("name");
  String pid = request.getParameter("pid");
  if (num == null) num = "";
  if (name == null) name = "";
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, 
                   "user", "123");
    Statement stmt=con.createStatement();
    if (request.getParameter("sub") == null) {
        ResultSet rs = stmt.executeQuery("select * from stu where id=" + pid);
        if(rs.next()){
            num = rs.getString("num");
            name = rs.getString("name");
        }
    }
    else{
      if (!num.isEmpty() && !name.isEmpty()) {
            int tmp = stmt.executeUpdate("update stu set num='" + num + "', name='" + name + "' where id=" + pid);
            msg = "Update Success!";
        }
        else 
            msg = "Update Failure!";
    }   
    stmt.close();
    con.close();
  }
  catch (Exception e){
    msg = "Update Failure!\n" + e.getMessage();
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
<title>修改学生记录</title>
</head>
<body>
    <div class="container">
    <h1>修改学生记录</h1>
    <form action="updateStu.jsp?pid=<%=pid%>" method="post" name="f">
      学号：<input id="num" name="num" type="text" value="<%=num%>"><br><br>
      姓名：<input id="name" name="name" type="text" value="<%=name%>"><br><br>
      <input type="submit" name="sub" value="修改">
      <input type="reset" name="reset" value="清空"><br><br>
    </form>
    <%= msg%><br><br>
    <a href='browseStu.jsp'>返回</a>
    </div>
</body>
</html>
