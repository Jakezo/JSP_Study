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
		// 처음 화면으로 돌아왔을 경우 모든 session을 삭제한다.
		session.invalidate();
	%>

	<h3>신규 회원 정보를 입력하세요.</h3>
	<form action="quiz002.jsp" method="post">
		<label for="id">아이디</label>
		<input type="text" name="id" id="id"/><br/>
		
		<label for="pw">비밀번호</label>
		<input type="password" name="pw" id="pw" /><br/>
		
		<label for="name">이름</label>
		<input type="text" name="name" id="name" /><br/>
		
		<button>회원가입</button>
	</form>

</body>
</html>