<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="healthPlatform_error.jsp" import="jspbook.healthPlatform.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="userDelete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:수정화면</title>
<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
  rel="stylesheet"
/>
</head>

<jsp:useBean id="hp" scope="request" class="jspbook.healthPlatform.User" />

<body>
<div align="center">
<H2>유저:수정화면 </H2>
<HR>
[<a href=healthPlatform_control.jsp?action=userList>유저 목록으로</a>] <p>
<form name=form1 method=post action=healthPlatform_control.jsp>
<input type=hidden name="user_id" value="<%=hp.getUser_id()%>">
<input type=hidden name="action" value="userUpdate">

<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="user_name" value="<%=hp.getUser_name() %>"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="text" name="user_email" value="<%=hp.getUser_email() %>"></td>
  </tr>
    <tr>
    <th>전화번호</th>
    <td><input type="text" name="user_phone_num" value="<%=hp.getUser_phone_num() %>"></td>
  </tr>
      <tr>
    <th>생 일</th>
    <td><input type="date" name="user_birth" value="<%=hp.getUser_birth() %>"></td>
  </tr>
  <tr>
    <th>메 모</th>
    <td><input type="text" name="user_memo" value="<%=hp.getUser_memo() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.js"
></script>
</body>
</html>