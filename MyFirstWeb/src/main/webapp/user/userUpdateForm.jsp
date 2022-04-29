<%@page import="kr.co.ict.domain.*"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("s_id");

	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
	
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	UserVO user = dao.getUserInfo(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form은 회원가입 양식과 똑같이 만들어주시면 됩니다.
	단, 아이디는 입력하지 않습니다. -->
	<h1><%= userId %>님의 정보를 수정합니다.</h1>
	<form action="userUpdateCheck.jsp" method="post">
		변경하실 비밀번호를 입력해주세요. <input type="password" name="u_pw"><br/>
		변경하실 이름을 입력해주세요. <input type="text" name="u_name" value="<%= user.getUserName() %>"><br/>
		변경하실 이메일을 입력해주세요. <input type="email" name="email" value="<%= user.getEmail() %>">
		<input type="submit" value="변경하기">
	</form>
</body>
</html>
<%/*
	String userId = (String)session.getAttribute("s_id");

	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
	
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	ResultSet rs = null;
	
	try {
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String idCheck = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(idCheck);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}*/
%>
진입점 : userUpdateForm.jsp (session에는 아이디 marril64가 있다고 가정)
----------------------------------------------------------
userUpdateForm.jsp 7번째 라인 우변에 session아이디 marril64를 문자열로 바꾸고 그 문자열을 좌변 userId에 대입.
userUpdateForm.jsp 9번째 ~ 11번째 라인에서 userId에 대입된 값이 null인지 확인 후 null이면 userLoginForm.jsp로 sendRedirect.
userUpdateForm.jsp 13번째 라인에서 UserDAO 생성자 호출.
    UserDAO.java 16번째 라인에서 22번째 라인까지 DB 지정 후 userUpdateForm.jsp 13번째 라인으로 돌아옴.
userUpdateForm.jsp 14번째 라인에서 우변에 .getUserInfo()에 userId 대입.
    UserDAO.java 87번째 라인에서 123번째 라인까지 실행 후 얻어온 결과값을 가지고 userUpdateForm.jsp 14번째 라인으로 돌아옴.
userUpdateForm.jsp 14번째 라인에서 좌변 UserVO 형식으로 생성된 변수 user에 UserDAO.java에서 얻어온 결과값을 대입.
----------------------------------------------------------
결과 : marril64 계정에 대한 정보를 조회할 수 있음.