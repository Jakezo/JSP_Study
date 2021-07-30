<%@page import="java.sql.Connection"%>
<%@page import="dao.RedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 접속 테스트
    
    	// RedDao의 getInstance() 호출해 봅시다
    	// 1. 메소드를 호출하려면 객체가 필요하다
    	// 2. 객체를 만들려면 new 가 필요하다.
    	// 3. 객체를 만들지 말고 getInstance()를 부르자
    	RedDao redDao = RedDao.getInstance();
		Connection con = redDao.getConnection();
		redDao.close(con, null, null);
		
    %>
    
