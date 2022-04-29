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
		// 스크립트릿 내부에 자바 주석 구문을 쓸 수도 있고
		
		/*
			여러줄 주석도
			가능합니다.
			우클릭 -> 소스보기 해도 안보입니다.
		*/
	%>
	<!-- HTML주석입니다. 하지만 소스보기를 한다면 노출됩니다. -->
	여기는 주석이 아니라 그냥 화면에 바로 노출됩니다.<br/>
	
	<%-- JSP주석입니다. 노출시키기 싫은 주석은 JSP 주석으로.. --%>
	여기도 주석이 아니라 그냥 화면에 바로 노출됩니다.<br/>
</body>
</html>