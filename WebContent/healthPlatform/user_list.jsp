<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="user_error.jsp" import="java.util.*, jspbook.healthplatfrom.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="healthplatform.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(user_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="healthPlatform_control.jsp?action=userEdit&user_id="+user_id+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록:목록화면</title>

</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body>
<div align="center"> 
<H2>유저 목록화면</H2>
<HR>

<form>
<a href="user_form.jsp">주소록 등록</a><P>

		<table border="1">
			<tr><th>번호</th><th>이 름</th><th>전화번호</th><th>생 일</th><th>회 사</th><th>메 모</th></tr>
			<%
				for(User  hp : (ArrayList<User>)datas) {
			%>
			  <tr>
			   <td><a href="javascript:check(<%=hp.getUser_id()%>)"><%=hp.getUser_id() %></a></td>
				<td><%=hp.getUser_name() %></td>
				<td><%=hp.getUser_phone_num() %></td>
				<td><%=hp.getUser_birth() %></td>
				<td><%=hp.getUser_memo() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>
</div>
</body>
</html>