package command.reply;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.ReplyDao;

public class ReplyDeleteCommand implements ReplyCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String strrNo = request.getParameter("rNo");
		int rNo = 0;
		if (strrNo != null && !strrNo.isEmpty()) {
			rNo = Integer.parseInt(request.getParameter("rNo"));
		}
		String bbs_no = request.getParameter("bbs_no");
		String page = request.getParameter("page");
		
		int result = ReplyDao.getInstance().replyDelete(rNo);
		
		PathNRedirect pathNRedirect = null;
		if (result > 0) {
			// 1. 그 동안 했던 방식 (패턴을 지키는 방식)
			//   pathNRedirect.setPath("bbs/bbsViewResult.jsp");
			//   bbsViewResult.jsp에서 /bbsViewPage.bbs 로 이동
			// 2. 곧바로 DB를 거치도록 이동(/bbsViewPage.bbs)
			pathNRedirect = new PathNRedirect();
			pathNRedirect.setPath("/MyHome/bbsViewPage.bbs?bbs_no=" + bbs_no + "&page=" + page);
			pathNRedirect.setRedirect(true);  // redirect
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글을 삭제할 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return pathNRedirect;
		
	}

}
