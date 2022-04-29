<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int total = 0;
%>
<%
	total++;
	int random = (int)(Math.random() * 8) + 2;
%>
<p>페이지 누적 요청 수 : <%= total %></p>
<p>매 <b>10</b>번째 방문자에게는 기프티콘을 드립니다.
<%
	if (total % 10 == 0) {
		out.println("<p>당첨되셨습니다!!</p>");
	}
%>
<hr/>
<h3>랜덤 구구단(<%= random %>단)</h3>
<p>이번에 나온 구구단은 <%= random %>단입니다.</p>
<%
	for (int i = 1; i < 10; i++) {
		out.println(random + " X " + i + " = " + (random * i) + "</br>");
	}
%>
</body>
</html>