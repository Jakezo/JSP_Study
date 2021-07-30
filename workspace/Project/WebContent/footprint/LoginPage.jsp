<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- css --%>
<%--
<link rel="stylesheet" href="assets/style/loginPage.css">
--%>
<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}
	body {
		background: gray;
	}

	.lgn_main {
		border: 1px solid gray;
		border-radius: 50px;
		width: 500px;
		height: 540px;
		background: white;
		margin: 200px 600px;
		padding: 30px 80px; 
		position: relative;
	}
	.lgn_text {
		font-size: 50px;
		font-weight: bold;
	}
	
	#lgn_id, #lgn_pw {
		border: 3px solid black;
		border-radius: 10px;
		width: 470px;
		height: 80px;
		margin: 10px 0px;
		line-height: auto;
		font-size: 25px;
		padding-left: 20px;
	}
	
	.lgn_main_middle_right {
		float: right;
		font-size: 100px;
	}
	
	.lgn_main_bottom {
		bottom: 20px;
	}
</style>
</head>
<body>
<form method="post">
	<div class="lgn_background">
		<div class="lgn_main">
			<div class="lgn_main_top">
				<div class="lgn_text">로그인</div>
				<input type="text" id="lgn_id" name="lgn_id" placeholder="이메일" /><br/>
				<input type="password" id="lgn_pw" name="lgn_pw" placeholder="비밀번호" />
			</div>
			<div class="lgn_main_middle">
				<div class="lgn_main_middle_left">
					<input type="checkbox" id="lgn_ing" value=""/><label for="lgn_ing">로그인 유지</label>
					<br/>
					<button name="kakao_lgn_btn">
						<span>
							K
						</span>
					</button>
					<button name="naver_lgn_btn">
						<span>
							N
						</span>
					</button>
					<button name="fakebook_lgn_btn">
						<span>
							F
						</span>
					</button>
					<button name="google_lgn_btn">
						<span>
							G
						</span>
					</button>
				</div>
				<div class="lgn_main_middle_right">
					<button name="lgn_go_btn">
						→
					</button>
				</div>
			</div>
			<div class="lgn_main_bottom">
				<a href="" >아이디 찾기</a>
				<a href="" >비밀번호 찾기</a>
				<a href="" >회원가입</a>
			</div>
		</div>
	</div>
</form>

</body>
</html>