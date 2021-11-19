<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div align="center">
<H2>로그인</H2>
<HR>
<form action="healthPlatform_control.jsp?action=userLogin" method="post">
ID : <input type="text" name="id"><br />
PW : <input type="password" name="pw"><br />
<input type="submit" value="Login">
</form>
</div>
</body>
</html>