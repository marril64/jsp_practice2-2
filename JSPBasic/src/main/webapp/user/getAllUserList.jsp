<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ict.domain.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아래쪽에 원래 작성된 접속 로직 저장되어있음.
	// UserDAO dao = new UserDAO(); // 생성과 동시에 Class.forName(디비타입) 까지 호출
	UserDAO dao = UserDAO.getInstance(); // 싱글턴에 의해 static영역 변수 주소만 받아옴.
	List<UserVO> userList = dao.getAllUserList(); // DB연결해 전체 목록 가져다 주고 종료.
	// out.println("DAO에서 전달받은 자료들 : " + userList);
%>
<%
/*	// 스크립트릿 내부에 전체 회원정보를 가져오도록 코드를 작성해서
	// ResultSet 변수에 저장까지만 해주세요.
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "1111";
	
	// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
	// 그래서 body태그에 출력해야하는 필수요소는 try 진입 전 선언해놔야함
	ResultSet rs = null;
	
	try {
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		String getUser = "SELECT * FROM userinfo";
		PreparedStatement pstmt = con.prepareStatement(getUser);
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// ResultSet에 든 정보를 여기에 out.println()이나
		// 표현식<%= % >을 이용해 출력시도를 해보세요.
		/*while(rs.next()) {
			out.println(rs.getString("user_id") + "<br/>");
			out.println(rs.getString("user_name") + "<br/>");
			out.println(rs.getString("email") + "<br/>");
			out.println("<hr/>");
		}*/
	%>
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>
			<% for(UserVO board : userList) { %>
				<tr>
					<td><%= board.getUserId() %></td>
					<td><%= board.getUserName() %></td>
					<td><%= board.getEmail() %></td>
				</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>

진입점 : http://localhost:8181/JDBCPrj/user/getAllUserList.jsp
----------------------------------------------------------
getAllUserList.jsp 9번 라인 우변 생성자 호출.
    UserDAO.java 16번~22번 실행
getAllUserList.jsp 9번 라인 우변 복귀 후 결과를 좌변에 대입.
getAllUserList.jsp 10번 라인 우변 .getAllUserList() 호출.
    UserDAO.java 29번~83번 실행
getAllUserList.jsp 10번라인 우변 복귀 후 결과를 좌변에 대입.(결과는 모든 회원 리스트)
getAllUserList.jsp 11번라인 실행(userList 브라우저에 출력)
getAllUserList.jsp 41~60라인 화면 구성
getAllUserList.jsp 61~67까지 반복문 호출로 유저정보 화면에 구성
getAllUserList.jsp 68~71까지 화면 구성
------------------------------------------------------------
결과 : 전체 회원정보가 화면에 출력