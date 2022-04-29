<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/JSPBasic/jspobject/quiz/music_result.jsp">
		<table border="1">
			<thead>
				<tr>
					<th>아티스트</th>
					<th>제목</th>
					<th>선택하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>레드제플린</td>
					<td>stairway to heaven</td>
					<td><input type="radio" name="song" value="heaven"></td>
				</tr>
				<tr>
					<td>딥퍼플</td>
					<td>burn</td>
					<td><input type="radio" name="song" value="burn"></td>
				</tr>
				<tr>
					<td>너바나</td>
					<td>breed</td>
					<td><input type="radio" name="song" value="breed"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="들으러 가기"/>
	</form>
</body>
</html>