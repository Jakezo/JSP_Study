<%@page import="bean.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>

	<%-- 1. tag로 bean 생성 --%>
	<%--
		<jsp:useBean id="p" class="bean.Person" />
		<jsp:setProperty property="*" name="p" />
	 --%>
		
	
	<%-- 2. java로 bean 생성 --%>	
	<%
		Person person = new Person();
		
		person.setName(request.getParameter("name"));
		person.setAge(Integer.parseInt(request.getParameter("age")));
		person.setGender(request.getParameter("gender").charAt(0));
		
		// EL 사용을 위해서 pageContext에 올려둔다.
		pageContext.setAttribute("person", person);
	%>

		<h3>이름 : <%= person.getName()%></h3>
		<h3>나이 : <%= person.getAge()%></h3>
		<h3>성별 : <%= person.getGender()%></h3>
		
		<h3>이름 : ${person.name }</h3>
		<h3>나이 : ${person.age }</h3>
		<h3>성별 : ${person.gender }</h3>
		
		<!-- field의 name을 가져온게 아니라 아래의 person.getName()을 줄여서 사용한것이다. -->
		<!-- getter()를 꼭  작성해야 결과가 출력된다.-->
		<%-- 위와 같이 약식을 사용하기 때문에 아래는 비효율적이므로 사용하지 않는다. --%>
		<%--
			<h3>이름 : ${person.getName() }</h3>
			<h3>나이 : ${person.getAge() }</h3>
			<h3>성별 : ${person.getGender() }</h3>
		 --%>
</body>
</html>