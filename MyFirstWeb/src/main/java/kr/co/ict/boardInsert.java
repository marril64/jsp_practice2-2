package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;

/**
 * Servlet implementation class boardInsert
 */
@WebServlet("/boardInsert")
public class boardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// System.out.println("글쓴이 : " + request.getParameter("writer") + ", 글제목 : " + request.getParameter("title") + ", 글내용 : " + request.getParameter("content"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// dao생성
		BoardDAO dao = BoardDAO.getInstance();
		
		// dao의 insert기능 호출 및 파라미터 매칭
		dao.boardInsert(writer, title, content);
		
		// /boardList로 리다이렉트
		response.sendRedirect("/MyFirstWeb/boardList"); // 서블릿 주소로 리다이렉트시 파일이름 노출 안됨.
		
		// 포워드로 변경은 가능하나 할 필요가 없다.
		// RequestDispatcher dp = request.getRequestDispatcher("/boardList");
		// dp.forward(request, response);
	}

}
