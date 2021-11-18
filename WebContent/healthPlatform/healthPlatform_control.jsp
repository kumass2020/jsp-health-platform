<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="healthPlatform_error.jsp" import="jspbook.healthPlatform.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="hp" class="jspbook.healthPlatform.HealthBean"/>
<jsp:useBean id="user" class="jspbook.healthPlatform.User"/>
<jsp:setProperty property="*" name="user"/>

<%
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	
	// 파라미터에 따른 요청 처리
	// 유저 목록 요청 시
	if(action.equals("userList")) {
		ArrayList<User> datas = hp.getUserDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("user_list.jsp");
	}
	// 유저 등록 요청 시
	else if(action.equals("userInsert")) {
		if(hp.insertUserDB(user)) {
			response.sendRedirect("healthPlatform_control.jsp?action=userList");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 유저 수정 페이지 요청 시
	else if(action.equals("userEdit")) {
		User _user = hp.getUserDB(user.getUser_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("hp", _user);
			pageContext.forward("user_edit_form.jsp");
		}
	}
	// 유저 수정 등록 요청인 경우
	else if(action.equals("userUpdate")) {
		if(hp.updateUserDB(user)) {
			response.sendRedirect("healthPlatform_control.jsp?action=userList");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if (action.equals("userDelete")) {
		if(hp.updateUserDB(user)) {
			response.sendRedirect("healthPlatform_control.jsp?action=userList");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
%>