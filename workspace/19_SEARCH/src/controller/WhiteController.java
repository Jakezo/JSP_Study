package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.white.WhiteBothCommand;
import command.white.WhiteContentCommand;
import command.white.WhiteListCommand;
import command.white.WhiteTitleCommand;
import common.PathNRedirect;
import common.Command;

@WebServlet("*.white")
public class WhiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WhiteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		
		PathNRedirect pathNRedirect = null;
		
		Command command = null;
		
		switch (cmd) {
		case "/listPage.white" :
			command = new WhiteListCommand();
			pathNRedirect = command.execute(request, response);
			break;
			
		case "/searchTitle.white" :
			command = new WhiteTitleCommand();
			pathNRedirect = command.execute(request, response);
			break;
			
		case "/searchContent.white" :
			command = new WhiteContentCommand();
			pathNRedirect = command.execute(request, response);
			break;
		case "/searchBoth.white" :
			command = new WhiteBothCommand();
			pathNRedirect = command.execute(request, response);
			break;
		}
		
		String path = pathNRedirect.getPath();
		boolean isRedirect = pathNRedirect.isRedirect();
		if (isRedirect) {
			response.sendRedirect(path);
		} else {
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
