<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="healthPlatform_error.jsp" import="java.util.*, jspbook.healthPlatform.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(gym_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="healthPlatform_control.jsp?action=gymEdit&gym_id="+gym_id+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>
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
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

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
          	<button type="button" class="btn btn-primary me-3" onclick="location.href='user_list.jsp'">Logout</button>
          <% session.invalidate();} %>
          </div>
        </div>
        <!-- Collapsible wrapper -->
      </div>
      <!-- Container wrapper -->
    </nav>
    
    <div class="my-5"></div>
    
   <h3>헬스장 목록</h3>
   <hr style="max-width:850px"> 
    <!-- Navbar -->
   
 
   [<a href=gym_form.jsp>헬스장 등록</a>]<p>
   

   
<form>
		<table border="1">
			<tr><th>번호</th><th>이 름</th><th>주소</th><th>트레이너</th></tr>
			<%
				for(Gym  hp : (ArrayList<Gym>)datas) {
			%>
			  <tr>
			   <td><a href="javascript:check(<%=hp.getGym_id()%>)"><%=hp.getGym_id() %></a></td>
				<td><%=hp.getGym_name() %></td>
				<td><%=hp.getGym_address() %></td>
				<td><%=hp.getUser_id() %></td>
			  </tr>
			 <%
				}
			 %>
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