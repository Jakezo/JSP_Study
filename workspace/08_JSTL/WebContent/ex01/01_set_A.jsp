<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 
    	taglib를 사용하려면 taglib 지시어를 작성해야 한다.
    	
    	1. 코어(core) 라이브러리 : if, for문
    		<%@ taglib uri = "" prefix="c" %>
    	
    	2. 형식(formating) 라이브러리 : 숫자, 날짜 형식
    		<%@ taglib uri = "" prefix="fmt" %>
    		
     --%>
     
     <%-- 코어 라이브러리 지시어 --%>
     <%-- http://java.sun.com/jsp/jstl/core >> 1.2 ver --%>
     <%-- prefix : 태그 앞에 붙일 말 --%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- set : 변수 선언 --%>
	<c:set var="name" value="제임스" />
	<c:set var="age" value="20" />
	
	<%-- taglib는 기본적으로 모두 EL을 사용한다. --%>
	<%--
		String name = "제시카";
		int age = 20;
		pageContext.setAttribute("name", name);
		pageContext.setAttribute("age", age);
	--%>
	
	<h3>이름 : ${name }</h3>
	<h3>나이 : ${age}</h3>
	
	<%-- set 태그 scope 속성을 지정할 수 있다. 기본값은 pageContext이다. --%>
	<%-- request에 변수 선언하기 --%>
	<c:set var="a" value="10" scope="request" />
	<c:set var="b" value="5" scope="request" />
	
	<%--
		set 태그를 이용하면 "속성"으로 저장된다.
		request.setAttribute("a", 10);
		request.setAttribute("b", 10);
	--%>
	
	<%-- 포워딩 --%>
	<jsp:forward page="01_set_B.jsp" />
		<jsp:setProperty property="*" name="a"/>
		<jsp:setProperty property="*" name="b"/>

</body>
</html>