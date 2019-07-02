
<%@ page import="java.util.*,java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/sign_up.css">
    <meta name="Description" content="666的博客,心随你动!" />
    <script type="module" src="js/DOM.js"></script>
    <script type="module">
        import { SignUp } from "/js/DOM.js";
        window.onload = () => { new SignUp();}
    </script>
</head>
<body>
<div class="signup_box">
    <p class="sign-title">
        <span>欢迎进入啦啦博客网，请注册</span>
    </p>
        <p class="input-area">
            <label for="username" class="username-label"> 请输入用户名： </label>
            <input id="username" name="username" required="required" type="text" placeholder="例:  小明" />
        </p>
        <p class="input-area">
            <label for="password" class="password-label"> 请输入密码： </label>
            <input id="password" name="password" required="required" type="password" />
        </p>
        <p class="input-area">
            <label for="re-password" class="re-password-label"> 请重复输入密码： </label>
            <input id="re-password" name="password" required="required" type="password" />
        </p>
        <button type="submit" id="submitbutton">注 册</button>
    <p class="change_link">
        已有账号？
        <a href="sign_in.jsp" class="to-register">去登录</a>
    </p>

</div>
</body>
<footer>&copy;2019-2030 啦啦啦</footer>

</html>

