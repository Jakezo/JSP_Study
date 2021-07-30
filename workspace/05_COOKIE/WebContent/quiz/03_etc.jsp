<%@page import="java.net.URLEncoder"%>
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
		request.setCharacterEncoding("utf-8");
	
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		response.addCookie( new Cookie("address", URLEncoder.encode(address, "UTF-8")) );
		response.addCookie( new Cookie("phone", URLEncoder.encode(phone, "UTF-8")) );
		response.addCookie( new Cookie("email", URLEncoder.encode(email, "UTF-8")) );
	%>

    <h3>추가정보를 입력하세요.</h3>
    <form action="Q01_D.jsp" method="post">
        <table>
            <tr>
                <td>생년월일</td>
                <td>
                    <input type="text" name="bYear" size="6" />년 
                    <input type="text" name="bMonth" size="3" />월 
                    <input type="text" name="bDay" size="3" />일 
                </td>
            </tr>
            <tr>
                <td>결혼여부</td>
                <td>
                    <input type="radio" name="marriage" value="미혼" /> 미혼 
                    <input type="radio" name="marriage" value="기혼" /> 기혼 
                </td>
            </tr>
            <tr>
                <td>직업</td>
                <td>
                    <select name="job">
                        <option value="salaryman">회사원</option>
                        <option value="developer">개발자</option>
                        <option value="doctor">의사</option>
                        <option value="etc">기타</option>
                    </select>
                </td>
            </tr>
        </table>
        <br/><br/>
       <button>확인</button>
    </form>
</body>
</html>