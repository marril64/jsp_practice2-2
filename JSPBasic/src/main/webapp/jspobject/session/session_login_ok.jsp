<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 검사를 통해 세션값을 변수에 저장합니다.
	String userId = (String)session.getAttribute("s_id");

	// 비로그인사용자가(s_id로 발급된 세션이 없는 사용자가) 해당 페이지 접근시 userId == null 입니다.
	// 로그인 안 한 사용자가 접근할 경우 강제로 로그인창으로 보내는 로직을 아래에 작성해주세요.
	if (userId == null) {
		response.sendRedirect("session_login_form.jsp");
	}
	
	// application.getAttribute() 를 이용해 값을 받아와서 아래에 출력해주세요.
	Integer temp = (Integer)application.getAttribute("visit");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= userId %>님 로그인을 환영합니다!</h1>
	<h2>어플리케이션에 들어있던 값 : <%= temp %></h2>
	<a href="session_logout.jsp">로그아웃하기</a>
</body>
</html>