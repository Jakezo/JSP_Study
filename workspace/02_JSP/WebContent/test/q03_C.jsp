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
	
		String name = request.getParameter("name");
		String talent = request.getParameter("talent");
		String athle = request.getParameter("athle");
	%>

	<form action="<%=request.getContextPath() %>/test/q03_A.jsp">
		<h3><%=name %>님의 선호도 조사 결과</h3>
		<ul>
			<li>좋아하는 연예인 : <%=talent %></li>
			<li>좋아하는 운동선수 : <%=athle %></li>
		</ul><br/>
		
		<input type="submit" value="처음부터 다시하기">
		
	</form>
	

</body>
</html>