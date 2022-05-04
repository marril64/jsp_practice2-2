package kr.co.ict.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

public class BoardDAO {
	// 생성자까지 만들어주세요.
	// 이미 커넥션풀 설정이 되어있으니 UserDAO에서 활성화된 코드만 참조해서
	// 생성자 부분까지만 작성해서 저한테 보내주세요.
	private DataSource ds = null;
	
	private static BoardDAO dao = new BoardDAO();
	
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	// 게시판의 전체 글을 가져오는 getBoardList() 메서드를 작성해주세요.
	// 전체 글을 가져오므로 List<BoardVO> 를 리턴하면 됩니다.
	// 작성시 UserDAO의 getAllUserList()메서드를 참조해주세요.
	public List<BoardVO> getBoardList(int pageNum) { // 모든 자료를 넘겨받으므로 파라미터가 필요없음 -> 바뀜
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> boardList = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM boardTbl ORDER BY board_num DESC limit ((?-1)*10), 10";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));

				boardList.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return boardList;
	} // getBoardList() 끝나는 지점.
	
	// boardtbl에서 row 1개를 가져오거나(글번호 존재시), 안가져옴(없는글번호 입력시)
	public BoardVO getBoardDetail(int bno) { // 쿼리문에 구멍이 뚫려있으므로 파라미터 1개 요구(INSERT는 파라미터 여러개 요구)
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = new BoardVO();
		// upHit(bno); // getBoardDetail 내부에서 호출하도록 해도 조회수는 올라감 (단점 : 수정버튼을 눌러도 조회수가 올라간다.)
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM boardTbl WHERE board_num = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
			} else {
				System.out.println("계정이 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	} // getBoardDetail(int) 끝나는 지점.
	
	// 비 SELECT구문은 void 리턴
	public void boardInsert(String writer, String title, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "INSERT INTO boardTbl (title, content, writer) VALUES (?, ?, ?);";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // boardInsert(str, str, str) 끝나는 지점.
	
	public void boardDelete(int boardNum) { // get방식으로는 권한이 없는 사람이 삭제할 우려가 있으므로 post방식으로 해야한다.
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "DELETE FROM boardTbl WHERE board_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // boardDelete(int) 끝나는 지점.
	
	public void boardUpdate(String writer, String title, String content, int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "UPDATE boardTbl SET title = ?, content = ?, writer = ?, mdate = now() WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setInt(4, boardNum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // boardUpdate(str, str, str) 끝나는 지점.
	
	public void upHit(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ds.getConnection();
			String sql = "UPDATE boardTbl SET hit = hit + 1 WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNum);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // upHit(int) 끝나는 지점.
	
}
