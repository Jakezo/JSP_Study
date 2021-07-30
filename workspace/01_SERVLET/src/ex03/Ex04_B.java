package ex03;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex04_B")
public class Ex04_B extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex04_B() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 다른 페이지로 이동할 때 redirect를 이용할 수 있습니다.
		// redirect로 이동하면 내가 보낸 request 정보가 유지되지 않습니다.
		
		// 서버 내 이동이 아닙니다.
		// redirect는 사용자에게 이동할 장소를 response(응답)해 주는 방식으로 이동합니다.
		
		response.sendRedirect("/01_SERVLET/Ex04_C");  // 이동할 경로는 사용자가 이동할 수 있도록 전체경로(/컨텍스트패스/URLMapping)를 작성해 줍니다.
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}