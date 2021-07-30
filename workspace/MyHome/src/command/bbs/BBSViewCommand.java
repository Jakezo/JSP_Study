package command.bbs;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.PathNRedirect;
import dao.BBSDao;
import dao.ReplyDao;
import dto.BBSDto;
import dto.ReplyDto;

public class BBSViewCommand implements BBSCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String str_bbs_no = request.getParameter("bbs_no");
		int bbs_no = 0;
		if (str_bbs_no != null && !str_bbs_no.isEmpty()) {
			bbs_no = Integer.parseInt(str_bbs_no);
		}
		
		BBSDto bbsDto = BBSDao.getInstance().bbsView(bbs_no);
		
		// 보고 있는 게시물인 bbsDto를 session에 올려 두면, 수정이나 삭제가 쉽다.
		HttpSession session = request.getSession();
		session.setAttribute("bbsDto", bbsDto);
		
		// 보고 있는 게시물에 달려 있는 답변 목록을 가져오기
		// 답변 목록을 session에 올려 둔다.
		List<ReplyDto> replyList = ReplyDao.getInstance().replyList(bbs_no);
		session.setAttribute("replyList", replyList);
		
		// 조회수 증가하기
		// 처음으로 열었을 때만 (수정 후 다시 View로 되돌아 오는 경우 등을 제외하기 위해서)
		// 조회수를 증가시키기 위해서 추가 작업을 수행한다.
		// 처음 열 때 session에 "open" 속성 값을 "yes"로 저장해 둔다.
		// (session에 "open" 속성이 없다면 처음 연 것이라고 볼 수 있다.)
		String open = (String) session.getAttribute("open");
		if (open == null) {
			session.setAttribute("open", "yes");
			BBSDao.getInstance().bbsUpdateHit(bbs_no);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();		
		if (bbsDto != null) {
			pathNRedirect.setPath("bbs/bbsViewPage.jsp?page=" + request.getParameter("page"));
			pathNRedirect.setRedirect(false);  // forward
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 게시물이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return pathNRedirect;
		
	}

}
