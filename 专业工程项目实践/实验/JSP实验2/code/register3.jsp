<%@ page language="java" import="java.util.*" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
  String submit1 = request.getParameter("submit1");
  String submit2 = request.getParameter("submit2");
  String method = request.getMethod();
  boolean post = method.equalsIgnoreCase("post");
  String name = request.getParameter("name");
  if(name==null) name="";
  else name += "*";
  String stuid = request.getParameter("stuid");
	if(stuid==null) stuid="";
	String password = request.getParameter("password");
	if(password==null) password="";
	String campus = request.getParameter("campus");
	if(campus==null) campus="";
	String campuss[]= {"","","","",""};
  if(campus.equals("south"))
    campuss[0] = "checked";
  else if(campus.equals("east"))
    campuss[1] = "checked";
  else if(campus.equals("north"))
    campuss[2] = "checked";
  else if(campus.equals("zhuhai"))
    campuss[3] = "checked";
  else if(campus.equals("shenzhen"))
    campuss[4] = "checked";
	String grade = request.getParameter("grade");
	if(grade==null) grade="";
	String grades[]= {"","","",""};
  if(grade.equals("freshman"))
    grades[0] = "selected";
  else if(grade.equals("sophomore"))
    grades[1] = "selected";
  else if(grade.equals("junior"))
    grades[2] = "selected";
  else if(grade.equals("senior"))
    grades[3] = "selected";
  String[] values={"","",""};
  if(request.getMethod().equalsIgnoreCase("post"))
    values = request.getParameterValues("club");
  String clubs[]= {"","",""};
  for(int i = 0 ; i < values.length ; i++)
    if(values[i].equals("dance"))
      clubs[0] = "checked";
    else if(values[i].equals("photo"))
      clubs[1] = "checked";
    else if(values[i].equals("basketball"))
      clubs[2] = "checked";
  String explain = request.getParameter("explain");
  if(explain==null) explain="";
  else explain += "*";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册</title>
  </head>  
  <body>
    <form action="register3.jsp" method="post">
      <input type="hidden" name="stuid" value="<%=stuid%>"/>
      同学名：<input type="text" id="txt1" name="name" value="<%=name%>"/><br><br>
      密码：<input type="password" name="password" value="<%=password%>"/><br><br>
      校区：南校区<input type="radio" name="campus" value="south" <%=campuss[0]%>/>
            东校区<input type="radio" name="campus" value="east" <%=campuss[1]%>/>
            北校区<input type="radio" name="campus" value="north" <%=campuss[2]%>/>
            珠海校区<input type="radio" name="campus" value="zhuhai" <%=campuss[3]%>/>
            深圳校区<input type="radio" name="campus" value="shenzhen" <%=campuss[4]%>/><br><br>
      年级：<select name="grade">
              <option value="freshman" <%=grades[0]%>>大学一年级</option>
              <option value="sophomore" <%=grades[1]%>>大学二年级</option>
              <option value="junior" <%=grades[2]%>>大学三年级</option>
              <option value="senior" <%=grades[3]%>>大学四年级</option>
          </select><br><br>   
      社团：舞蹈队<input type="checkbox" name="club" value="dance" <%=clubs[0]%>/>
            摄影<input type="checkbox" name="club" value="photo" <%=clubs[1]%>/>
            篮球<input type="checkbox" name="club" value="basketball" <%=clubs[2]%>/><br><br>
      <table>
        <tr>
          <td valign="top">说明: </td>
          <td><textarea rows="5" cols="30" name="explain" ><%=explain%></textarea></td>
        </tr>
      </table>
      <input type="submit" name="submit1" value="保存" />
      <input type="submit" name="submit2" value="退出" /><br>
    </form>
  </body>
</html>