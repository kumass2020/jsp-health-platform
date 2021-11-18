<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	 Connection con =null;
	 PreparedStatement pstmt = null ;
	 ResultSet rs  = null;
	 
     String  jdbc = "jdbc:mysql://localhost:3306/jdbc_db";
     String  id = "root";
     String  pwd = "8820";

	Class.forName("com.mysql.jdbc.Driver"); 
 	con = DriverManager.getConnection(jdbc,id,pwd); 
%>