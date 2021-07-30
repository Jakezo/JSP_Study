<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String[] hobbies = {"카톡", "인스타", "페북"};

		pageContext.setAttribute("hobbies", hobbies);
	
	%>
	<%-- for (String hobby : hobbies) --%>
	<%-- varStatus : 인덱스를 불러옴 --%>
	<c:forEach var="hobby" items="${hobbies}" varStatus="k"> 
		취미 : ${hobby}, 인덱스 : ${k.index}, 순번 : ${k.count}<br/>		
	</c:forEach>

	<%
		ArrayList<String> list = new ArrayList<>();
	
		list.add("떢볶이");
		list.add("순대");
		list.add("튀김");
		
		pageContext.setAttribute("list", list);
	%>
	
	<c:forEach var="food" items="${list}">
		음식 : ${food}<br/>
	</c:forEach>


</body>
</html>