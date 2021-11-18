<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<%
	
			request.setCharacterEncoding("UTF-8");
		
			Enumeration paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String name = (String)paramNames.nextElement();
				out.print("<tr><td>" + name + " </td>\n ");
				String paramValue = request.getParameter(name);
				out.println("<td>" + paramValue + "</td></tr>\n");
			}
			
		%>
	</table>
</body>
</html>