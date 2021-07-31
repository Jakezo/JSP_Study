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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// request 스코프에 값 저장하기
	request.setAttribute("id",id);
	request.setAttribute("pwd",pwd);
	
	// 포워드 방식으로 페이지 이동하기
	
	// pageContext.forward("request.jsp");
	
	//redirect 방식
//	response.sendRedirect("result.jsp");
	
	RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
	rd.forward(request, response);
	
%>

<%-- <jsp:forword page="result.jsp"></jsp:forword> --%>

</body>
</html>