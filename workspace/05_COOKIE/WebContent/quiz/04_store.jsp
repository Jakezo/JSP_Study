<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String bYear = request.getParameter("bYear");
	String bMonth = request.getParameter("bMonth");
	String bDay = request.getParameter("bDay");
	String birthday = bYear + "년 " + bMonth + "월 " + bDay + "일";
	
	String marriage = request.getParameter("marriage");
	
	String job = request.getParameter("job");
	
	response.addCookie( new Cookie("birthday", URLEncoder.encode(birthday, "UTF-8")) );
	response.addCookie( new Cookie("marriage", URLEncoder.encode(marriage, "UTF-8")) );
	response.addCookie( new Cookie("job", URLEncoder.encode(job, "UTF-8")) );
	
	response.sendRedirect("Q01_E.jsp");
%>