<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 태그라이브러리 지정을 해주세요. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	// 기존 스크립트릿 내부 반복문으로 작성하기
	
	// 1~100까지 더해서 결과값을
	// 1부터 100까지 총합은 ? 입니다. 라고 브라우저에 출력되도록 하는 반복문을 작성해서 보내주세요.
	int count = 0;
			
	for (int i = 1; i <= 100; i++) {
		count += i;
		out.println(count + "<br/>");
		if (i == 100) {
			out.println("1부터 100까지 총 합은 " + count + "입니다.");
		}
	}
--%>

	<!-- begin='시작값', end='끝값(포함)', step='숫자증가량', var='변수명'
	c:forEach구문은 for문을 대체합니다. -->
	<c:forEach begin="1" end="100" step="1" var="number">
		<c:set var="total" value="${total + number}" /><!-- total = total + number; -->
	</c:forEach>
	<h1>1~100까지의 총합 : ${total}</h1>
	<hr/>
	<h1>구구단 4단 출력</h1>
	<!-- forEach문을 이용해서 구구단 4단을 출력해보세요. -->
	<c:forEach begin="1" end="9" var="num"><!-- step을 안적으면 자동으로 1씩 증가 -->
		<c:out value="4 * ${num} = ${4 * num}" /><br/>
	</c:forEach>
	<hr/>
	<h1>2~9단</h1>
	<!-- 중첩 forEach를 이용해서 2~9단까지 모두 출력해주세요. -->
	<c:forEach begin="2" end="9" var="num">
		<c:forEach begin="1" end="9" var="ber">
			<c:out value="${num} * ${ber} = ${num * ber}" /><br/>
		</c:forEach><hr/>
	</c:forEach>
	<!-- 짝수단만 출력 -->
	<h1>짝수단</h1>
	<c:forEach begin="2" end="9" step="2" var="num">
		<c:forEach begin="1" end="9" var="ber">
			<c:out value="${num} * ${ber} = ${num * ber}" /><br/>
		</c:forEach><hr/>
	</c:forEach>
	<h1>숫자가 아닌 요소를 반복하는 JSTL</h1>
	<%-- arr변수 내에 과일 5개 이름을 배열로 저장하는 구문 --%>
	<c:set var="arr" value='<%= new String[] {"사과", "딸기", "망고", "바나나", "포도"} %>' />
	<%-- 변수 arr내부 자료 ["사과", "딸기", "망고", "바나나", "포도"] 를 순차적으로 출력해보겠습니다. --%>
	<c:forEach var="i" items="${arr}">
		<c:out value="${i}" /><br/>
	</c:forEach>
	<%
		/*String[] arr = {"사과", "딸기", "망고", "바나나", "포도"};
		for (String i : arr) {
			out.println(i + "<br/>");
		}*/
	%>
	<hr/>
	<!-- int 배열에 10, 20, 30, 40, 50을 넣어주시고
	c:forEach문을 이용해 화면에 출력해주세요. 변수명은 마음대로 만들어주셔도 됩니다. -->
	<c:set var="ten" value='<%= new Integer[] {10, 20, 30, 40, 50} %>' />
	<c:forEach var="j" items="${ten}">
		<c:out value="${j}" /><br/><!-- out을 안써도 된다. -->
	</c:forEach>
	
	
	
</body>
</html>