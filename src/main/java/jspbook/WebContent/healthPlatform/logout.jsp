<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="healthPlatform_error.jsp" %>
    
<% request.setCharacterEncoding("utf-8"); %>

<%
	session.invalidate();
	pageContext.forward("user_list.jsp");
%>