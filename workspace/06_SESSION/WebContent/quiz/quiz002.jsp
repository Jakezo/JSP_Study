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
		request.setCharacterEncoding("utf-8");
	
		session.setAttribute("id", request.getParameter("id"));
		session.setAttribute("pw", request.getParameter("pw"));
		session.setAttribute("name", request.getParameter("name"));
	%>

	<h3>이용 약관</h3>
		<pre>
		------------------------------------------
		1. 회원 정보는 웹 사이트 운영을 위해서만 사용됩니다.
		2. 원치 않으면 정보 제공을 하지 않을 수 있습니다.
		3. 다만 이 경우 정상적인 ㅜ엡 사이트 이용이 제한됩니다.
		------------------------------------------
		</pre>
		<br/>
	<form action="quiz003.jsp" method="post">
		위 약관을 동의하십니까? <br/>
		<input type="radio" name="check" value="yes">동의함
		<input type="radio" name="check" value="no">동의 안 함
		<br/>
		<button>회원가입</button>
	</form>
	

</body>
</html>