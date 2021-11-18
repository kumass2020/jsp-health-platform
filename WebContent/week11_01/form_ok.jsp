<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file ="dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String sno =request.getParameter("sno");
String sname =request.getParameter("sname");
String kor =request.getParameter("kor");
String eng =request.getParameter("eng");
String math =request.getParameter("math");
String hist =request.getParameter("hist");

String sql="INSERT INTO examtbl (sno,sname,kor,eng,math,hist) VALUES (?,?,?,?,?,?)";
pstmt = con.prepareStatement(sql);

pstmt.setString(1,sno);
pstmt.setString(2,sname);
pstmt.setString(3,kor);
pstmt.setString(4,eng);
pstmt.setString(5,math);
pstmt.setString(6,hist);

pstmt.executeUpdate();

response.sendRedirect("list.jsp");
pstmt.close();
con.close(); 	
%>
</head>
<body>
<section>


</section>

</body>
</html>