<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	
	System.out.println("아이디 : " + userId);
	System.out.println("비밀번호 : " + userPw);
	
	// 세션 로그인처리를 해보겠습니다.
	// 세션 로그인처리는 쿠키 로그인 처리와는 달리 모든 세션목록을 반복문으로 뒤질 필요가 없어서 효율적입니다.
	// 아이디 : "abc1234", 비밀번호 : "1111"
	// 위 고정 문자열을 아이디, 비밀번호로 사용하여
	
	// 아이디가 있는 경우와 없는 경우
	if (userId.equals("abc1234")) {
		// 비밀번호가 맞는경우와 틀린경우
		//를 나눠서 성공시 세션을 발급받고
		if (userPw.equals("1111")) {
			// 세션 발급 후 session_login_ok.jsp로 보내주세요.
			// 세션명은 "s_id"
			session.setAttribute("s_id", userId); // 추후 DB와 비교할 때는 위의 변수명으로 지정한다.
			response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_login_ok.jsp");
		} else {
			// session_pw_fail.jsp로 보내주세요.
			response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/session/session_pw_fail.jsp");
		}
	} else {
		// session_id_fail.jsp로 보내주세요.
		response.sendRedirect("session_id_fail.jsp"); // 같은 폴더안에 있으면 부분적으로 생략이 가능하다.
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