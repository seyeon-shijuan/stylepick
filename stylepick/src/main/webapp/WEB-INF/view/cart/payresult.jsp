<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
</head>
<body>
<br><br>
<div align="center">
<h2>
<c:if test="${param.resultCode == 'Success'}">주문이 정상적으로 처리되었습니다. <br><br><a href="${path}/user/orderList.shop?id=${sessionScope.loginUser.userid}">[주문내역 확인]</a></c:if>
<c:if test="${param.resultCode != 'Success'}">결제 중 오류가 발생하였습니다. <br><br>다시 시도해주세요</c:if>
</h2>
</div>
</body>
</html>