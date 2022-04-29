<%@page import="java.util.*"%>
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
	List<Integer> number = new ArrayList<>();
	
	for (int i = 0; i < 6; i++) {
		int random = (int)(Math.random() * 45) + 1;
		
		if (number.indexOf(random) == -1) {
			number.add(random);
		} else {
			i--;
		}
		
		Collections.sort(number);
	}
%>
<h1>로또번호 생성 결과</h1>
이번주 로또는 이 번호다!<br/>
<%= number %>
</body>
</html>