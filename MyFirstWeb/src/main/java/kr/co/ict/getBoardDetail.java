package kr.co.ict;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class getBoardDetail
 */
@WebServlet("/boardDetail")
public class getBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public getBoardDetail() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 글번호("board_num") 을 받아오세요.
		int num = Integer.parseInt(request.getParameter("board_num"));
		// DAO를 생성하세요.
		BoardDAO dao = BoardDAO.getInstance();
		// DAO에서 호출한 디테일 글 정보를 저장해주세요.
		BoardVO board = dao.getBoardDetail(num);
		// 얻어온 글 정보를 디버깅해주세요.
		System.out.println(board);
		// 바인딩해주세요.
		request.setAttribute("board", board);
		// 포워딩해주세요.(/board/boardDetail.jsp로)
		RequestDispatcher dp = request.getRequestDispatcher("board/boardDetail.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
