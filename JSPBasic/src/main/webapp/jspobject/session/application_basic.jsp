<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int visitCnt = 0;

	Integer temp = (Integer)application.getAttribute("visit");
	if (temp != null) {
		visitCnt = temp;
	}
	visitCnt++;
	
	application.setAttribute("visit", visitCnt);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방문자수 : <%= visitCnt %></h3>
</body>
</html>