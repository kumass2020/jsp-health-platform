<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="healthPlatform_error.jsp" import="jspbook.healthPlatform.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />

<script type="text/javascript">
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="reservationDelete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약:수정화면</title>
<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css"
  rel="stylesheet"
/>
</head>

<jsp:useBean id="hp" scope="request" class="jspbook.healthPlatform.Reservation" />

<body>
<div align="center"> 
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <!-- Container wrapper -->
      <div class="container">
        <!-- Navbar brand -->
        <a class="navbar-brand me-2" href="healthPlatform_control.jsp?action=userList">
          <img
            src="logo.png"
            height="40"
            alt=""
            loading="lazy"
            style="margin-top: -1px"
            width="80"
          />
        </a>

        <!-- Toggle button -->
        <button
          class="navbar-toggler"
          type="button"
          data-mdb-toggle="collapse"
          data-mdb-target="#navbarButtonsExample"
          aria-controls="navbarButtonsExample"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarButtonsExample">
          <!-- Left links -->
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="#">
                <!-- link something -->
              </a>
            </li>
          </ul>

          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="healthPlatform_control.jsp?action=userList">유저목록</a>
            </li>
          </ul>

          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="healthPlatform_control.jsp?action=gymList">헬스장</a>
            </li>
          </ul>

          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="healthPlatform_control.jsp?action=reservationList">예약</a>
            </li>
          </ul>
          
		  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="healthPlatform_control.jsp?action=timeList">운동시간</a>
            </li>
          </ul>
          <!-- Left links -->
			
          <div class="d-flex align-items-center">
          <% if ((String)session.getAttribute("id") == null) {%>	
            <button
              type="button"
              class="btn btn-link px-3 me-2"
              onclick="location.href='sessionLogin.jsp'"
            >
              Login
            </button>
            <button type="button" class="btn btn-primary me-3" onclick="location.href='user_form.jsp'">Sign up</button>
          <% }else {%>
          	<button type="button" class="btn btn-primary me-3" onclick="location.href='logout.jsp'">Logout</button>
          <% } %>
          </div>
        </div>
        <!-- Collapsible wrapper -->
      </div>
      <!-- Container wrapper -->
    </nav>
    
    <div class="my-5"></div>
    
   <h3>예약:수정화면</h3>
   <hr style="max-width:850px"> 
    <!-- Navbar -->
   

[<a href=healthPlatform_control.jsp?action=reservationList>예약 목록으로</a>] <p>
<form name=form1 method=post action=healthPlatform_control.jsp>
<input type=hidden name="reservation_id" value="<%=hp.getReservation_id()%>">
<input type=hidden name="action" value="reservationUpdate">

<table border="1">
  <tr>
    <th>이 름</th>
    <td><input type="text" name="reservation_time" value="<%=hp.getReservation_time() %>"></td>
  </tr>
  <tr>
    <th>주 소</th>
    <td><input type="number" name="gym_id" value="<%=hp.getGym_id() %>"></td>
  </tr>
    <tr>
    <th>트레이너</th>
    <td><input type="number" name="user_id" value="<%=hp.getUser_id() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>

</div>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.js"
></script>
</body>
</html>