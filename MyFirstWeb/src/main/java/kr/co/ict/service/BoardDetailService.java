package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

public class BoardDetailService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("board_num"));
		
		dao.upHit(num); // 먼저 조회수를 1 증가시키고 (DB접근 1번)
		
		BoardVO board = dao.getBoardDetail(num); // 증가된 조회수와 같이 디테일하게 보여준다.(DB접근 2번)
		request.setAttribute("board", board); // 총 두번의 DB접근이 일어난다. (더 늘어날 수도 있다.)
	}

}
