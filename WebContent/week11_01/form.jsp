<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<br><br>
<font size=4 align="center"><u>[ - 성적을 입력해주세요 - ]</u></font>
<br><br>
<form name="f1" action="form_ok.jsp" method="GET">
<table border=1 align="center" bgcolor="#DB8383" width="250" height="250">
<tr>
	<td>번 호</td><td><input type="text" name="sno" /></td>
</tr>
<tr>
	<td>이 름</td><td><input type="text" name="sname" /></td>
</tr>
<tr>
	<td>국 어</td><td><input type="number" name="kor" /></td>
</tr>
<tr>
	<td>영 어</td><td><input type="number" name="eng" /></td>
</tr>
<tr>
	<td>수 학</td><td><input type="number" name="math" /></td>
</tr>
<tr>
	<td>역 사</td><td><input type="number" name="hist" /></td>
</tr>
</table>
<br>
<input type="submit" value="저장" />
<input type="reset" value="다시입력" />
</form>

</section>

</body>
</html>
<%@ include file="footer.jsp" %>