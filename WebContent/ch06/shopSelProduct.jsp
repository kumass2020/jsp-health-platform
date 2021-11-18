<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		session.setAttribute("username", request.getParameter("username"));
		
	%>
	
	<h2>상품 선택</h2>
	<hr>
	<%=session.getAttribute("username") %>님이 로그인한 상태입니다.
	<hr>
	<form name="form1" method="POST" action="shopAdd.jsp">
		<select name="product">
			<option value="수학의정석">수학의정석 1000</option>
			<option value="숨마쿰라우데">숨마쿰라우데 2000</option>
			<option value="블랙라벨">블랙라벨 3000</option>
			<option value="개념원리">개념원리 4000</option>
			<option value="하이탑">하이탑 5000</option>
		</select>
		<input type="submit" value="추가" />
	</form>
	<a href="shopCheckOut.jsp">계산</a>
</body>
</html>