<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="second.jsp">
		<jsp:param name="number" value="201935256" />
		<jsp:param name="major" value="컴퓨터공학과" />
		<jsp:param name="name" value="문지환" />
	</jsp:forward>
</body>
</html>