package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.test") // *은 와일드카드로 앞에 무엇이 붙든 .test로 끝나면 여기로 온다.
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("*.do 패턴이 감지되었습니다.");
		// .test 왼쪽에 오는 문자를 감지하는 방법
		String uri = request.getRequestURI();
		System.out.println("감지된 패턴 : " + uri);
		
		// 문제 : naver.test 로 접속시 네이버로 리다이렉트
		if (uri.equals("/MyFirstWeb/naver.test")) {
			response.sendRedirect("http://www.naver.com");
		// daum.test 로 접속시 다음으로 리다이렉트
		} else if (uri.equals("/MyFirstWeb/daum.test")) {
			response.sendRedirect("http://www.daum.net");
		// youtube.test 로 접속시 유튜브로 리다이렉트
		} else if (uri.equals("/MyFirstWeb/youtube.test")) {
			response.sendRedirect("http://www.youtube.com");
		// 이외 패턴으로 접속시 google.com 으로 리다이렉트 하도록 코드를 짜서 저에게 보내주세요.
		} else {
			response.sendRedirect("http://www.google.com");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
