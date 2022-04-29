<%@page import="com.ict.domain.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("s_id");

	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
	
	session.invalidate(); // 아이디 삭제 성공 실패 여부에 상관없이 로그아웃을 염두에 둔 행동으로 세션을 먼저 없앤다.
	
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	dao.userDelete(userId);
	
	response.sendRedirect("userLoginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%/*
	// 로그인했는지 여부 확인(세션)
	String userId = (String)session.getAttribute("s_id");

	// 로그인 안했다면 redirect로 로그인창으로 보내기
	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
	
	// 로그인 된 유저라면 해당 유저의 세션에 있던 아이디를 이용해 회원탈퇴 로직 실행
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
		
	try {
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String delete = "DELETE FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(delete);
		pstmt.setString(1, userId);
		pstmt.executeUpdate();
		
		// 한 다음 발급되어있던 세션 파기(로그아웃) 까지 시킨 다음
		session.invalidate();
		
		// 다시 로그인창으로 리다이렉트 해서 보내기
		response.sendRedirect("userLoginForm.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}*/
%>
진입점 : userDelete.jsp (session에는 아이디 marril64가 있다고 가정)
----------------------------------------------------------
userDelete.jsp 6번째 라인 우변에 session아이디 marril64를 문자열로 바꾸고 그 문자열을 좌변 userId에 대입.
userDelete.jsp 8번째 ~ 10번째 라인에서 userId에 대입된 값이 null인지 확인 후 null이면 userLoginForm.jsp로 sendRedirect.
userDelete.jsp 12번째 라인에서 아이디 삭제 성공 여부와 상관없이 로그아웃을 목적으로 한다는 전제하에 세션 파기함.
userDelete.jsp 14번째 라인에서 UserDAO 생성자 호출.
    UserDAO.java 16번째 라인에서 22번째 라인까지 실행후 userDelete.jsp 14번째 라인으로 돌아옴.
userDelete.jsp 15번째 라인에서 dao.userDelete()에 userId를 대입.
    UserDAO.java 128번째 라인에서 151번 라인까지 실행 후 userDelete.jsp 15번째 라인으로 돌아옴.
userDelete.jsp 17번째 라인에서 userLoginForm.jsp로 sendRedirect
----------------------------------------------------------
결과 : marril64 계정 DB에서 삭제되고 userLoginForm.jsp로 리다이렉트