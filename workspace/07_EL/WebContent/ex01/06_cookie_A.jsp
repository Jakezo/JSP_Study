<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
	 	name="에밀리", age=20  쿠키에 저장하고 06_cookie_B.jsp로 이동하기
	  	유효시간 10분 정해서
	  	06_cookie_B.jsp로 이동
	 --%>
	
	<%
		Cookie cookie1 = new Cookie("name", "애밀리");
		cookie1.setMaxAge(60 * 10);	// 10분
		response.addCookie(cookie1);
		
		Cookie cookie2 = new Cookie("age", "20");
		cookie1.setMaxAge(60 * 10);	// 10분
		response.addCookie(cookie2);
		
		response.sendRedirect("06_cookie_B.jsp");
	%>

</body>
</html>