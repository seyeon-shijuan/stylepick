<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<br><br>
<div align="center">
<a href="${path}/board/qna.shop" class="genric-btn info radius">모두보기</a>
<a href="${path}/board/qna.shop?s=complete" class="genric-btn info radius">답변 완료된 질문 보기</a>
<a href="${path}/board/qna.shop?s=wait" class="genric-btn info radius">답변 대기중인 질문 보기</a>
<c:if test="${empty sessionScope.loginUser}">
	<a href="#" class="genric-btn info radius" data-toggle="modal" data-target="#exampleModalCenter">
		문의하기
	</a>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">문의하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
      			</div>
      			<div class="modal-body">
        			비회원도 이메일로 답변받으실 수 있습니다.
      			</div>
				<div align="center" style="margin-bottom: 30px">
					<a href="${path}/user/login.shop" class="genric-btn success radius">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${path}/board/add.shop?t=q" class="genric-btn success radius">비회원</a>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${!empty sessionScope.loginUser}">
	<a href="${path}/board/qna.shop?author=${sessionScope.loginUser.userid}" class="genric-btn info radius">내가 쓴 질문 보기</a>
	<a href="${path}/board/add.shop?t=q" class="genric-btn info radius" >
		문의하기
	</a>
</c:if>
</div>

<div class="wrap">
	<h1>Q&A</h1>
	<table id="board" class="display" style="width: 100%;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>카테고리</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
		</thead>
	</table>
</div>
<br>

</body>
</html>