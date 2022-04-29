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
	<h3>회원정보를 수정했습니다.</h3>
	<a href="loginWelcome.jsp">이동</a>
</body>
</html>