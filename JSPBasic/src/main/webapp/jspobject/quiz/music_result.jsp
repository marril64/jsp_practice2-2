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
	request.setCharacterEncoding("utf-8");
	String song = request.getParameter("song");

	if (song.equals("heaven")) {
		response.sendRedirect("https://www.youtube.com/watch?v=QkF3oxziUI4");
	} else if (song.equals("burn")) {
		response.sendRedirect("https://www.youtube.com/watch?v=LCnebZnysmI");
	} else if (song.equals("breed")) { 
		response.sendRedirect("https://www.youtube.com/watch?v=J6EDW5WFb2M");
	}
%>
</body>
</html>