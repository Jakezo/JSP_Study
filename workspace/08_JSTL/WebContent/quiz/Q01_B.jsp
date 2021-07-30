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

	<%-- 문제 1. --%>
	
	<c:if test="age <= 7 and age >= 0">
		<h3>미취학아동</h3>
	</c:if>
	<c:if test="age >= 8 and age <= 13 ">
		<h3>초등학생</h3>
	</c:if>
	<c:if test="age >= 14 and age <= 16 ">
		<h3>중학생</h3>
	</c:if>
	<c:if test="age >= 17 and age <= 19 ">
		<h3>고등학생</h3>
	</c:if>
	<c:if test="age >= 20 ">
		<h3>성인</h3>
	</c:if>
 	
 	<%-- 문제 2. --%>
 	<%-- <c:if test="${param.n >= 0}">
 		<c:set var="abs" value="${param.n}" />	
 	</c:if>
 	
 	<c:if test="${param.n < 0}">
 		<c:set var="abs" value="${param.n * -1}" />
 	</c:if>
 	
 	${param.n} 의 절대값은 ${abs} 입니다. --%>
</body>
</html>