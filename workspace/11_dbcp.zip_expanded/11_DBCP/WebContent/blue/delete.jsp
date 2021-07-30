<%@page import="dto.BlueDto"%>
<%@page import="java.io.File"%>
<%@page import="dao.BlueDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String strNo = request.getParameter("no");
	int no = 0; //작성 게시글은 1부터이므로 0 설정가능
	if(strNo != null && !strNo.isEmpty()){
		no = Integer.parseInt(strNo);
		
	}
	
	int result = BlueDao.getInstance().delete(no);

	if(result > 0 ){
		
/* me->	BlueDto blueDto = BlueDao.getInstance().view(no);
		String realPath = request.getServletContext().getRealPath(directory);
		String realPath = request.getServletContext().getRealPath(directory);
		String filename = blueDto.getFilename();
		String directory = "storage";
		pageContext.setAttribute("realPath", realPath);
		File file = new File(realPath + "/" + filename);
 sam-> */
		String realPath = request.getParameter("realPath");
		String filename = request.getParameter("filename");
		File file = new File(realPath, filename);
		if(file.exists()){
			file.delete();
		}
	}
%>    

<script>
	var result = '<%=result%>';
	if(result > '0'){
		alert('삭제되었습니다.');
		location.href='/11_DBCP/blue/listPage.jsp';
	}else{
		alert('삭제되지 않았습니다.');
		history.back();
	}
</script>
