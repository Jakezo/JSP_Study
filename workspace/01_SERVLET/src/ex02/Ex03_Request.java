package ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03_Request")
public class Ex03_Request extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ex03_Request() {
        super();
    }
        
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    		/*
    		 *	request 
    		 * 
    		 * 	1. 사용자가 요청한 정보가 저장되는 객체
    		 * 	2. request에 저장된 요청 정보는 "파라미터(parameter)"라고 한다.
    		 * 	3. 모든 파라미터의 타입은 String or String[] 이다.
    		 * 		1) String value = request.getParameter("parameter")
    		 * 		2) String[] list = request.getParameterValues("parameter")
    		 * 	4. request를 이용해 정보를 요청하는 방법
    		 * 		1) <form> 태그의 모든 하위 폼 요소들은 submit하면 정보가 요청된다.
    		 * 		   사용자: <input type="text" name="id" /> submit 하면
    		 * 		   서버   : String id = request.getParameter("id"); 로 받아 들인다.
    		 * 			* 태그의 name이 없을 경우 서버측에서 데이터를 받아들이지 못 한다.
    		 * 		2) URL에 파라미터를 포함한다.
    		 * 			URL: 호스트:포트번호/ContextPath/URLMapping?파라미터=값&파라미터=값
    		 */
    	
    	// 실행방법
    	// 1. 실행
    	// 2. URL수정
    	// 3-1.처음주소 : localhost:9090/01_SERVLET/Ex03_request
    	// 3-2.추가주소 : localhost:9090/01_SERVLET/Ex03_request?name=에밀리&age=20&address=서울시 마포구
    	
    	// request가 어떤 인코딩인지 모르므로 
    	// UTF-8로 설정하고 시작
    	request.setCharacterEncoding("UTF-8");
    	
    	// 파라미터로 name, age, address가 전달된다.
    	String name = request.getParameter("name");
    	String age =request.getParameter("age");
    	String address = request.getParameter("address");
    	
    	// response 생성
    	// 1. content-type, charset
    	response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
    	
		// 2. 출력스트림 생성
		PrintWriter out = response.getWriter();
		
		// 3. 출력할 내용 만들기
    	out.println("<!DOGTYPE html>");	// html5 의미
		out.println("<html>");
		out.println("<head>");
		out.println("<title>제목</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>이름: " + name + "</h3>");
		out.println("<h3>나이: " + age + "</h3>");
		out.println("<h3>주소: " + address + "</h3>");
		out.println("</body>");
		out.println("</html>");
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}
