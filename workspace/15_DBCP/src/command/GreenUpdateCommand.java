package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.GreenDao;
import dto.GreenDto;

public class GreenUpdateCommand implements GreenCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		GreenDto greenDto = new GreenDto();
		greenDto.setNo(no);
		greenDto.setTitle(title);
		greenDto.setContent(content);
		
		int result = GreenDao.getInstance().update(greenDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		if (result > 0) {	// 수정이 성공
			pathNRedirect.setPath("green/updateSuccess.jsp?no=" + no);
			pathNRedirect.setRedirect(true);	// redirect
		} else {	// 수정이 실패하면
			pathNRedirect.setPath("green/updateFail.jsp");
			pathNRedirect.setRedirect(false);	// forward
		}
		
		return pathNRedirect;
	}

}
