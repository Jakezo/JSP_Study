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
		session.setAttribute("name", "에밀리");
		session.setAttribute("age", 20);
	%>
	
	<h3>이름 : ${name}</h3>
	<h3>나이 : ${age }</h3>
	
	<h3>이름 : ${sessionScope.name }</h3>
	<h3>나이 : ${sessionScope.age }</h3>

</body>
</html>