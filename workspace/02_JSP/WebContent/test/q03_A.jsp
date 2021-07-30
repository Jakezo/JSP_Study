<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/test/q03_B.jsp">
		<div>
			<label for="name">설문작성자</label><br/>
			<input type="text" id="name" name="name"><br/>
			
			<h3>1. 좋아하는 연예인은 누구인가요?</h3><br/>
			<input type="text" name="talent">
			<input type="submit" value="다음">
		</div>
	</form>

</body>
</html>