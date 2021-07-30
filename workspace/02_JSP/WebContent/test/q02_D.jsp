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

		int age = Integer.parseInt(request.getParameter("age"));
	%>
	
	<script type="text/javascript">
	
		alert("<%=age%>살은 주류 구매가 불가능합니다");
		
		location.href='<%=request.getContextPath()%>/test/q02_A.jsp';
	
	</script>
	
</body>
</html>