<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 학번 : <%=request.getParameter("number") %>
	<%
		String major = request.getParameter("major");
	%>
	<p> 학과 : <%=java.net.URLDecoder.decode(major) %>
	<%
		String name = request.getParameter("name");
	%>
	<p> 이름 : <%=java.net.URLDecoder.decode(name) %>
</body>
</html>