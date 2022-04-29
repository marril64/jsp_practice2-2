<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = (String)session.getAttribute("s_id");
	
	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
	
	String userPw = request.getParameter("u_pw");
	String userName = request.getParameter("u_name");
	String userEmail = request.getParameter("email");
	
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	dao.userUpdateCheck(userId, userPw, userName, userEmail);
	
	response.sendRedirect("updateComplete.jsp");
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
	request.setCharacterEncoding("utf-8");

	String userId = (String)session.getAttribute("s_id");

	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}

	String userPw = request.getParameter("u_pw");
	String userName = request.getParameter("u_name");
	String userEmail = request.getParameter("email");
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	try {
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
				
		String insert = "UPDATE userinfo SET user_pw = ?, user_name = ?, email = ? WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(insert);
		
		pstmt.setString(1, userPw);
		pstmt.setString(2, userName);
		pstmt.setString(3, userEmail);
		pstmt.setString(4, userId);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("updateComplete.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}*/
%>
진입점 : userUpdateCheck.jsp (session에는 아이디 marril64가 있다고 가정)
----------------------------------------------------------
userUpdateCheck.jsp 8번째 라인 우변에 session아이디 marril64를 문자열로 바꾸고 그 문자열을 좌변 userId에 대입.
userUpdateCheck.jsp 10번째 ~ 12번째 라인에서 userId에 대입된 값이 null인지 확인 후 null이면 userLoginForm.jsp로 sendRedirect.
userUpdateCheck.jsp 14번째 라인 우변에 u_pw를 문자열 형태로 받고 좌변 변수 userPw에 대입.
userUpdateCheck.jsp 15번째 라인 우변에 u_name를 문자열 형태로 받고 좌변 변수 userName에 대입.
userUpdateCheck.jsp 16번째 라인 우변에 email를 문자열 형태로 받고 좌변 변수 userEmail에 대입.
userUpdateCheck.jsp 18번째 라인에서 UserDAO 생성자 호출.
    UserDAO.java 16번째 라인에서 22번째 라인까지 실행후 userUpdateCheck.jsp 18번째 라인으로 돌아옴.
userUpdateCheck.jsp 19번째 라인에서 dao.userUpdateCheck()에 userId, userPw, userName, userEmail을 대입.
    UserDAO.java 195번째 라인에서 220번 라인까지 실행 후 userUpdateCheck.jsp 19번째 라인으로 돌아옴.
userUpdateCheck.jsp 21번째 라인에서 updateComplete.jsp로 sendRedirect
----------------------------------------------------------
결과 : marril64 계정을 수정한 정보를 DB에 저장하고 updateComplete.jsp로 리다이렉트