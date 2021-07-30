<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String filename = (String)session.getAttribute("filename");
	boolean isSuccess = (boolean)session.getAttribute("isSuccess");
	
	String result = "";
	if (isSuccess) {
		String realPath = request.getRealPath("/" + filename);
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(realPath));
			String line = null;
			while (true) {
				line = br.readLine();
				if (line == null) {
					break;
				}
				result += line + "<br/>";
			}
		} catch (FileNotFoundException e) {
			out.println("<h3>해당 파일이 없습니다.</h3>");
		} catch (IOException e) {
			out.println("<h3>파일을 읽을 수 없습니다.</h3>");
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (Exception e) { }
		}
	}
%>

<% if (isSuccess) { %>
	<h1>가입되었습니다.</h1>
	<h3>가입내용</h3>
	<div><%=result%></div>
	<br/>
	<input type="button" value="탈퇴" onclick="location.href='quiz005.jsp'" />
<% } else { %>
	<h1>가입되지 않았습니다.</h1>
	<a href="quiz001.jsp">다시 가입하기</a>
<% } %>