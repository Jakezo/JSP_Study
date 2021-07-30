package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Gugudan;

// URL mapping
// jsp에서 같은 URL Mapping을 가지고 있을 경우 아래를 수행
@WebServlet("/GugudanController")
public class GugudanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GugudanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request에 jsp에서 보낸 start와 end의 요청이 저장된다.
		
		// controller에서 인코딩을 수행함으로써 뒤에서 더 이상의 인코딩을 수행하지 않아도 된다.
		request.setCharacterEncoding("UTF-8");
		
		// Gugudan 객체를 생성
		Gugudan gugudan = new Gugudan();
		
		// Gugudan 객체에 사용자가 원하는 계산을 수행하도록 파라미터(값)을 보내고(request) 그 결과값을 받아온다.(response)
		// 결과를 보낼 위치를 path 변수에 저장한다
		String path = gugudan.execute(request, response);
		
		// forward를 통해 path로 지정된 위치로 파라미터(값)을 보내준다.
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
