<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "환영합니다";
	}
	pageContext.setAttribute("title", title);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<%-- css --%>
<link rel="stylesheet" href="assets/style/fixed.css">
</head>
<body>

<div class="wrap">
	<div class="header">
		<div class="left_header">
			<img alt="Footprint" src="assets/images/logo.png" />
		</div>
		<nav id="right_header">
			<a href="/Project/footprint/LoginPage.jsp" >로그인</a>
			<a href="" >발자취</a>
			<a href="" >알림</a>
			<a href="/Project/MyPage/tracePage.jsp" >My발자국</a>
		</nav>
	</div>
	<hr>
	<div class="main">
	