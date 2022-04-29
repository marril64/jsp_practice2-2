<%@page import="kr.co.ict.domain.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("u_id");
	String userPw = request.getParameter("u_pw");
	String userName = request.getParameter("u_name");
	String userEmail = request.getParameter("email");
	
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	if (dao.userJoinCheck(userId, userPw, userName, userEmail)) {
		response.sendRedirect("joinWelcome.jsp");
	} else {
		response.sendRedirect("joinFail.jsp");
	}
%>
<%
	// request.setCharacterEncoding("utf-8");
	// String formId = request.getParameter("fId");
	// String formPw = request.getParameter("fPw");
	// String formName = request.getParameter("fName");
	// String formEmail = request.getParameter("fEmail");
	
	// 회원가입을 처리하는 로직을 작성해주세요.
	// 쿼리문은 INSERT INTO user VALUES (아이디, 비번, 이름, 이메일);
	// DB와 연동해서 formId에 해당하는 유저 전체 정보를 받아줍니다.(getUserInfo.jsp로직을 참조)
	
	// 1. DAO 생성
	// UserDAO dao = new UserDAO();
	// 2. userJoinCheck 메서드 호출 후 진입점(userJoinCheck.jsp)
	//    전달 fId = abcd, fPw = 1234, fName = 알파, email = alpha@alpha.com
	//    위 정보를 토대로 .userJoinCheck()를 실행하는 로직의 순서를 적어주세요.
	// dao.userJoinCheck(formId, formPw, formName, formEmail);
	// response.sendRedirect("userLoginForm.jsp");
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
	
	String userId = request.getParameter("u_id");
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
		String idCheck = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(idCheck);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			response.sendRedirect("joinFail.jsp");
		} else {
			String insert = "INSERT INTO userinfo VALUES (?, ?, ?, ?)";
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);
			pstmt.executeUpdate();
			response.sendRedirect("joinWelcome.jsp");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}*/
%>
진입점 : userJoinCheck.jsp
fId = abcd, fPw = 1234, fName = 알파, email = alpha@alpha.com
-----------------------------------
userJoinCheck.jsp의 19번 라인에 의해 한글 깨짐 방지
userJoinCheck.jsp의 20번 라인 우변에 문자열 abcd를 받아온 후 좌변 변수 formId에 저장.
userJoinCheck.jsp의 21번 라인 우변에 문자열 1234를 받아온 후 좌변 변수 formPw에 저장.
userJoinCheck.jsp의 22번 라인 우변에 문자열 알파를 받아온 후 좌변 변수 formName에 저장.
userJoinCheck.jsp의 23번 라인 우변에 문자열 alpha@alpha.com을 받아온 후 좌변 변수 formEmail에 저장.
userJoinCheck.jsp의 30번 라인에 의해 DAO 생성
    UserDAO.java의 16번 ~ 22번을 통해 MySQL 사용을 지정한 후 userJoinCheck.jsp의 30번째 줄로 돌아와 좌변 dao에 대입.
userJoincheck.jsp의 34번 라인에 의해 .userJoinCheck 안에 formId, formPw, formName, formEmail를 대입한다.
    UserDAO.java의 154번 ~ 193번을 통해 중복 아이디 검사 후 DB에 abcd, 1234, 알파, alpha@alpha.com을 저장 후 34번 라인으로 돌아옴
userJoinCheck.jsp의 35번 라인에 의해 userLoginForm.jsp로 리다이렉트.
------------------------------------
결과 : abcd계정 DB에 추가되고, userLoginForm.jsp로 리다이렉트