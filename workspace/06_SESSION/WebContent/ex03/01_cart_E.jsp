<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	// removeAttribute() : 장바구니에 있는 것들만 삭제한다.
    	// invalidate()를 사용하게 되면 로그인 세션까지 삭제되므로 로그아웃까지 되게 된다.
    	
    	session.removeAttribute("cart");
    	
    	// 쇼핑하러 이동
    	response.sendRedirect("/06_SESSION/ex03/01_cart_B.jsp");
    %>