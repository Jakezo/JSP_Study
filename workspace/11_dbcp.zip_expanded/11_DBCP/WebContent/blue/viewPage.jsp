<%@page import="dao.BlueDao"%>
<%@page import="dto.BlueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = 0;
	if(strNo != null && !strNo.isEmpty()){
		no = Integer.parseInt(strNo);
	}
	BlueDto blueDto = BlueDao.getInstance().view(no);
	pageContext.setAttribute("blueDto", blueDto);
	
	String directory = "storage";
	String realPath = request.getServletContext().getRealPath(directory);
	pageContext.setAttribute("realPath", realPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_updatePage(f){
		f.action='/11_DBCP/blue/updatePage.jsp';
		f.submit();
	}
</script>
</head>
<body>
	<h3>${blueDto.no}번 게시글입니다.</h3>
	<div>
		제목<br/>
		<pre>${blueDto.title}</pre><br/><br/>
		
		작성자<br/>
		<pre>${blueDto.writer}</pre><br/><br/>
		
		내용<br/>
		<pre>${blueDto.content}</pre><br/><br/>
		
		작성일<br/>
		${blueDto.postDate}<br/><br/>
		
		<c:if test="${not empty blueDto.filename}"> 
			첨부이미지<br/>
			<img alt="이미지아님" src="${realPath}/${blueDto.filename}"/> 
			<%-- 폴더가 제대로 만들어지지 않았다.. 이미지가 나타나지 않는 오류.. 그냥.. 넘어간다.. --%>
		 </c:if> 
		
	</div>
	<br/><br/>
	<form 	method = "post" action="/11_DBCP/blue/delete.jsp" onsubmit="return confirm('삭제하시겠습니까?'))">
		<input type="button" value="목록으로이동" onclick="location.href='/11_DBCP/blue/listPage.jsp'"/>
		<button>삭제하기</button>
		<input type="button" value="수정하기" onclick="fn_updatePage(this.form)"/>
		<input type="hidden" name="no" value="${blueDto.no}"/>
		<%-- 수정에 필요한 정보들 보내주기 --%>
		<input type="hidden" name="title" value="${blueDto.title}"/>
		<input type="hidden" name="writer" value="${blueDto.writer}"/>
		<input type="hidden" name="content" value="${blueDto.content}"/>
		<input type="hidden" name="postDate" value="${blueDto.postDate}"/>
		<input type="hidden" name="realPath" value="${realPath}"/>
		<input type="hidden" name="filename" value="${blueDto.filename}"/>
		
	</form>
</body>
</html>