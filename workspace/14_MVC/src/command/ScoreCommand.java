package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScoreCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		double average = (kor + eng + math) / 3.0;
		request.setAttribute("average", average);
		
		// 합격 유무 (80이상 합격)
		request.setAttribute("pass", average >= 80 ? "합격" : "불합격");
		
		return "/view/scoreOutput.jsp";
	}

}
