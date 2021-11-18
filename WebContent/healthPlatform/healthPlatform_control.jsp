<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="addrbook_error.jsp" import="jspbook.addrbook.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="hp" class="jspbook.healthPlatform.HealthBean"/>
<jsp:useBean id="user" class="jspbook.healthPlatform.User"/>
<jsp:setProperty property="*" name="user"/>

<%
	String action = request.getParameter("action");
	
	if(action.equals("userList")) {
		ArrayList<user> datas = hp.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("addrbook_list.jsp");
	}
	else if(action.equals("insert")) {
		if(hp.insertDB(user)) {
			
%>