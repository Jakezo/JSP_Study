<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// remove.Attribute("속성명") : 장바구니에 있는 것들만 삭제한다.
	// invalidate() : 로그인 세션까지 삭제되므로 로그아웃까지 하게 된다.
	
	session.removeAttribute("cart");
	
	response.sendRedirect("/06_SESSION/ex03/test_B.jsp");
	
%>	