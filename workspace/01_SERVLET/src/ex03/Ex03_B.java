package ex03;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03_B")
public class Ex03_B extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex03_B() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 다른 페이지로 이동하는 방법 중에서 "포워드"라는 방법이 있다.
		// 포워드(forward)란 기존 request를 다른 페이지로 함께 보내주는 이동방법
		
		// request를 forward 해 주겠다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("Ex03_C");	// request를 다시 보낼 곳은 Ex03_C
		dispatcher.forward(request, response);									// request를 다시 보낸다.
		
		// URL 값에는 /Ex03_B로 뜬다
		// contextPath를 작성하지 않는 이유는 이미 해당 서버에 들어와 있기 때문
		// 서버 내부의 이동이기  때문에 외부에는 보이질 않는다.
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
