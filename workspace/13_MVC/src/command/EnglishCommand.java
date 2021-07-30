package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EnglishCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("result", "Hellow");
		
		return "view/output.jsp";
	}

}
