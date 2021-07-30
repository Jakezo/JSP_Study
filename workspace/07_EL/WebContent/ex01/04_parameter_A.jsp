<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="04_parameter_B.jsp">
		
		<%-- 1. String 타입의 파라미터 --%>
		<input type="text" name="name" />
		
		<%-- 2. 배열 타입의 파라미터 --%>
		<input type="checkbox" name="hobbies" value="여행"/>여행		
		<input type="checkbox" name="hobbies" value="영화	"/>영화		
		<input type="checkbox" name="hobbies" value="게임"/>게임<br/>
		
		<button>전송</button>		
	</form>

</body>
</html>