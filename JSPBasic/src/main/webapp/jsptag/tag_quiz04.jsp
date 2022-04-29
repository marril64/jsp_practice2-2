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
<%!
	List<String> party = new ArrayList<>();
	String[] jobs = {"전사", "도적", "사냥꾼", "마법사", "사제"};
%>
<%
	String random = jobs[(int)(Math.random() * jobs.length)];
	party.add(random);
	
	if (party.size() == 11) {
		party.clear();
		party.add(random);
	}
%>
<h3>당신의 역할</h3>
<p>
	당신에게 부여된 역할은 <b>[<%= random %>]</b>입니다.<br/>
	현재 파티에 당신과 같은 역할을 가진 플레이어는 <%= Collections.frequency(party, random) - 1 %>명입니다.
</p>
<p>
	현재 파티 구성<br/>
	<%= party %>(<%= party.size() %>명 참가중)
</p>
</body>
</html>