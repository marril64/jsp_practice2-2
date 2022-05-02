<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("s_id");

	if (userId == null) {
		response.sendRedirect("userLoginForm.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%= userId %>님 환영합니다!</h3>
	<a href="userLogout.jsp">로그아웃하기</a><br/>
	<a href="userUpdateForm.jsp">회원정보 수정</a><br/>
	<a href="userDelete.jsp">회원탈퇴</a><br/>
	<!-- 게시판으로 이동할 수 있는 링크 -->
	<a href="http://localhost:8181/MyFirstWeb/boardList.do">게시판으로 이동</a>
</body>
</html>