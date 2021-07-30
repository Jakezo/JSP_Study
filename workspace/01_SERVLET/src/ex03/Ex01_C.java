package ex03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01_C")
public class Ex01_C extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ex01_C() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// response 생성
		// 1. content-type, charset
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		// 2. 출력스트림 생성
		PrintWriter out = response.getWriter();
		
		// 3. 출력할 내용 만들기
		out.println("<!DOGTYPE html>"); // html5 의미
		out.println("<html>");
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>다시 받은 이름:" + name + "</h3>");
		out.println("<h3>디사 받은 나이:" + age + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
