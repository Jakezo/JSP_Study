<%@page import="java.sql.Date"%>
<%@page import="bean.Board"%>
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
	
		Board board = new Board();
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setContext(request.getParameter("context"));
		board.setDate(new Date(System.currentTimeMillis()));
		/* 현재 시간은 oracle에서 구현 */
		
		pageContext.setAttribute("board", board);
		
	%>
	
	<h3>제목 : ${board.title }</h3>
	<h3>작성자 : ${board.writer }</h3>
	<h3>내용 : ${board.context}</h3>
	<h3>게시 : ${board.date}</h3>

</body>
</html>