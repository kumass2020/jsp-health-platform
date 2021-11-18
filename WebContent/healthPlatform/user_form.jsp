<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="healthPlatform_error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 정보:작성화면</title>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>유저 정보:작성화면 </H2>
<HR>
[<a href=healthplatform_control.jsp?action=userList>주소록 목록으로</a>] <P>
<form name=form1 method=post action=healthPlatform_control.jsp>
<input type=hidden name="action" value="userInsert">

<table border="1">
  <tr>
    <th>이 름</th>	
    <td><input type="text" name="user_name" maxlength="15"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="email" name="user_email" maxlength="50"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="user_phone_num" maxlength="20"></td>
  </tr>
  <tr>
    <th>생 일</th>
    <td><input type="date" name="user_birth"></td>
  </tr>  
  <tr>
    <th>회 사</th>
    <td><input type="text" name="user_comdept" maxlength="20"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="user_memo"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</div>
</body>
</html>