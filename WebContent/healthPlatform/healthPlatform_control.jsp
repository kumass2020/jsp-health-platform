<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  errorPage="healthPlatform_error.jsp" import="jspbook.healthPlatform.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="hp" class="jspbook.healthPlatform.HealthBean"/>
<jsp:useBean id="user" class="jspbook.healthPlatform.User"/>
<jsp:useBean id="gym" class="jspbook.healthPlatform.Gym"/>
<jsp:useBean id="reservation" class="jspbook.healthPlatform.Reservation"/>
<jsp:useBean id="time" class="jspbook.healthPlatform.Time"/>
<jsp:setProperty property="*" name="user"/>
<jsp:setProperty property="*" name="gym"/>
<jsp:setProperty property="*" name="reservation"/>
<jsp:setProperty property="*" name="time"/>

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
		if(!pw.equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			session.setAttribute("id", id);
			session.setAttribute("pw", "1234");
			User _user = hp.getUserDB(Integer.parseInt(id));
			request.setAttribute("hp", _user);
			pageContext.forward("user_list.jsp");
		}
	} 
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
	
	if(action.equals("search")) {
		int flag = 0;

		String ch1 = request.getParameter("ch1");
		Object ch2 = request.getParameter("ch2");
		
/* 		if(ch1.equals("번호")) {
			ch2 = Integer.parseInt(ch2);
			flag = 1;
		}
		
		ch2 = Integer.parseInt(ch2); */
		
		ArrayList<User> datas = hp.searchUserDB(ch1, ch2);
		request.setAttribute("datas", datas);
		pageContext.forward("user_list.jsp");
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
	
	if(action.equals("reservationList")) {
		ArrayList<Reservation> datas = hp.getReservationDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("reservation_list.jsp");
	}
	// 유저 등록 요청 시
	else if(action.equals("reservationInsert")) {
		if(hp.insertReservationDB(reservation)) {
			response.sendRedirect("healthPlatform_control.jsp?action=reservationList");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 유저 수정 페이지 요청 시
	else if(action.equals("reservationEdit")) {
		Reservation _reservation = hp.getReservationDB(reservation.getReservation_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("hp", _reservation);
			pageContext.forward("reservation_edit_form.jsp");
		}
	}
	// 유저 수정 등록 요청인 경우
	else if(action.equals("reservationUpdate")) {
		if(hp.updateReservationDB(reservation)) {
			response.sendRedirect("healthPlatform_control.jsp?action=reservationList");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if (action.equals("reservationDelete")) {
		if(hp.deleteReservationDB(reservation.getReservation_id())) {
			response.sendRedirect("healthPlatform_control.jsp?action=reservationList");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
	
	if(action.equals("timeList")) {
		ArrayList<Time> datas = hp.getTimeDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("time_list.jsp");
	}
	// 유저 등록 요청 시
	else if(action.equals("timeInsert")) {
		if(hp.insertTimeDB(time)) {
			response.sendRedirect("healthPlatform_control.jsp?action=timeList");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 유저 수정 페이지 요청 시
	else if(action.equals("timeEdit")) {
		Time _time = hp.getTimeDB(time.getTime_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<scrtipt>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("hp", _time);
			pageContext.forward("time_edit_form.jsp");
		}
	}
	// 유저 수정 등록 요청인 경우
	else if(action.equals("timeUpdate")) {
		if(hp.updateTimeDB(time)) {
			response.sendRedirect("healthPlatform_control.jsp?action=timeList");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if (action.equals("timeDelete")) {
		if(hp.deleteTimeDB(time.getTime_id())) {
			response.sendRedirect("healthPlatform_control.jsp?action=timeList");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요.')</script>");
	}
%>