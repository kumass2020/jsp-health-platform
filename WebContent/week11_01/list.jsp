<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ include file="dbcon.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<% 
String sql = "SELECT * FROM examtbl";
       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();

/* out.println("Connection : " + con);
if(con != null)	{	
	out.println("Database Connect : [ " + " <b>success</b> ]<br>");
}else{	
	out.println("Database Connect : [ " + " <b>fail</b> ]<br>");
}; */

%>
<br><br>
<font size=4 align="center"><u>성적 확인</u></font>
<br><br>
<table border=1 align="center">
	<tr bgcolor="#C9A3B6">
	<td>번호 </td> <td>이름 </td>
	<td>국어 </td> <td>영어 </td> 
	<td>수학 </td> <td>역사 </td>
	<td>합계 </td> <td>평균 </td> 
	</tr>
<%	
int count=0;
String bg = null;

while(rs.next()){
	int	sum = rs.getInt("kor") + rs.getInt("eng") + rs.getInt("math") +rs.getInt("hist") ;
	double avg = Math.round(( sum / 4.0) *10 )/10.0 ;
	
	count += 1;
	
	if(count%2 != 0 ){
		bg = "#DBB4B4";
	}else{
		bg = "#FFD9EC";
	}
	
%>    
<tr bgcolor=<%=bg%>>
<td><%=rs.getString("sno")%></td> <td><%=rs.getString("sname")%></td>
<td><%=rs.getString("kor")%></td> <td><%=rs.getString("eng")%></td> 
<td><%=rs.getString("math")%></td> <td><%=rs.getString("hist")%></td> 
<td><%=sum%></td>
<td><a href="delete.jsp?sno=<%=rs.getString("sno")%>&sname=<%=rs.getString("sname")%>"><%=avg%></a></td>
</tr>
<% } %>

</table>
</section>
<% 
rs.close();
pstmt.close();
con.close();
%>
</body>
</html>
<%@ include file="footer.jsp" %>