<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<h2>점심 메뉴 주문</h2>
	<hr>
	<table border=1 cellspacing="1" cellpadding="5">
	<tr>
	<td>주문자</td>
	<td><%=request.getParameter("username") %></td>
	<tr>
	<td>결제방식</td>
	<td><%=request.getParameter("paytype") %></td>
	<tr>
	<td>메뉴</td>

	<td>
	<%
		
		String menus[] = request.getParameterValues("menu");
		if (menus == null) {
			out.println("선택한 메뉴가 없습니다.");
		} else {
			for(String menu : menus) {
				out.println(menu + "<BR>");
			}
		}
	%>
	</table>
	
	<hr>
	<h2>request 테스트 결과 - 2</h2>
	<table border=0><tr><td></table>
	1. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %> <br>
	2. 요청 메서드 : <%= request.getMethod() %> <br>
	<%
		Cookie cookie[] = request.getCookies();
	%>
	3. <%= cookie[0].getName() %>에 설정된 쿠키 값 : <%=cookie[0].getValue() %><br>
	4. 프로토콜 : <%= request.getProtocol() %>
	</td></tr>
	</table>
</body>
</html>