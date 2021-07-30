package command.white;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import common.Command;
import dao.WhiteDao;
import dto.WhiteDto;

public class WhiteBothCommand implements Command {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) {
		
		// DB의 결과를 통일시키기 위해
		// Command에서 만능문자(%)를 미리 처리해두면
		// mapper에서는 표준 SQL에 가까운 쿼리문읠 작성이 가능하다.
		String query = "%" + request.getParameter("query") + "%";
		
		// List<WhiteDto> list = WhiteDao.getInsetance().bothList(query);
		request.setAttribute("list", WhiteDao.getInsetance().bothList(query));
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("white/listPage.jsp");
		pathNRedirect.setRedirect(false);
		
		return pathNRedirect;
				
	}

}
