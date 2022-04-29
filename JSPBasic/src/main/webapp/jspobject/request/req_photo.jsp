<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 아래에 폼을 만들어주세요.
	목적지는 함께 만든 req_photo_result.jsp 입니다.
	테이블을 이용해 사진, 제목, 체크박스를 만들어주세요.
	그리고 아래에 제출 버튼은 "그림 보러 가기" 로 적어주시고
	해당 버튼을 눌렀을때 req_photo_result에 어떤 그림을 선택했는지
	체크박스로 구분해주시고, 구분한 그림에 맞는 사진이 결과페이지에 나오도록
	if~else문을 구성해주세요.
	그림파일은 <img src="강사피씨 기준 파일명(01.png나 01.png)"> 을 이용해 출력가능합니다. --%>
	
	<!-- 1. 1번 그림을 선택했는지 2번 그림을 선택했는지 확인만 할 수 있도록 체크박스를 만들고 결과페이지 화면에 나오게 합니다.
		 2. if~else를 이용해서 1번을 골랐다면 1번그림을 골랐습니다. 2번을 골랐다면 2번 그림을 골랐습니다 라고 나오게 합니다.
		 3. img태그를 이용해 글 대신 그림이 나오게 처리합니다. -->
	<form action="http://localhost:8181/JSPBasic/jspobject/request/req_photo_result.jsp" method="get">
		<table class="table">
			<thead>
				<tr>
					<th>사진 설명</th>
					<th>선택</th>
				</tr>
			</thead>
			<body>
				<tr>
					<td>스택과 힙입니다.</td>
					<td><input type="radio" name="photo" value="01.png"></td>
				</tr>
				<tr>
					<td>DOM 구조입니다.</td>
					<td><input type="radio" name="photo" value="02.png"></td>
				</tr>
			</body>
		</table>
		<input type="submit" value="그림보러가기">
	</form>
</body>
</html>