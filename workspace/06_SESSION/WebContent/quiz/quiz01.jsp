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
		// 되돌아 왔을 때 기존에 저장돼있던  session의 값들을 제거한다.
		session.invalidate();
	%>


	<form action="/06_SESSION/quiz/quiz02.jsp">
		<label for="name">설문작성자</label>
		<input type="text" name="name" />
		<br/><br/>
		
		<h3>1. 좋아하는 연예인은 누구인가요?</h3>
		<input type="text" name="talent" />
		
		<button>다음</button>
	</form>

</body>
</html>