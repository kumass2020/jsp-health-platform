<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form02_process.jsp" method="POST">
		<p> 도서번호 : <input type="text" name="booknumber" placeholder="ISBN0000">
		<p>	도서명 : <input type="text" name="bookname">
		<p>	저자 : <input type="text" name="writer">
		<p>	출판사 : <select name="publisher" size="3">
				<option value="가출판사">가출판사</option>
				<option value="나출판사">나출판사</option>
				<option value="다출판사">다출판사</option>
				<option value="라출판사">라출판사</option>
				<option value="머출판사">마출판사</option>	
			</select>
		<p> 상태 : <input type="checkbox" name="condition1" value="신규도서">신규도서	
				<input type="checkbox" name="condition2" value="중고도서">중고도서
				<input type="checkbox" name="condition3" value="E-book">E-book
		<p> 상세정보 : <textarea name="detail" cols="30" rows="3"></textarea>
		<p> <input type="submit" value="전송" />
		<p> <input type="reset" value="취소" />
				
	</form>
</body>
</html>