<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	// 1. 특정 속성만 제거하기
    	session.removeAttribute("data");
    
    	// 2. 세션 전부 초기화하기
    	session.invalidate();
    	
    	// 3. 이전 페이지로 이동
    	response.sendRedirect("/06_SESSION/ex01/02_session_C.jsp");
    	
    %>