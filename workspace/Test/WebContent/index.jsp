<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		function fn_submit(f) {
			f.action = '/Test/JSONHandler';
			f.submit();
		}
	</script>

	<form >
		성명 
		<input type="text" name="name" /><br /> 
		나이
		<input type="text" name="age" /><br />
		결혼여부
		<input type="radio" name="isMarried"value="기혼">기혼
		<input type="radio" name="isMarried" value="미혼">미혼<br /><br />
		<input type="button" value="전송" id="btn" onclick="fn_submit(this.form)">
	</form>

</body>
</html>