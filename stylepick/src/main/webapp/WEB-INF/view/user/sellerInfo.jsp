<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세정보</title>
<link rel="stylesheet" href="../assets/css/user.css">
<style type="text/css">
table{
	width:500px;
	border-collapse:collapse;
	margin-top: 20px;
}
th,td{
	padding: 8px;
}
th{
	width: 30%;
	color: gray;
}

</style>
</head>
<body style="margin:0;">
<div class="title_area">
	유저 상세정보
</div>
<table>
	<tr>
		<th >상품명</th>
		<td>${item.item_name}</td>
	</tr>
	<tr>
		<th>갯수</th>
		<td>${saleItem.quantity}</td>
	</tr>
	<tr>
		<th>옵션</th>
		<td>${saleItem.item_option}</td>
	</tr>
	<tr>
		<th>사이즈</th>
		<td>${saleItem.size}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${sale.name}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${sale.address}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${sale.tel}</td>
	</tr>
	<tr>
		<th>주문시간</th>
		<td>${sale.orderdate}</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>${sale.memo}</td>

</table>

</body>
</html>