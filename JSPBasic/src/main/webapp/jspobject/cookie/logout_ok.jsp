<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 쿠키는 사용자 PC에 설치해두는 것이기 때문에 명시적으로 삭제하는건 불가능하고
	// 대신 유효시간을 0으로 만들어 삭제하는 것처럼 처리합니다.
	// login_id 라는 이름의 쿠키가 발견되면
	// 유효시간을 0으로 만든 다음 cookie_login.jsp로 보내주는 로직을 작성해주세요.
	Cookie[] cookies = request.getCookies(); // 쿠키 목록 가져오기

	/*for (int i = 0; i < cookies.length; i++) {
		String str = cookies[i].getName();
		
		if (str.equals("login_id")) {
			cookies[i].setMaxAge(0);
		}
	}*/
	
	for (Cookie cookie : cookies) {
		String cookieName = cookie.getName();
		if (cookieName.equals("login_id")) {
			cookie.setMaxAge(0); // 쿠키 유효시간을 0초로 만들기
			response.addCookie(cookie); // 갱신 발급까지 마쳐줘야 한다.
		}
	}
	
	// 리다이렉트로 로그인창으로 보내기
	response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/cookie_login.jsp");
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