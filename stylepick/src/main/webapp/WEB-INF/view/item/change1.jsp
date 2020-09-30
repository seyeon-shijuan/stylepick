<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<script type="text/javascript">
function refresh(){
	opener.document.location.reload();
		self.close();
	}
</script>
</head>
<body onunload="refresh()">
<form:form modelAttribute="qna" action="change1.shop" method="post" name="f">
 <input type="hidden" name="qna_no" value="${param.qna_no}"/>
  <input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
	<h2>Q&A수정하기</h2>
	<hr>
	<h4>수정해주세요</h4>
	<div>
	<textarea name="content" cols="55" rows="12" >${qna.content}</textarea>
	</div>
<input type="submit" class="genric-btn success medium" value="작성">
</form:form>
</body>
</html>