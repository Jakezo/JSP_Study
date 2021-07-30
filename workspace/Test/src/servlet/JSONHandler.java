package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/JSONHandler.java")
public class JSONHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JSONHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int name = Integer.parseInt(request.getParameter("name"));
		char age = request.getParameter("age").charAt(0);
		String isMarried = request.getParameter("isMarried");
		
		JSONObject obj = new JSONObject();
		obj.put("name", "에밀리");
		obj.put("age", 30);
		obj.put("isMarried", "여");
		
		String result = null;
		
		request.setAttribute("result", obj);
		
		request.getRequestDispatcher("output.jsp").forward(request, response);
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
