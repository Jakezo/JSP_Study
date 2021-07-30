package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.EveningCommand;
import command.LunchCommand;
import command.MorningCommand;

@WebServlet("*.meal")
public class MealController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MealController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		Command command = null;
		switch (cmd) {
		case "/morning.meal":
			command = new MorningCommand();
			break;
			
		case "/lunch.meal":
			command = new LunchCommand();
			break;
		case "/evening.meal":
			command = new EveningCommand();
			break;
		}
		
		String path = command.execute(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
