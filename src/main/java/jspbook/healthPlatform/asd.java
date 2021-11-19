	if(action.equals("gymList")) {
		ArrayList<Gym> datas = hp.getGymDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("gym_list.jsp");
	}
	// ���� ��� ��û ��
	else if(action.equals("gymInsert")) {
		if(hp.insertGymDB(gym)) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB �Է¿���");
	}
	// ���� ���� ������ ��û ��
	else if(action.equals("gymEdit")) {
		Gym _gym = hp.getGymDB(gym.getGym_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<scrtipt>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("hp", _gym);
			pageContext.forward("gym_edit_form.jsp");
		}
	}
	// ���� ���� ��� ��û�� ���
	else if(action.equals("gymUpdate")) {
		if(hp.updateGymDB(gym)) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB ���ſ���");
	}
	// �ּҷ� ���� ��û�� ���
	else if (action.equals("gymDelete")) {
		if(hp.deleteGymDB(gym.getGym_id())) {
			response.sendRedirect("healthPlatform_control.jsp?action=gymList");
		}
		else
			throw new Exception("DB ���� ����");
	}
	else {
		out.println("<script>alert('action �Ķ���͸� Ȯ���� �ּ���.')</script>");
	}