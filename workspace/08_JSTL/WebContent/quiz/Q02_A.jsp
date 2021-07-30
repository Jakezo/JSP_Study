<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="Q02_B.jsp">
		<h3>일반 forEach 연습</h3>
		아래에 크기를 입력하면 폰트 크기를 확인할 수 있습니다.<br/>
		
		최소크기 <input type="number" min="1" max="7" name="min" /><br/>
		최대크기 <input type="number" min="1" max="7" name="max" /><br/>
		
		<h3>향상 forEach 연습</h3>
		<input type="checkbox" name="foods" value="블고기" />불고기
		<input type="checkbox" name="foods" value="닭고기" />닭고기
		<input type="checkbox" name="foods" value="순대국" />순대국
		<input type="checkbox" name="foods" value="자장면" />자장면
		<input type="checkbox" name="foods" value="해장국" />해장국<br/>
		
		<button>전송</button>
	</form>

</body>
</html>