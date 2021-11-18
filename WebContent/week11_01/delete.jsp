<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="top.jsp" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<section>

<hr>
<br><br>
	<% String delNo = request.getParameter("sno");
	String delName = request.getParameter("sname"); %>
	번 호 : <%=delNo %> 
	이 름 : <%=delName %> [삭제되었습니다.]
	<%
	String sql = "delete from examtbl where sno=?";
	 pstmt = con.prepareStatement(sql);
	 pstmt.setString(1,delNo);
     pstmt.executeUpdate();
	%>
<br><br>
<hr>
<a href="list.jsp"><button>목록으로</button></a>
</section>
</body>
</html>
<%@ include file ="footer.jsp" %>