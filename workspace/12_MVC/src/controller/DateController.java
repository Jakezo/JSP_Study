package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Today;

@WebServlet("/DateController")
public class DateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Controller의 역할
		// 1. 요청을 확인하고, 요청을 처리할 Model(Command)을 호출한다.
		// 2. Model(Command)이 반환한 결과와 응답VIEW를 이용해서 페이지이동(응답)을 한다.
		
		Today today = new Today();
		String path = today.execute(request, response);
		
		// path로 이동
		// Today Command가 request에 result를 저장해 주었으므로
		// 이를 전달하기 위해서 forward한다.
		
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
