<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form>
		<div>설문작성자</div>
		<input type="text" name="name"><br/>
		
		<h3>1. 좋아하는 연예인은 누구인가요?</h3>
		<input type="text" name="talent">
		<input type="button" value="다음" onclick="fn_next(this.form)">
		
	</form>
	
	<script type="text/javascript">
	
		function fn_next(f){
			
			f.action = '/02_JSP/quiz/Q03_B.jsp';
			f.submit();
			
		}
	
	</script>

</body>
</html>