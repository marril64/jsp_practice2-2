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
<%-- 현재 파일인 req_user_form.jsp에 폼 태그를 만들어보겠습니다.
	 목적지는 함께 req_user.jsp 파일입니다. post방식으로 데이터를 전달합니다.
	 먼저 이름, 아이디, 비밀번호를 입력해 보낼 수 있는 input태그를 만들어주세요.
	 각 태그의 name 속성은 uname, uid, upw 입니다.
	 데이터를 받아주는 req_user.jsp에서 한글이 깨지지 않도록 받아서 화면에 출력해주세요. --%>
	 
	<form action="http://localhost:8181/JSPBasic/jspobject/request/req_user.jsp" method="post">
		이름 : <input type="text" name="uname" placeholder="이름" /><br/>
		아이디 : <input type="text" name="uid" placeholder="아이디" /><br/>
		비밀번호 : <input type="password" name="upw" placeholder="비밀번호" /><br/>
		<hr/>
		
		<%-- input 태그 내부에 value 값을 이용해 선택되었을때 전달될 데이터를 정할 수 있습니다. --%>
		취미 : <input type="checkbox" name="hobby" value="드럼">드럼 &nbsp;
		      <input type="checkbox" name="hobby" value="베이스">베이스 &nbsp;
		      <input type="checkbox" name="hobby" value="맛집순례">맛집순례 &nbsp;
		      <input type="checkbox" name="hobby" value="음악감상">음악감상 &nbsp;
		      <input type="checkbox" name="hobby" value="디아블로2">디아블로2 &nbsp;
		<hr/>
		혈액형 : 
		<input type="radio" name="blood" value="A">A형 &nbsp;
		<input type="radio" name="blood" value="B">B형 &nbsp;
		<input type="radio" name="blood" value="O">O형 &nbsp;
		<input type="radio" name="blood" value="AB">AB형 &nbsp;
		<hr/>
		지역 : 
		<select name="region">
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
			<option value="충청">충청</option>
			<option value="전라">전라</option>
			<option value="경상">경상</option>
			<option value="제주">제주</option>
		</select>
		
		
		<br/>
		
		<input type="submit" class="btn btn-primary" value="확인">
	</form>
	
</body>
</html>