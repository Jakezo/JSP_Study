<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="assets/style/common.css">
    
    <% request.setCharacterEncoding("UTF-8"); %>
    
    <jsp:include page="/template/header.jsp">
    	<jsp:param value="대문페이지" name="title"/>
    </jsp:include>
    
    <h1>홈페이지에 오신 걸 환영합니다.</h1>
    
    <%@ include file="template/footer.jsp" %>