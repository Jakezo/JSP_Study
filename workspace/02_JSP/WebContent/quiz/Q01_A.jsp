<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function fn_click(f) {
		//location.href = '/02_JSP/quiz/Q01_B.jsp';   값을 넘겨야하기 때문에 사용 불가
		f.action = '/02_JSP/quiz/Q01_B.jsp';
		f.submit();
		
	}
	
</script>
</head>
<body>
	<form>
	
	<div>
	사이트명
	<select name="domain">
		<option value="http://www.google.com">구글</option>
		<option value="http://www.naver.com">네이버</option>
		<option value="http://www.daum.net">다음</option>
		<option value="http://www.kakao.com">카카오</option>
	</select>
	<%-- <%
	
		String[][] sites = {
				{"www.google.com","구글"},
				{"www.naver.com", "네이버"},
				{"www.daum.com", "다음"},
				{"www.kakao.com", "카카오"}
		};
	
	%>
	<select name="site">
		<% for (int i = 0; i < sites.length; i++) { %>
			<option value= "<%=sites[i][0]%>"><%=sites[i][1]%>"></option>
			<% } %>
	</select> --%>
	
	<input type="button" value="확인" onclick="fn_click(this.form)">
	</div>

	</form>

</body>
</html>