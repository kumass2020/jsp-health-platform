<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		ArrayList list = (ArrayList)session.getAttribute("productlist");
		int price = 0;
		if(list==null) {
			out.println("선택한 상품이 없습니다.");
		}
		else {
			if (list.contains("수학의정석")) {
				price += 1000;
			}else if(list.contains("숨마쿰라우데")) {
				price += 2000;
			}else if(list.contains("블랙라벨")) {
				price += 3000;
			}else if(list.contains("개념원리")) {
				price += 4000;
			}else if(list.contains("하이탑")) {
				price += 5000;
			}
			for(Object productname:list) {
				out.println(productname+"<BR>");
			}
			out.println("총 " + Integer.toString(price) + "원입니다.");
		}
	%>
</body>
</html>