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
	 	
	 	request.setCharacterEncoding("UTF-8");
	 
	 	String age = request.getParameter("age");
	 	
	 %> 
	<script type="text/javascript">
		<%-- 다시 뒤로 돌려보내는 방법 --%>
		alert(<%=age%> + '살은 주류 구매가 불가능합니다.');
		//location.href="/02_JSP/quiz/Q02_A.jsp";
		history.go(-1);	// 1번 뒤로 이동(Q02_A.jsp)
		// 2번 이동이 아닌 이유 : B에서 이동할 때 사용한 foward 이동은 이동 카운트에 잡히지 않기 때문
	
	</script>
		 <%--  
			<h1>미성년자</h1>
			<div>당신의 나이는 <%=age %> 이므로 주류 구매가 불가능합니다.</div>
			<h3><a href="/02_JSP/quiz/Q02_A.jsp">처음으로 이동하기</a></h3>
		 --%>  

</body>
</html>