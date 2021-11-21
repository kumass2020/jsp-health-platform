<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="healthPlatform_error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 정보:작성화면</title>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />
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
    
   <h3>유저 정보:작성화면</h3>
   <hr style="max-width:850px"> 
    <!-- Navbar -->
   
[<a href=healthPlatform_control.jsp?action=userList>유저 목록으로</a>] <P>
<form name=form1 method=post action=healthPlatform_control.jsp>
<input type=hidden name="action" value="userInsert">

<table border="1">
  <tr>
    <th>이 름</th>	
    <td><input type="text" name="user_name" maxlength="15"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="email" name="user_email" maxlength="50"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="user_phone_num" maxlength="20"></td>
  </tr>
  <tr>
    <th>생 일</th>
    <td><input type="date" name="user_birth"></td>
  </tr>  
  <tr>
    <th>메 모</th>
    <td><input type="text" name="user_memo"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
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