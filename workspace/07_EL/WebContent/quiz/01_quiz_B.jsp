<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
	
		String[] talents = request.getParameterValues("talents");
		
		ArrayList<String> list = new ArrayList<>();
		
		for (String talent : talents) {
			list.add(talent);
		}
		
		request.setAttribute("list", list);
		
	%>
	
	<%-- forward 태그 --%>
	<jsp:forward page="01_quiz_C.jsp" />>
