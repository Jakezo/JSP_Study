<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="03_quiz_B.jsp" method="post">
		<table border="1">
			<thead>
				<tr >
					<th colspan="2">개인정보처리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>성명</td>
					<td><input type="text" name="name" /></td>
				</tr>
				
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" /></td>
				</tr>
				
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="남" />남
						<input type="radio" name="gender" value="여" />여
					</td>
				</tr>
				
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="hobbies" value="운동" />운동
						<input type="checkbox" name="hobbies" value="여행" />여행
						<input type="checkbox" name="hobbies" value="영화" />영화
						<input type="checkbox" name="hobbies" value="휴식" />휴식
					</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>
						<select name="address">
							<option value="서울">서울</option>
							<option value="제주">제주</option>
							<option value="부산">부산</option>
							<option value="일산">일산</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>좋아하는 음식</td>
					<td>
						<select name="foods" multiple>
							<option value="짜장">짜장</option>
							<option value="짬뽕">짬뽕</option>
							<option value="탕수육">탕수육</option>
							<option value="볶음밥">볶음밥</option>
						</select>
					</td>
				</tr>
				
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2"><button>전송</button></th>
				</tr>
		</table>
	</form>

</body>
</html>