<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<script type="text/javascript">
function refresh(){
	window.location.href="store.shop";
	self.close();
}
</script>
</head>
<body onunload="refresh()">
<div>
<h1>QnA 삭제</h1>
<form action="delete.shop" method="post" name="deleteform">
<input type="hidden" name="iten_no" value="${param.item_no }">
	<a href="javascript:deleteform.submit()">[예]</a>
<a href="#" onclick="javascript:window.close()">[아니오]</a>
</form>
</div>
</body>
</html>