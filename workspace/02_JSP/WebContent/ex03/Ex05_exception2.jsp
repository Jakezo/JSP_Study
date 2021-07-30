<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 예외 발생으로 이동된 페이지이므로, isErrorPage 속성을 true로 설정 --%>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		요청을 처리하는 과정에서 예기치 않은 에러가 발생했습니다.<br/>
		에러 타입 : <%=exception.getClass() %><br/>
		에러 메시지 : <%=exception.getMessage() %><br/>
		<a href= "mailto:admin@myhome.com">오류 신고하기</a>
		
	</div>

</body>
</html>