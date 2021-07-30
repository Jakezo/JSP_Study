package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class ReplyInsertCommand2 implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String mId = request.getParameter("mId");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String bIp = request.getRemoteAddr();
		
		/*
		댓글 삽입 시
		1. bGroup: 게시글 bNo와 같다.
		2. bGroupOrd
		   1) 1을 가진다.
		   2) 기존 댓글들의 bGroupOrd를 1씩 증가시킨다. (별도의 db작업)
		3. bDepth: 게시글의 bDepth + 1이다.
		*/
		
		// 댓글이 달릴 게시글의 정보 가져오기
		BoardDto boardDto = BoardDao.getInstance().boardView(bNo);
		
		// 댓글 만들기
		BoardDto replyDto = new BoardDto();
		replyDto.setbTitle(bTitle);
		replyDto.setbContent(bContent);
		replyDto.setmId(mId);
		replyDto.setbIp(bIp);
		replyDto.setbGroup(bNo);  // replyDto.setbGroup(boardDto.getbNo());
		replyDto.setbGroupOrd(1);
		replyDto.setbDepth(boardDto.getbDepth() + 1);
		
		// 댓글 삽입
		int result = BoardDao.getInstance().replyInsert(replyDto);
		
		// 기존에 달린 댓글들의 bGroupOrd를 모두 1씩 증가시킨다.
		// (가장 먼저 달린 댓글의 bGroupOrd값이 가장 크다.)
		// 기존에 달린 댓글: bGroup이 같고, bGroupOrd가 0이 아닌(bDepth가 0이 아닌) 게시글
		if (result > 0) {
			// BoardDao.getInstance().replyUpdatebGroupOrd2(bNo);
		}
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/replyInsertResult.jsp?result=" + result + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
		
	}

}
