<%@page import="dao.RedDao"%>
<%@page import="dto.RedDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("UTF-8");
	
	int no = 0;
	if (request.getParameter("no") == null) {
		out.println("<script>");
		out.println("alert('알 수 없는 회원정보입니다.')");
		out.println("location.href='/10_DAO/red/listPage.jsp'");
		out.println("</script>");
	} else {
		no = Integer.parseInt(request.getParameter("no"));
	}
	
	// 2. DAO
	RedDto redDto = RedDao.getInstance().view(no);
	
	// 3. EL 사용을 위해서
	pageContext.setAttribute("redDto", redDto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/style/red.css" />
<style type="text/css">
	td:nth-of-type(1) {
		width: 150px;
	}
	td:nth-of-type(2) {
		text-align: left;
	}
	input[type=text], input[type=password] {
		padding: 5px;
		width: 400px;
		outline: 0px;
		border: 0px;
	}
	input[type=text]:focus, input[type=password]:focus {
		background: #efefef;
	}
</style>
<script type="text/javascript">
	// 1. 회원정보수정 페이지로 이동하기
	//    : 실제로는 비밀번호확인 페이지로 이동
	function fn_pwConfirmPage(f) {
		f.action = '/10_DAO/red/pwConfirmPage.jsp';
		f.submit();
	}
	
	// 2. 비밀번호 변경 페이지로 이동하기
	function fn_pwChangePage(f) {
		f.action = '/10_DAO/red/pwChangePage.jsp'
		f.submit();
	}
	
</script>
</head>
<body>

	<c:if test="${redDto eq null}">
		<script type="text/javascript">
			alert('회원 정보가 없습니다. 다시 확인하세요.');
			history.back();
		</script>
	</c:if>
	
	<c:if test="${redDto ne null}">
		<form method="post">
			<table>
				<thead>
					<tr>
						<td colspan="2">${redDto.name}님의 정보입니다.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>번호</td>
						<td>${redDto.no}</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${redDto.id}</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${redDto.name}</td>
					</tr>
					<tr>
						<td>나이</td>
						<td>${redDto.age}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${redDto.email}</td>
					</tr>
					<tr>
						<td>가입일</td>
						<td>${redDto.regDate}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="회원정보수정하기" onclick="fn_pwConfirmPage(this.form)" />
							<input type="button" value="비밀번호변경하기" onclick="fn_pwChangePage(this.form)" />
							<input type="button" value="목록으로이동하기" onclick="location.href='/10_DAO/red/listPage.jsp'" />
						</td>
					</tr>
				</tfoot>
			</table>
			<%-- 회원정보수정, 비밀번호변경 이동시 넘겨 줄 파라미터 --%>
			<input type="hidden" name="no" value="${redDto.no}" />
			<input type="hidden" name="id" value="${redDto.id}" />
			<input type="hidden" name="pw" value="${redDto.pw}" />
			<input type="hidden" name="name" value="${redDto.name}" />
			<input type="hidden" name="age" value="${redDto.age}" />
			<input type="hidden" name="email" value="${redDto.email}" />
			<input type="hidden" name="regDate" value="${redDto.regDate}" />
		</form>
		
	</c:if>

</body>
</html>