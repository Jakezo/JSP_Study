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
		
	%>    

	<form>
		<h3>2. 좋아하는 운동선수는 누구인가요?</h3>
		<input type="text" name="athle">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="talent" value="<%=talent%>">
		<input type="button" value="결과보기" onclick="fn_result(this.form)">
	</form>
	
	<script type="text/javascript">
	
		function fn_result(f) {
			
			f.action = '/02_JSP/quiz/Q03_C.jsp';
			f.submit();
			
		} 
		
	</script>

</body>
</html>