package command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Today {
	
	// Model
	// 1. Controller에게 결과와 응답할 VIEW를 반환한다.
	// 	1) 반환값은 응답VIEW이다.
	// 	2) 결과값은 request에 저장한다.
	// 2. 매개변수로 HttpServletRequest 클래스 타입의 request가 필요하다.
	// 3. 매개변수로 HttpServletResponse 클래스 타입의 response도 필요할 수 있다.
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 현재 날짜를 구해서 request에 저장하기
		Date result = new Date(System.currentTimeMillis());
		request.setAttribute("result", result);
		
		// 2. 결과를 보여 줄 VIEW이름을 반환하기
		return "view/today.jsp";
		
	}

}
