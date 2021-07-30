package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.PersonCommand;

@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();    // ex)   여기 경우엔 프로젝트의  /view/person.jsp
		String contextPath = request.getContextPath();  // ex)    여기 경우엔 프로젝트의 contextpath /view
		String cmd = requestURI.substring(contextPath.length());
		
		Command command = null;
		switch (cmd) {
		case "/person.do":
			command = new PersonCommand();
			break;
		}
		// 경로 설정
		String path = command.execute(request, response);
		
		// 설정된 경로로 이동
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
