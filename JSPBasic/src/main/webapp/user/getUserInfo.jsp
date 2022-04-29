<%@page import="com.ict.domain.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	// 스크립트릿 내부에 전체 회원정보를 가져오도록 코드를 작성해서
	
	// - DAO생성(MySQL을 쓴다고 지정)
	// UserDAO dao = new UserDAO();
	UserDAO dao = UserDAO.getInstance();
	// - DAO 내부 메서드인 .getUserInfo(유저명) 호출
	UserVO user = dao.getUserInfo(userId);
	out.println(user);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 4. body 내부에 XX 유저의 정보입니다 라는 문장과 함께 전체 정보가 나오도록 코드를 짜주세요.
	%>
	<h3><%= userId %> 유저의 정보입니다.</h3>
	<!-- 유저 정보를 여기에 작성해 주세요. -->
	<%
		out.println("아이디 : " + user.getUserId() + "<br/>");
		out.println("비밀번호 : " + user.getUserPw() + "<br/>");
		out.println("이름 : " + user.getUserName() + "<br/>");
		out.println("이메일 : " + user.getEmail() + "<br/>");
	%>
	<%
		String[] a = {"아이디 : ", "비밀번호 : ", "이름 : ", "이메일 : "};
	
		// 5. 폼에서 전달한 아이디를 처리할 수 있도록 getUserInfoForm.jsp를 추가해주세요.
		/*if (rs.next()) {
			for (int i = 0; i < a.length; i++) {
				out.println(a[i] + rs.getString(i + 1) + "<br/>");
			}
		} else {
			out.println("아이디가 존재하지 않습니다.");
		}*/
	%>
</body>
</html>
<%/*
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면(request.get?????)
	String userId = request.getParameter("userId"); // 우변에 있는건 http 프로토콜에 있는 변수이다.

	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	ResultSet rs = null; // SELECT 구문에만 쓸 수 있다.
	
	try {
		// 2. DB연동 후
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		
		// 3. 해당 아이디의 정보만 ResultSet에 받아와서
		String getUser = "SELECT * FROM userinfo WHERE user_id = ?";
		PreparedStatement pstmt = con.prepareStatement(getUser);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
	*/
%>
진입점 : http://localhost:8181/JSPBasic/user/getUserInfo.jsp
----------------------------------------------------------
getUserInfo.jsp의 7번라인에서 ?userId=아이디값 저장(예시아이디 : marril64)
getUserInfo.jsp의 11번 라인의 우변 UserVO()실행;
    UserDAO.java의 16번~22번 실행(사용DB정보 세팅)
getUserInfo.jsp의 11번 라인으로 복귀 후 우변 정보 좌변에 대입.
getUserInfo.jsp의 13번 라인의 우변 .getUserInfo("marril64") 를 실행;
    UserDAO.java의 87번~정확히는 122번 실행 후 marril64유저 정보 리턴
getUserInfo.jsp의 13번 라인으로 복귀 후 우변의 marril64유저 정보 좌변에 대입.
getUserInfo.jsp의 14번 라인에 의해 콘솔에 marril64유저 정보 출력.
getUserInfo.jsp의 29번~32번 라인에 의해 브라우저상에 marril64유저 정보 출력.
----------------------------------------------------------
결과 : 조회한 회원 정보가 브라우저상에 출력됨.