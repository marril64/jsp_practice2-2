<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 반복해서 출력하려면 JSTL을 활용하는것이 일반적임 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 포워딩으로 먼저 넘어온 다음 리다이렉트를 이어서 실행하도록 해야
포워딩/리다이렉트 호출이 겹쳐서 에러가 나는걸 막을 수 있으므로
이 경우만 예외적으로 스크립트릿을 이용한 리다이렉트를 사용합니다. -->
<!-- 세션값 : ${sessionScope.s_id}<br/> -->
<c:if test="${sessionScope.s_id eq null}">
	<!-- <script>location.href="http://localhost:8181/MyFirstWeb/"</script> -->
	<% // response.sendRedirect("http://localhost:8181/MyFirstWeb/"); //이렇게 하는게 더 낫다. %>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 >게시판이랍니당</h1>
		<hr/>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>생성시간</th>
					<th>수정시간</th>
					<th>조회수</th>
				</tr>
			</thead>
			<!-- JSTL c:forEach와 ${boardList}를 활용하면 됩니다.
			전체 글 정보를 테이블 형식으로 보여주세요. getAllBoardList.jsp 참고해주세요. -->
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNum}</td>
						<td><a href="http://localhost:8181/MyFirstWeb/boardDetail.do?board_num=${board.boardNum}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.bDate}</td>
						<td>${board.mDate}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- ${buttons}<br/> -->
		<!-- 이번 10개 페이지 조회버튼을 출력합니다.
		현재 조회중인 페이지가 1~10페이지가 아닐때만, 첫페이지 -1 을 목표주소로 해서 prev버튼을 만들면 됩니다. -->
		<!-- <c:if test="${buttons.startPage ne 1}">
			<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.startPage - 1}">[prev]</a>
		</c:if> -->
		
		<!-- foreach문의 begin, end속성을 이용해 숫자를 알맞게 깔아주세요. -->
		<!-- <c:forEach var="pageNum" begin="${buttons.startPage}" end="${buttons.endPage}">
			<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageNum}">[${pageNum}]</a>
		</c:forEach> -->
		
		<!-- 이후 페이지 조회버튼을 출력합니다.
		현재 조회중인 페이지그룹과 전체 글의 마지막 페이지의 관계에 대해서 생각해보시면 됩니다. -->
		<!-- <c:if test="${buttons.endPage ne buttons.totalPages}">
			<a href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.endPage + 1}">[next]</a>
		</c:if> -->
		<!-- <br/>
		
		<c:if test="${sessionScope.s_id ne null}">
			<a href="http://localhost:8181/MyFirstWeb/boardInsertForm.do"><button>새로 글 작성하기</button></a>
		</c:if> -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${buttons.startPage ne 1}">
		    	<li class="page-item">
			      <a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.startPage - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
		    	</li>
		    </c:if>
		    <c:forEach var="pageNum" begin="${buttons.startPage}" end="${buttons.endPage}">
		    	<li class="page-item ${buttons.currentPage eq pageNum ? 'active' : ''}"><a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${pageNum}">${pageNum}</a></li>
		    </c:forEach>
		    <c:if test="${buttons.endPage ne buttons.totalPages}">
		    	<li class="page-item">
			      <a class="page-link" href="http://localhost:8181/MyFirstWeb/boardList.do?pageNum=${buttons.endPage + 1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
		    	</li>
		    </c:if>
		  </ul>
		</nav>
		</hr>
		<c:if test="${sessionScope.s_id ne null}">
			<a href="http://localhost:8181/MyFirstWeb/boardInsertForm.do"><button class="btn btn-primary">새로 글 작성하기</button></a>
		</c:if>
	</div><!-- div.contailner -->
</body>
</html>