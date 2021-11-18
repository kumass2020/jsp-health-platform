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
		request.setCharacterEncoding("UTF-8");
	
		String booknumber = request.getParameter("booknumber");
		String bookname = request.getParameter("bookname");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		String condition1 = request.getParameter("condition1");
		String condition2 = request.getParameter("condition2");
		String condition3 = request.getParameter("condition3");
		String detail = request.getParameter("detail");
	%>
	<p> 도서번호 : <%=booknumber %>
	<p> 도서명 : <%=bookname %>
	<p> 저자 : <%=writer %>
	<p> 출판사 : <%=publisher %>
	<p> 상태 : <%=condition1 %>, <%=condition2 %>, <%=condition3 %>
	<p> 상세정보 : <%=detail %> 
</body>
</html>