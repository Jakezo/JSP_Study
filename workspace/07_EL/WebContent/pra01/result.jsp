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
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	
	id = request.getParameter("id");

%>
<h3>request 스코프에 담긴 데이터<br/></h3>
id:<%=id %><br/>
pw:<%= pwd %><br/>


<!--; redirect방식으로 넘기면 값은 null이다. loginOk.jsp에서 값을 넘기지 않아서.. 주소는 바뀌어 있다.

; redirect방식은 request유지하지 않기 때문에 다른 페이지로 이동하면 없어진다. 

; response.sendRedirect("result.jsp?id=1"); 이렇게 찍어보면 1이 넘어간다.  

출처: https://installed.tistory.com/entry/8-JSP-특정페이지로-이동방법 [New]  -->

</body>
</html>