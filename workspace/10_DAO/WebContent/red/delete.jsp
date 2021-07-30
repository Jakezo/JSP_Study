<%@page import="dao.RedDao"%>
<%@page import="dto.RedDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 1. 파라미터 처리
		request.setCharacterEncoding("UTF-8");
    
    	int no = 0;
    	
    	if (request.getParameter("no") == null || request.getParameter("no").isEmpty()) {
    		out.println("<script>");
    		out.println("alert('알 수 없는 회원정보입니다.')");
    		out.println("location.href='/10_DAO/red/listPage.jsp'");
    		out.println("</script>");
    	} else {
    		no = Integer.parseInt(request.getParameter("no"));
    	}
    	
    	/* 
    		// 2. DB로 보낼 RedDto 생성
    		RedDto redDto = new RedDto();
    		redDto.setNo(Integer.parseInt(no)); 
    	*/
		    
		// 2. DAO
		int result = RedDao.getInstance().delete(no);
		
		// 3. 성공/실패 처리
		out.println("<script>");
    	if (result != 0) {
    		out.println("alert('회원 정보가 삭제되었습니다.')");
    	} else {
    		out.println("alert('회원 정보가 삭제되지 않았습니다.')");
    	}
    	out.println("location.href='/10_DAO/red/listPage.jsp'");
    	out.println("</script>");
	%>	    
    
