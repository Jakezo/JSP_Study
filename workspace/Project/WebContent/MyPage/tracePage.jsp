<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp" />

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()) {
		title = "기록입니다.";
	}
	pageContext.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<%-- css --%>
<link rel="stylesheet" href="../assets/style/fixed.css" />
<link rel="stylesheet" href="../assets/style/tracePage.css" />
</head>
<body>

	<form>
		<div class="wrap">
				<div id="head_title">다녀간 장소에 내 발자취 남기기</div><br/>
				<div class="head_wrap">
					<div class="box">
						<input type="text" name="stationName" id="index" placeholder="역이름" />
					</div>
					<div class="box">
						<input type="text" name="placeName" id="index"  placeholder="음식점,장소,주소" />
					</div>
				</div>
			<br/><br/><br/>
			<div id="body_title">검색된 장소에 발자취 남기기</div><br/>
			<div class="body_wrap">
				<div>1</div>
				<div>1</div><br/>
				
				<div>2</div>
				<div>2</div><br/>
				
				<div>3</div>
				<div>3</div><br/>
				
				<div>4</div>
				<div>4</div><br/>
				
			</div>
		</div>
	</form>

</body>
</html>

<%@ include file="../template/footer.jsp" %>