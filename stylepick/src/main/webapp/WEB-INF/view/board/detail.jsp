<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
function reg() {
	if ($('#content').val().trim() == "") {
		alert("내용을 입력하세요")
		$('#content').focus()
		return
	}
	$('#f').submit()
}
</script>
</head>
<body>
	<div style="width: 86%; margin-left: 65px;">
		<br><br>
		<div class="blog_details">
			<h2>[${type.title}] ${board.title}</h2>
			<ul class="blog-info-link mt-3 mb-4">
				<c:if test="${board.author != '비회원'}">
				<li><a href="${path}/sns/mypage.shop?userid=${board.author}"><i class="fa fa-user"></i> ${board.author}</a></li>
				</c:if>
				<c:if test="${board.author == '비회원'}">
				<li><a href="#"><i class="fa fa-user"></i> ${board.author}</a></li>
				</c:if>
				<li> ${board.regtime}</li>
			</ul>
			<p class="excert">${board.content}</p>
			<c:if test="${!empty board.file1}"><br><br>첨부파일 : <a>${board.file1}</a></c:if>
			<br><br>
			<a href="${path}/board/${type.uri}" class="genric-btn info radius">목록</a>
		<c:if test="${sessionScope.loginUser.userid == 'admin'}">
		<c:if test="${board.seq != 2}">
			<a href="${path}/board/update.shop?no=${param.no}" class="genric-btn info radius">수정</a>
		</c:if>
		<c:if test="${board.seq == 2 && board.mail == 1}">
			<a href="${path}/board/mail.shop?e=${board.email}&no=${param.no}" class="genric-btn info radius">답변</a>
		</c:if>
			<a href="${path}/board/delete.shop?no=${param.no}" class="genric-btn info radius">삭제</a>
		</c:if>
		</div>
		
		<div class="blog_details">
			<h2>댓글</h2>
			<br>
			<c:forEach items="${reply}" var="r">
			${r.content}
			<ul class="blog-info-link mb-4">
				<li><a href="${path}/sns/mypage.shop?userid=${r.author}"><i class="fa fa-user"></i> ${r.author}</a></li>
				<li> ${r.regtime}</li>
			</ul>
			</c:forEach>
			<c:if test="${empty reply}">
			아직 등록된 댓글이 없습니다.
			</c:if>
			<form:form modelAttribute="reply" action="regreply.shop?bno=${board.no}" enctype="multipart/form-data" name="f" id="f">
				<input type="hidden" name="author" value="${board.author}">
				<input type="hidden" name="seq" value="${board.seq}">
				<div class="mt-10">
					<input type="text" name="content" id="content" placeholder="댓글 입력" onfocus="this.placeholder = ''"
						onblur="this.placeholder = '댓글 입력'" required class="single-input" style="width: 90%; display: inline">&nbsp;&nbsp;
					<a href="#" onclick="reg()" class="genric-btn danger radius">등록</a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>