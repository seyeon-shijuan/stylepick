<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<br><br>
<div class="wrap">
	<h1>FAQ</h1>
	<table id="board" class="display" style="width: 100%;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>카테고리</th>
			</tr>
		</thead>
	</table>
</div>
<br>
<c:if test="${sessionScope.loginUser.userid == 'admin'}">
<div align="center">
<a href="${pageContext.request.contextPath}/board/add.shop?t=f" class="genric-btn info radius">추가하기</a>
</div>
</c:if>
</body>
</html>