package ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Quiz03")
public class Quiz03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Quiz03() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		
		int kor = Integer.parseInt(request.getParameter("kor"));
		
		int eng = Integer.parseInt(request.getParameter("eng"));
		
		int math = Integer.parseInt(request.getParameter("math"));
		
		double pastscore = Double.parseDouble(request.getParameter("invisiblepastAvg"));
		
		double avg = (kor + eng + math) / 3.0;
		
		char grade;
		
		if (avg >= 90) 
			grade = 'A';
		
		else if (avg >= 80) 
			grade = 'B';
		
		else if (avg >= 70) 
			grade = 'C';
		
		else if (avg >= 60) 
			grade = 'D';
		
		else 
			grade = 'F';
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<!DOGTYPE html>"); // html5 의미
		out.println("<html>");
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println(name + "의 평균은" + avg + "점이고, 학점은 " + grade + "학점이다.");
		out.println("<br/>");
		out.println("지난 시험의 평균은" + pastscore + "점으로 이번 평균과 " + (avg - pastscore) + "점의 차이가 있다." );
		out.println("</body>");
		out.println("</html>");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
