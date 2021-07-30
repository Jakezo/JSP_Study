package ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Quiz01")
public class Quiz01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Quiz01() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. response의 content-type, charset을 설정
		response.setContentType("text/html; charset=UTF-8");
		
		// 2. response할 데이터 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		
		String message = year + "년 " + month + "월 " + day + "일 입니다.";
		
		// 3. 츨력스트림을 만들어서 데이터를 전달합니다.
		PrintWriter out = response.getWriter();	
		
		out.println("<!DOGTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Quiz01</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>" + message + "</h1>");
		out.println("</body>");
		out.println("</html>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
