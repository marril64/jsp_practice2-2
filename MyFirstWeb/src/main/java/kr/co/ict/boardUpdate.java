package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class boardUpdate
 */
@WebServlet("/boardUpdate")
public class boardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.boardUpdate(writer, title, content, num);
		
		response.sendRedirect("/MyFirstWeb/boardDetail?board_num=" + num);
	}

}
