<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		// 1. id, pw를 이용해서 bean 생성(DB로 보내는 용도)
		User user = new User(id, pw);
		
		/*
			속도측에서 더 우수
			User user = new User();
			user.setId(id);
			user.setPw(pw);
		*/
		
		// DB대용 Map<key, value> : key(id), value(pw)
		Map<String, String> map = new HashMap<>();
		map.put("admin", "123456");
		map.put("user1","1111");
		map.put("user2","1111");
		map.put("user3","1111");
		map.put("user4","1111");
		map.put("user5","1111");
		
		// map에 일치하는 id가 있는가?
		if (map.containsKey(user.getId())) {
			// 비밀번호가 일치하는가?
			// key를 이용해서 value를 가져올 때는 get() 메소드를 사용한다.
			if (map.get(user.getId()).equals(user.getPw())) {
				// 세션에 user 객체를 저장한다.
				session.setAttribute("loginUser", user);
			}
		}
		
		// 다시 로그인 화면으로 되돌아간다.
		response.sendRedirect("/06_SESSION/ex02/01_login_A.jsp");
				
	%>

