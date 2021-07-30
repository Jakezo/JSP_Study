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
	
		if (age < 20)
			request.getRequestDispatcher("/test/q02_D.jsp").forward(request, response);
		else
			request.getRequestDispatcher("/test/q02_C.jsp").forward(request, response);
			
			
	%>

</body>
</html>