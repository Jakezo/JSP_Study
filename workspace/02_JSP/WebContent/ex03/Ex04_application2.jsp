<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	request.setCharacterEncoding("UTF-8");

	String date = request.getParameter("date");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 파일명 결정하기
	String filename = date + "_" + title + ".txt";
	String realPath = application.getRealPath("/ex03/" + filename); 
	
	// 파일 생성의 성공/실패 여부를 담고 있는 플래그 변수 isSuccess
	boolean isSuccess = false;
	BufferedWriter bw = null;
	
	try {
		bw = new BufferedWriter (new FileWriter(realPath));
		bw.write("작성일: " + date + "\n");
		bw.write("작성자: " + writer + "\n");
		bw.write("제목: " + title + "\n");
		bw.write("내용\n: ");
		bw.write(content);
		isSuccess = true;
	} catch (IOException e) {
	/* 	out.println("<script>");
		out.println("alert('일기가 저장되지 않았습니다.')");
		out.println("history.back()");
		out.println("</script>"); */
		isSuccess = false;	// 생략할 수 있다.
	} finally {
		try {
			if (bw != null) {
				bw.close();
			}
		} catch (Exception e) {
			
		}
	}
	
%>

<%-- 자바변수는 자바스크립트에서 사용할 수 있다. --%>
<script>
	if (<%=isSuccess%> == true) {
		alert("일기가 저장되었습니다.");
		/* 저장주소 : C:\spring0914_ysm\jspstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\02_JSP\ex03 */
	} else {
		alert("일기가 저장되지 않았습니다.");
	}
	
	// 단순 뒤로 이동 (파라미터 전달은 안 됨)
	// history.back();
	
	// 지정한 위치로 이동 (파라미터 전달 됨)
	location.href = '<%=application.getContextPath()%>/ex03/Ex04_application1.jsp?done=<%=isSuccess%>'; 
</script>