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
		request.setCharacterEncoding("utf-8");
	
		/* String name = request.getParameter("name");
		String talent = request.getParameter("talent");
		
		session.setAttribute("name", name);
		session.setAttribute("talent", talent); */
		
		session.setAttribute("name", request.getParameter("name"));
		session.setAttribute("talent", request.getParameter("talent"));
				
	%>
	<form action="/06_SESSION/quiz/quiz03.jsp">
		<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="athle" />
		<button>결과 보기</button>
	</form>

</body>
</html>