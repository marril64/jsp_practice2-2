<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h1>디테일</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>생성시간</th>
				<th>수정시간</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${board.boardNum}</td>
				<td>${board.title}</td>
				<td>${board.content}</td>
				<td>${board.writer}</td>
				<td>${board.bDate}</td>
				<td>${board.mDate}</td>
				<td>${board.hit}</td>
			</tr>
		</tbody>
	</table>
	${board} -->
	<h1>${board.boardNum}번 글 조회중입니다.</h1>
	제목 : <input type="text" value="${board.title}" readonly>조회수 : ${board.hit}<br/>
	본문 : <textarea cols="40" rows="10" readonly>${board.content}</textarea><br/>
	글쓴이 : <input type="text" value="${board.writer}" readonly><br/>
	쓴날짜 : ${board.bDate}
	마지막 수정날짜 : ${board.mDate}<br/>
	
	<!-- 삭제번호를 서블릿 boardDelete로 보내야함 -->
	<c:if test="${sessionScope.s_id eq board.writer}">
		<form action="/MyFirstWeb/boardDelete.do" method="post">
			<input type="hidden" name="num" value="${board.boardNum}">
			<input type="hidden" name="board_writer" value="${board.writer}"><!-- 글쓴이를 전달하도록 구성 -->
			<input type="submit" value="삭제">
			<!-- <a href="/MyFirstWeb/boardList"><button>돌아가기</button></a> 폼 안에 이렇게 작성 시 삭제 로그로 돌아가게 된다.  -->
			<!-- <a href="/MyFirstWeb/boardUpdateForm"><input type="button" value="수정하기"></a> -->
		</form>
		<form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
			<input type="hidden" name="board_num" value="${board.boardNum}">
			<input type="submit" value="수정">
		</form>
	</c:if>
	<a href="/MyFirstWeb/boardList.do"><input type="button" value="돌아가기"></a><!-- 가로로 나열하고 싶으면 css에서 display로 나열할 수 있다. -->
</body>
</html>

<!-- 진입점 : localhost:8181/MyFirstWeb/boardDetail?board_num=4
------------------------------------------------------------
getBoardDetail.java 35번째 줄에서 우변에 board_num을 문자 4로 받고 좌변 변수 num에 숫자로 치환한 4를 대입.
getBoardDetail.java 37번째 줄에서 BoardDAO 생성
    BoardDAO 17번 줄에서 35번줄까지 실행 후 getBoardDetail.java 37번째 줄로 돌아감
getBoardDetail.java 37번째 줄 좌변 변수 dao에 BoardDAO 저장
getBoardDetail.java 39번째 줄 우변에 dao.getBoardDetail에 num을 대입.
    BoardDAO 82번 줄에서 121번줄까지 실행 후 리턴한 BoardVO 형태의 자료 board를 가지고 getBoardDetail.java 39번째 줄로 돌아감
getBoardDetail.java 39번째 줄 좌변 변수 board에 BoardVO 형태의 자료 board 자료 대입.
getBoardDetail.java 41번째 줄에서 넘겨받은 자료 board 콘솔에 출력
getBoardDetail.java 43번째 줄에서 넘겨줄 자료 board를 setAttribute로 바인딩
getBoardDetail.java 45번째 줄에서 RequestDispatcher로 자료를 넘겨받을 주소 확인
getBoardDetail.java 46번째 줄에서 board/boardDetail.jsp로 포워딩
-------------------------------------------------------------
결과 : board/boardDetail.jsp에서 넘겨받은 자료 board 화면에 출력



진입점 : localhost:8181/MyFirstWeb/boardDetail?board_num=4
------------------------------------------------------------
getBoardDetail.java 19번 라인 주소 감지
getBoardDetail.java 33번 라인 실행
getBoardDetail.java 35번 라인 우변에 의해 board_num=4의 "4"를 얻어오고 좌변 변수 num에 숫자로 치환한 4를 대입.
getBoardDetail.java 37번 라인 우변 실행
    BoardDAO.java 30번 ~ 35번 라인에 의해 dao 존재유무 확인 후 getBoardDetail.java 37번 라인으로 돌아옴
getBoardDetail.java 37번 라인 좌변에 받아온 dao 대입
getBoardDetail.java 39번 라인 우변 실행(정수 4 boardNum 입력)
    BoardDAO.java 82번 라인에서 121번 라인에 의해 4번 글 전체정보 얻어와서 리턴
getBoardDetail.java 39번 라인 좌변 board에 4번 글 정보 대입
getBoardDetail.java 41번 라인에 의해 4번 글 정보 콘솔에 디버깅
getBoardDetail.java 43번 라인에 의해 바인딩("board"명칭으로 저장)
getBoardDetail.java 45번 라인에 의해 /board/boardDetail.jsp 를 목적지로 설정
getBoardDetail.java 46번 라인에 의해 목적지로 포워딩
boardDetail.jsp에 ${board} 명칭으로 4번 글 전달 및 화면에 출력
------------------------------------------------------------
결과 : 4번 글 정보가 boardDetail.jsp에 출력됨  -->