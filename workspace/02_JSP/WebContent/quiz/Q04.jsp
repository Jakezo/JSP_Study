<%@ page language="java" contentType="text/html; charset=UTF-8"
    
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	input, select, button {
		width: 30px;
	}

</style>
</head>
<body>
	
	<%
		String[] operators = {"+", "-", "*", "/"};
	
		String st_num1 = request.getParameter("num1");
		String st_num2 = request.getParameter("num2");
		
		int operator = 0;	// 해당 번호를 가지고 있음
		
		double num1 = 0;
		double num2 = 0;
		double result = 0;
		
		// num1. num2가 모두 입력 되었다면
		if (st_num1 != null && !st_num1.isEmpty() && st_num2 != null && st_num2.isEmpty()) {
			num1 = Double.parseDouble(st_num1);
			num2 = Double.parseDouble(st_num2);
			
			operator = Integer.parseInt(request.getParameter("operator"));
			
			switch (operator) {
			case 0: result = num1 + num2; break;
			case 1: result = num1 - num2; break;
			case 2: result = num1 * num2; break;
			case 3: result = num1 / num2; break; 
			}
			
		}
	%>

	<h1>계산기</h1>
	<form action="/02_JSP/quiz/Q04.jsp">
		<input type="text" name="num1" value="<%=num1 %>" />
		
		<select name="operator">
			<% for(int i = 0; i < operators.length; i++) { %>
				<% if (i == operator) { %>
					<option value="<%=i%>" selected><%=operators[i] %></option>
					<% } else { %>
						<option value="<%=i%>"><%=operators[i] %></option>
						<% } %>
				<% } %>
		</select>
		
		<input type="text" name="num2" value="<%=num2 %>" />
		
		<button>=</button>
		
		<input type="text" value="<%=result %>" readonly />	<!-- name이 없는 이유 : 결과값만 보여주면 되기 때문에, name이 있을 경우 URL에 name= 이 표시됨 -->
	</form>

</body>
</html>