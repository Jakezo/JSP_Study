<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.BlueDao"%>
<%@page import="dto.BlueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String directory = "storage";
	String realPath = request.getServletContext().getRealPath(directory);
	MultipartRequest multipart = new MultipartRequest(
			request, 
			realPath, 
			1024 * 1024 * 50, 
			"UTF-8", 
			new DefaultFileRenamePolicy()
	);
	
	BlueDto blueDto = new BlueDto();
	blueDto.setWriter( multipart.getParameter("writer") );
	blueDto.setTitle( multipart.getParameter("title") );
	blueDto.setContent( multipart.getParameter("content") );
	if ( multipart.getFile("filename") == null ) {
		blueDto.setFilename("");
	} else {
		blueDto.setFilename( multipart.getFilesystemName("filename") );
	}
	
	int result = BlueDao.getInstance().insert(blueDto);
%>
<script>
	var result = <%=result%>;
	if (result > 0) {
		alert('게시글이 등록되었습니다.');
		location.href='/11_DBCP/blue/listPage.jsp';
	} else {
		alert('게시글이 등록되지 않았습니다.');
		history.back();
	}
</script>