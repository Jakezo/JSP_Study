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
		// 쿠키 id 여부확인
		
		// 쿠키 id가 있으면 해당 쿠키 값을 (getvalue()) String id에 저장
		String id = null; 
		
		Cookie[] cookieList = request.getCookies();
	
		if (cookieList != null && cookieList.length != 0) {
			for (Cookie ck : cookieList) {
				if (ck.getName().equals("id")) {
					id = ck.getValue();	// 저장된 아이디
					break;
				}
			}
		}
	
	%>

	<form action="/05_COOKIE/ex02/02_loginCheck.jsp">
		
		<% if (id == null) { %>
			<input type="text" name="id" /><br/>	<!-- 비어있으면 입력 받음 -->
			<input type="password" name="pw" /><br/>
			<input type="checkbox" name="chk" /> 아이디 기억하기<br/><br/>
			
			<% } else { %>
			
			<input type="text" name="id" value="<%= id%>" /><br/>	<!-- id가 있으면 채워넣으면 된다. -->
			<input type="password" name="pw" /><br/>
			<input type="checkbox" name="chk" checked/> 아이디 기억하기<br/><br/>
		<% } %>
		
		<button>로그인</button>
		
	</form>

</body>
</html>