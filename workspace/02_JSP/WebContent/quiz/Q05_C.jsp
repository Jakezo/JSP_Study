<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 에러피이지 --%>

<%@ page isErrorPage="true"%>

<script>
	alert('결과는 정수만 허용됩니다. 다시 시도하세요.');
	//history.back();
	location.href='/02_JSP/quiz/Q05_A.jsp';
</script>