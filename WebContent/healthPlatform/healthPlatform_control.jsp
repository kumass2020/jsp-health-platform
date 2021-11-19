<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="healthPlatform_error.jsp" import="jspbook.healthPlatform.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="hp" class="jspbook.healthPlatform.HealthBean"/>
<jsp:useBean id="user" class="jspbook.healthPlatform.User"/>
<jsp:useBean id="gym" class="jspbook.healthPlatform.Gym"/>
<jsp:setProperty property="*" name="user"/>
<jsp:setProperty property="*" name="gym"/>

<%
	//post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

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
		if(pw.equals(user.getUser_id())) {
			response.sendRedirect("healthPlatform_control.jsp?action=userList");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else if (action.equals("userLogin")) {
		User _user = hp.getUserDB(user.getUser_id());
		if(!pw.equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			session.setAttribute("id", id);
			session.setAttribute("pw", "1234");
			request.setAttribute("hp", _user);
			pageContext.forward("user_list.jsp");
		}
	} 
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
	
	if(action.equals("gymList")) {
		ArrayList<Gym> datas = hp.getGymDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("gym_list.jsp");
	}
	// 유저 등록 요청 시
	else if(action.equals("gymInsert")) {
		if(hp.insertGymDB(gym)) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 유저 수정 페이지 요청 시
	else if(action.equals("gymEdit")) {
		Gym _gym = hp.getGymDB(gym.getGym_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("hp", _gym);
			pageContext.forward("gym_edit_form.jsp");
		}
	}
	// 유저 수정 등록 요청인 경우
	else if(action.equals("gymUpdate")) {
		if(hp.updateGymDB(gym)) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if (action.equals("gymDelete")) {
		if(hp.deleteGymDB(gym.getGym_id())) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
%>