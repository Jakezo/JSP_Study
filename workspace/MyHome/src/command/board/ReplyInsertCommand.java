package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PathNRedirect;
import dao.BoardDao;
import dto.BoardDto;

public class ReplyInsertCommand implements BoardCommand {

	@Override
	public PathNRedirect execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String page = request.getParameter("page");
		
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String mId = request.getParameter("mId");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String bIp = request.getRemoteAddr();
		
		// 댓글이 달릴 게시글(원글)의 정보 가져오기
		BoardDto boardDto = BoardDao.getInstance().boardView(bNo);
		
		// 1. 같은 bGroup에서 원글의 gGroupOrd보다 큰 bGroupOrd를 1씩 증가시킨다.
		BoardDao.getInstance().replyUpdatebGroupOrd(boardDto);
		
		// 2. 댓글 만들기
		//    1) bGroup		: 원글의 bGroup (boardDto.getbGroup())
		//    2) bGroupOrd	: 원글의 bGroupOrd + 1 (boardDto.getbGroupOrd() + 1)
		//    3) bDepth		: 원글의 bDepth + 1
		BoardDto replyDto = new BoardDto();
		replyDto.setbTitle(bTitle);
		replyDto.setbContent(bContent);
		replyDto.setmId(mId);
		replyDto.setbIp(bIp);
		replyDto.setbGroup(boardDto.getbGroup());
		replyDto.setbGroupOrd(boardDto.getbGroupOrd() + 1);
		replyDto.setbDepth(boardDto.getbDepth() + 1);
		
		// 댓글 삽입
		int result = BoardDao.getInstance().replyInsert(replyDto);
		
		PathNRedirect pathNRedirect = new PathNRedirect();
		pathNRedirect.setPath("board/replyInsertResult.jsp?result=" + result + "&page=" + page);
		pathNRedirect.setRedirect(true);
		return pathNRedirect;
		
	}

}
