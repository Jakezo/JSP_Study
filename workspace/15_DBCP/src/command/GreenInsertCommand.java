package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;
import dto.GreenDto;

public class GreenInsertCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB에 삽입 후 결과를 request에 저장
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		GreenDto greenDto = new GreenDto();
		greenDto.setWriter(writer);
		greenDto.setTitle(title);
		greenDto.setContent(content);
		
		int result = GreenDao.getInstance().insert(greenDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("green/insertResult.jsp?result=" + result);	// redirect도 새로운 request는 전달된다.
		pathNRedirect.setRedirect(true);	// redirect (기존 request를 넘기지 않는다)
		
		return pathNRedirect; 
		
	}

}