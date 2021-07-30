package ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz02")
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Quiz02() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// request에서 파라미터 꺼내기
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");

		String pw = request.getParameter("pw");

		String gender = request.getParameter("gender");

		String[] interest = request.getParameterValues("interest");

		String city = request.getParameter("city");

		String[] jobs = request.getParameterValues("jobs");

		String memo = request.getParameter("memo");

		String visible1 = request.getParameter("visible1");
		String visible2 = request.getParameter("visible2");

		// response 생성
		// 1. content-type, charset
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		// 2. 출력스트림 생성
		PrintWriter out = response.getWriter();

		// 3. 출력할 내용 만들기
		out.println("<!DOGTYPE html>"); // html5 의미
		out.println("<html>");
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<ul>");
		out.println("<li><h3>아이디: " + id + "</h3></li>");
		out.println("<li><h3>비밀번호: " + pw + "</h3></li>");
		out.println("<li><h3>성별: " + gender + "</h3></li>");
		out.println("<li><h3>취미: " + Arrays.toString(interest) + "</h3></li>");

		out.println("<li><h3>주소: " + city + "</h3></li>");
		out.println("<li><h3>직업: " + Arrays.deepToString(jobs) + "</h3></li>");
		out.println("<li><h3>메모: " + memo + "</h3></li>");

		out.println("<li><h3>키: " + visible1 + "</h3></li>");
		out.println("<li><h3>몸무게: " + visible2 + "</h3></li>");
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
