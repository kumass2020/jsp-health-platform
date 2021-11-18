<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.*"%> 

<html>

<head>

<title>Database SQL</title>

</head>

<body>

<%

Connection conn = null;

try {

String url = "jdbc:mysql://localhost:3306/jdbc_db?serverTimezone=Asia/Seoul";

String user = "root";

String password = "8820";  // 실제 비번 입력



Class.forName("com.mysql.jdbc.Driver");

conn = DriverManager.getConnection(url, user, password);

out.println("데이터베이스 연결이 성공되었습니다.");

} catch (SQLException ex) {

out.println("데이터베이스 연결이 실패되었습니다.<br>");

out.println("SQLException: " + ex.getMessage());

} finally {

if (conn != null)

conn.close();

}

%>

</body>

</html>

