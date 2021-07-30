<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 쿠키는 서버에서 만든다
		// 자바 영역은 서버 영역
		
		// 1. 쿠키 생성
		Cookie cookie = new Cookie("name", "emily");	// 쿠키이름 :name, 쿠키 값 : emily
		
		// 2. 쿠키 유효 기간 정하기 (초 단위)
		// cookie.setMaxAge(-1); 브라우저 종료까지
		// cookie.setMaxAge(60);	1분(60초),
		// cookie.setMaxAge(60 * 60); 1시간
		cookie.setMaxAge (60 * 60 * 24); // 1일
		
		// 3. 쿠키 저장 (클라이언트에게 쿠키 보내기)
		response.addCookie(cookie);
		
	%>

	<%-- 크롬 > 설정 > 개인 정보 및 보안 > 쿠키 및 기타 사이트 > 모든 쿠키 및 사이트 데이터 보기 > localhost 검색 --%>	
	
	<h3>쿠키 확인하기</h3>
	<ul>
		<li>쿠키이름 : <%=cookie.getName() %></li>
		<li>쿠키유효기간 : <%=cookie.getMaxAge() %></li>
		<li>쿠기 값 : <%=cookie.getValue() %></li>
	</ul>
	
</body>
</html>