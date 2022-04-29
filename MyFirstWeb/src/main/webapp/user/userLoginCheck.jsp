<%@page import="kr.co.ict.domain.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	UserVO user = dao.getUserInfo(userId);
	
	try {
		if (user.getUserId() != null) {
			if (user.getUserPw().equals(userPw)) {
				session.setAttribute("s_id", userId);
				session.setAttribute("s_pw", userPw);
				response.sendRedirect("loginWelcome.jsp");
			} else {
				response.sendRedirect("userPwFail.jsp");
			}
		} else {
			response.sendRedirect("userIdFail.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
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
String dbType = "com.mysql.cj.jdbc.Driver";
String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
String connectId = "root";
String connectPw = "1111";

ResultSet rs = null;
// ResultSet의 데이터를 자바 클래스로 교체할 수 있도록 UserVO를 생성
UserVO user = new UserVO();

try {
	Class.forName(dbType);
	Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
	String getUser = "SELECT * FROM userinfo WHERE user_id = ?";
	PreparedStatement pstmt = con.prepareStatement(getUser);
	pstmt.setString(1, userId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) { // 메모리 회수를 위해 바로 조회
		if (rs.getString("user_pw").equals(userPw)) {
			// 생성된 UserVO에 Setter를 이용해 변수명에 맞는 자료 입력
			user.setUserId(rs.getString(1));
			user.setUserPw(rs.getString(2));
			user.setUserName(rs.getString(3));
			user.setEmail(rs.getString(4));
			
			
			System.out.println(user);
			System.out.println(user.getUserId());
			System.out.println(user.getUserPw());
			System.out.println(user.getUserName());
			System.out.println(user.getEmail());
			
			session.setAttribute("s_id", userId);
			session.setAttribute("s_pw", userPw);
			response.sendRedirect("loginWelcome.jsp");
		} else {
			response.sendRedirect("userPwFail.jsp");
		}
	} else {
		response.sendRedirect("userIdFail.jsp");
	}
	rs.close(); // ResultSet, Connection, PreparedStatement는 .close()로 닫을수있음.
} catch (Exception e) {
	e.printStackTrace();
}

// 질문이 뭐더라...?

// rs에 들어있던 정보(아이디, 비번, 이메일, 이름)를 화면에 출력해보세요.
// out.println(); 을 이용하세요.
if (rs.next()) {
	for (int i = 1; i <= 4; i++) {
		out.println(rs.getString(i) + "</br>");
	}
}*/
%>