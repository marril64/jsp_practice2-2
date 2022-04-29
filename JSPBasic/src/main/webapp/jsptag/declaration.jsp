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
		// %! : 선언부
		// % : 스크립트릿
		public int i = 10;
		public String str = "안뇽하세여";
		
		int add(int n1, int n2) {
			return n1 + n2;
		}
		String hello(String s1, String s2) {
			return s1 + s2 + str;
		}
	%>
	<%
		// 선언부에 작성한 코드는 스크립트릿에서 호출해야 실행됩니다.
		int result = add(10, 5);
		out.println("10 + 5 = " + result + "<br/>");
		out.println("16 + 14 = " + add(16, 14) + "<br/>");
		out.println(result);
		out.println(hello("신동호", "님 "));
	%>
</body>
</html>