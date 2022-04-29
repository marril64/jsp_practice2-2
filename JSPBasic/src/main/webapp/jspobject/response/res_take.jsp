<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String strAge = request.getParameter("age");
	int age = Integer.parseInt(strAge); // 숫자로 이루어진 문자를 정수로 변환
	
	// 대소비교를 하기 위해 정수로 바꿔줍니다.
	if (age >= 20) {
		out.println("성인입니다.");
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/response/res_adult.jsp");
	} else {
		out.println("미성년자입니다.");
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/response/res_kids.jsp");
	}
%>
</body>
</html>