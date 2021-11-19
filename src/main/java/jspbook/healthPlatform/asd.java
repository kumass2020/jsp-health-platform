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