<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<%
	
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("name");
		String talent = request.getParameter("talent");
		String athle = request.getParameter("athle");
	
	%>
	<h3><%= name%>님의 선호도 조사 결과</h3>
	<ul>
		<li>좋아하는 연예인 : <%=talent %></li>
		<li>좋아하는 운동선수 : <%=athle %></li>
	</ul>
	
	<input type="button" value="처음부터 다시하기" onclick="fn_return(this.form)">
	<!-- onclick="location.href='/02_JSP/quiz/Q03_A.jsp'" -->
</form>
	<script type="text/javascript">
	
		function fn_return(f) {
			
			f.action='/02_JSP/quiz/Q03_A.jsp';
			f.submit();
			
		}
	
	</script>

</body>
</html>