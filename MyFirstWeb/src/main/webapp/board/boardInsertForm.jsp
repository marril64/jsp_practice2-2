<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form 을 만들어주세요.
	form은 글쓴이(writer), 글제목(title), 본문(content) 정보를 전송합니다.
	목적지는 /boardInsert 로 하겠습니다. -->
	<form action="http://localhost:8181/MyFirstWeb/boardInsert.do" method="post"><!-- 본문 내용이 주소에 노출될 수 있으므로 post방식으로 한다. -->
		글쓴이 : <input type="text" name="writer">
		글제목 : <input type="text" name="title"><br/>
		본문 : <textarea cols="50" rows="15" name="content"></textarea><br/>
		<input type="submit" value="작성"><input type="reset" value="초기화">
	</form>
</body>
</html>