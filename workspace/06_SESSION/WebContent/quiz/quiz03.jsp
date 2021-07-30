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
/* 		
		String athle = request.getParameter("athle");
		session.setAttribute("athle", athle);
*/
			
		session.setAttribute("athle", request.getParameter("athle"));
		
		String name = session.getAttribute("name").toString();
		String talent = session.getAttribute("talent").toString();
		String athle = session.getAttribute("athle").toString(); 
		
	%>
	
	<h3><%=name %>님의 선호도 조사 결과</h3>
	<form action="/06_SESSION/quiz/quiz01.jsp">
		<ul>
			<li>좋아하는 연예인 : <%=talent%></li>
			<li>좋아하는 운동선수 : <%=athle%></li>
		</ul><br/><br/>
		<button>처음부터 다시하기</button>
		
		<!--<input type="button" value="처음부터 다시하기" onclick='/06_SESSION/quiz/quiz01.jsp'>  -->
		
	</form>

</body>
</html>