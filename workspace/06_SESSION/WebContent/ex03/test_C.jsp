<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	
		String product = request.getParameter("product");
		String amount = request.getParameter("amount");
		
		// 제품 (Key), 개수(value)
		Map<String, String> map = new HashMap<>();
		
		map.put(product, amount);
		
		// cart 생성
		// ArrayList<Map> cart = new ArrayList<>();
		
		// session에서 cart를 꺼내왔는데 없는 경우에는 새로 cart를 만든다.
		// (ArrayList<Map> = 캐스팅)
		ArrayList<Map> cart = (ArrayList<Map>)session.getAttribute("cart");
		
		if (cart == null) {
			// cart가 비어있는 경우
			// cart 새로 만들기
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);	// 장바구니 세션에 보관
		}
		
		// map(제품)을 cart(장바구니)에 담아 둔다.
		// ArrayList이 데이터 추가 메소드 : add
		cart.add(map);
	%>
	
	<script type="text/javascript">
	// 자바 변수는 자바스크립트에서 사용할 수 있다.
	// 제품명
	// 냉장고를 장바구니에 추가 (alert)
	// 장바구니로 가려면 "확인" (confirm)
	// 계속 쇼핑하려면 "취소"를 누르세요
	
	
	alert('<%=product%>' + '를 장바구니에 추가했습니다.');
	
	if (confirm ('장바구니로 가려면 "확인", 계속 쇼핑하려면 "취소"를 누르세요.')) {
		// 쇼핑을 종료, 장바구니로 가겠다.
		location.href='/06_SESSION/ex03/test_D.jsp';
	} else {
		// 쇼핑을 계속 하겠다. 
		location.href='/06_SESSION/ex03/test_B.jsp';
	}
	
	</script>

</body>
</html>