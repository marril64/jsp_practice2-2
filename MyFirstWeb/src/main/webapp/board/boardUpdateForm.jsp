<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/MyFirstWeb/boardUpdate.do" method="post">
		글쓴이 : <input type="text" name="writer" value="${board.writer}" readonly>
		글제목 : <input type="text" name="title" value="${board.title}"><br/>
		본문 : <textarea cols="50" rows="15" name="content">${board.content}</textarea><br/>
		<input type="hidden" name="num" value="${board.boardNum}">
		<input type="submit" value="작성"><input type="reset" value="초기화">
	</form>
</body>
</html>