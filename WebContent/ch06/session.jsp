<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>session ����</h2>
<hr>
<%
	if(session.isNew()) {
		out.println("<script> alert('������ �����Ǿ� �ٽ� �����մϴ�.')</script>");
		session.setAttribute("login", "Ȧ�浿");
		session.setMaxInactiveInterval(10);
	}
%>
# <%= session.getAttribute("login") %>�� ȯ���մϴ�.!!<br>
1. ���� ID : <%= session.getId() %> <br>
2. ���� �����ð� : <%= session.getMaxInactiveInterval() 	%> <br>
</body>
</html>