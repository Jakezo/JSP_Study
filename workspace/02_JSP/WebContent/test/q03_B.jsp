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
		request.setCharacterEncoding("UTF-8");
	
		String name   = request.getParameter("name");
		String talent = request.getParameter("talent");
		
	%>
	
	<form action="<%=request.getContextPath()%>/test/q03_C.jsp">
		<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="athle">
		<br/><br/>
		
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="talent" value="<%=talent%>">
		
		<input type="submit" value="결과보기">
	</form>

</body>
</html>