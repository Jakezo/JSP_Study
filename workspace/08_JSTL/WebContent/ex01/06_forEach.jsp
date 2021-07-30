<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="bean.User"%>
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
		User user1 = new User("user1", "1111", new Date(System.currentTimeMillis()));
		User user2 = new User("user2", "2222", new Date(System.currentTimeMillis()));
		User user3 = new User("user3", "3333", new Date(System.currentTimeMillis()));
		
		ArrayList<User> list = new ArrayList<>();		
		
		list.add(user1);
		list.add(user2);
		list.add(user3);
		
		// EL 사용을 위해 공간에 저장
		pageContext.setAttribute("list", list);
		// list.size() : list의 길이 구하기
		pageContext.setAttribute("size", list.size());
		
	%>
	
	<h3>전체 ${size} 명</h3>
	<table border="1">
		<thead>
			<tr>
				<td>순번</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>가입일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${list}" varStatus="k">
				<tr>
					<td>${k.count}</td>
					<td>${user.id}</td>
					<td>${user.pw}</td>
					<td>${user.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>