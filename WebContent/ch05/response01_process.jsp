<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
		String number = request.getParameter("number");
		String major = request.getParameter("major");
		String name = request.getParameter("name");
		
		if (number.equals("201935256") && name.equals("문지환")) {
			response.sendRedirect("response01_success.jsp");
		} else {
			response.sendRedirect("response01_failed.jsp");
		}
	%>
</body>
</html>