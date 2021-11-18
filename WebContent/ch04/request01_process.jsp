<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="request01_process.jsp" method="post">
		<%
			request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("id");
		String password = request.getParameter("passwd");
		String name = request.getParameter("name");
		%>
		<p> 아이디 : <%=userid %>
		<p> 비밀번호 : <%=password %>
		<p> 이름 : <%=name %>
	</form>
</body>
</html>