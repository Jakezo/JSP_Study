<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		User loginUser = (User) session.getAttribute("loginUser");
	%>

	<!-- 로그인 못 했을 경우 나타남 -->
	<% if (loginUser == null) { %>
		<form action="/06_SESSION/ex02/01_login_B.jsp" method="post">
			<input type="text" name="id" /><br/>
			<input type="password" name="pw" /><br/>
			<button>로그인</button>
		</form>
	<% } else { %>
		<%=loginUser.getId()%> 님 반갑습니다.<br/><br/>
		<form action="/06_SESSION/ex02/01_login_C.jsp">
			<button>로그아웃</button>
		</form>
	<% } %>
	

</body>
</html>