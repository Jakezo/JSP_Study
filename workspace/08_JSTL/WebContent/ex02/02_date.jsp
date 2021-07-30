<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="now" value="<%= new Date(System.currentTimeMillis()) %>" />
	
	디폴트 : <fmt:formatDate value="${now}" /><br/>
	
	yyyy. M. d : <fmt:formatDate value="${now}" type="date" /><br/>
	오전/오후 h. mm. ss : <fmt:formatDate value="${now}" type="time" /><br/> 
	yyyy. M. d 오전/오후 h. mm. ss : <fmt:formatDate value="${now}" type="both" /><br/> 

	<%-- SimpleDateFormat 클래스의 패턴 --%>
	날짜 : <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 E요일 " /><br/>
	12시간 : <fmt:formatDate value="${now}" pattern="a h:mm:ss" /><br/>
	24시간 : <fmt:formatDate value="${now}" pattern="H:mm:ss" /><br/>

</body>
</html>