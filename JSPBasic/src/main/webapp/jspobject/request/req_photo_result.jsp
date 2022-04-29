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
	String photo = request.getParameter("photo");

	if (photo.equals("01.png")) {
		out.println("<img src='01.png'>");
	} else {
		out.println("<img src='02.png'>");
	}
%>
</body>
</html>