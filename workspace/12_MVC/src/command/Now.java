package command;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Now {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Calendar calender = Calendar.getInstance();
		int hour = calender.get(Calendar.HOUR);
		int minute = calender.get(Calendar.MINUTE);
		int second = calender.get(Calendar.SECOND);
		
		String result = hour + ":" + minute + ":" + second;
		
		request.setAttribute("result", result);
	
		return "view/now.jsp";
	}
}
