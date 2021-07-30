package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugudan {
		
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터로 받았기 때문에 사용하기 위해 별도로 저장
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		// 파라미터를 입력 받게 되면 무조건 String 형이기 떄문에 형변환이 필요하다
		int startDan = Integer.parseInt(start);
		int endDan = Integer.parseInt(end);
		
		// StringBuffer
		// StringBuffer 클래스는 Buffer라는 공간을 별도로 가짐
		// 문자열을 바로 추가할 수 있어, 공간의 낭비도 없고 속도도 빠르다.
		StringBuffer sb = new StringBuffer();
		
		for (int dan = startDan; dan <= endDan; dan++) {
			for (int n = 1; n <= 9; n++) {
				// 문자열 추가시 append() 사용
				sb.append(dan + "*" + n + "=" + (dan*n) + "<br/>");
			}
		}
		// 계산의 결과를 request의 속성으로 담아놓는다.
		// ("속성의 저장 이름", 저장할 값)
		request.setAttribute("result", sb.toString());
		
		// 보내고자 하는 위치
		return "view/gugudan.jsp";
		
	}
	
	
}
