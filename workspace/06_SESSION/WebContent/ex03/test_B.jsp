<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		User user = new User(id, pw);
		
		Map<String, String> map = new HashMap<>();
		map.put("user1", "1111");
		map.put("user2", "2222");
		map.put("user3", "3333");
		
		// 비로그인 상태
		// session의 속성중에 loginUser가 비어있으면 (비어있다 = 비로그인, 만들지 않았으니깐)
		if (session.getAttribute("loginUser") == null) {
			// 아이디가 저장되어 있는지 확인
			if (map.containsKey(user.getId())) {
				// 아이디(키)의 값과 일치하는 비밀번호(값)을 가지고 있는지 확인
				if (map.get(user.getId()).equals(user.getPw())) {
					// user의 값을 가진 loginUser session을 설정한다.
					session.setAttribute("loginUser", user);						
				} else {
					// 아이디는 맞고 비밀번호는 틀리다
					
					response.sendRedirect("/06_SESSION/ex03/test_A.jsp");
				} 
			} else {
				// 아이디가 틀림
				response.sendRedirect("/06_SESSION/ex03/test_A.jsp");
			}
		}
	// 로그인상태
	%>
	<%-- else 개녕으로 이해 로그인에 성공했을 경우 아래가 보인다--%>
	
	<form action="/06_SESSION/ex03/test_C.jsp"> 
		<h3>상품 선택</h3>
		<select name="product">
			<option value="텔레비젼">텔레비젼</option>
			<option value="냉장고">냉장고</option>
			<option value="노트북">노트북</option>
			<option value="청소기">청소기</option>
			<option value="세탁기">세탁기</option>
		</select>
		
		<input type="text" name="amount" />개
		
		<button>장바구니에 추가</button>
	</form>	