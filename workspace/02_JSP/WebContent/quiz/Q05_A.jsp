<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	text, button {
		display: inline-block;
		width: 50px;
	}
</style>
</head>
<body>

		<% 
			int a = (int)(Math.random() * 9) + 1;
			int b = (int)(Math.random() * 9) + 1;
			int i = (int)(Math.random() * 5);
			String[] operators = {"+", "-", "*", "/", "%"};
		%>
		
	<h3>랜덤계산기</h3>
	<form action="<%=request.getContextPath()%>/quiz/Q05_B.jsp">
			
			<%= a%> <%=operators[i]%> <%= b%> 
			<input type="text" name="result" />
			<input type="hidden" name="a" value="<%=a %>" />
			<input type="hidden" name="b" value="<%=b %>" />
			<input type="hidden" name="operator" value="<%=operators[i]%>" />
			<button>제출</button>
					
	</form>

</body>
</html>