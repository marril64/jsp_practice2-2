package kr.co.ict.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

// IBoardService를 구현해주는 BoardListService
public class BoardListService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DAO는 다시 생성해줘야합니다.
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> boardList = dao.getBoardList();
		request.setAttribute("boardList", boardList);
		
	}

}
