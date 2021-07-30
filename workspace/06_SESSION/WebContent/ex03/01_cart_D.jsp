<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
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
		ArrayList<Map> cart = (ArrayList<Map>)session.getAttribute("cart");
	
		String result = "";
		if (cart == null) {
			// 장바구니가 비어있음
			result = "장바구니가 비었습니다.";
		} else {
			// 장바구니에 값이 있음
			
			for (Map<String , String> map : cart) {
				// for 문이지만 실제로는 한 번 순회한다
				for (Map.Entry<String, String> entry : map.entrySet()) {
					String product = entry.getKey();	// Key값 빼기
					String quantity = entry.getValue();	// Value 값 빼기
					result += product + "&nbsp; &nbsp; &nbsp;" + quantity + "개<br/>";
					
				}
			}
		}
	
	%>

	<h3>장바구니 리스트</h3>
	<%=result %>
	<br/><br/>
	<input type="button" value="계속 쇼핑하기" onclick="location.href = '/06_SESSION/ex03/01_cart_B.jsp'" />
	<input type="button" value="장바구니 비우기" onclick="location.href = '/06_SESSION/ex03/01_cart_E.jsp'" />
	
</body>
</html>