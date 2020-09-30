<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A답변</title>
<script type="text/javascript">
function refresh(){
opener.document.location.reload(); 
	self.close();
}
</script>
</head>
<body onunload="refresh()">

<form:form  action="replyadd.shop" method="post" name="f">
	<input type="hidden" name="item_no" value="${qna.item_no}">
	<input type="hidden" name="grp" value="${qna.grp }">
	<input type="hidden" name="grplevel" value="${qna.grplevel }">
	<input type="hidden" name="grpstep" value="${qna.grpstep }">
	<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
	
	<input type="hidden" name="type" value="1">
	<table>
		<caption>Spring 게시판 답글 등록</caption>
		<tr>
			<td><textarea name="content" rows="15" cols="80"></textarea></td></tr>
			<tr><td><a href="javascript:document.f.submit()">[답변글등록]</a></td></tr>
	</table>
</form:form>
</body>
</html>