<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<div class="center" style="max-width: 900px;">
	<ul class="userul">
		<li class="userli" style="width: auto;"><a class="a_blockbutton"
		href="orderList.shop?id=${user.userid}">구매자</a></li>
		<li class="userli" style="width: auto;"><a class="a_blockbutton blockbutton_selected2"
		href="sellList.shop?id=${user.userid}">판매자</a></li>
	</ul>
	<hr style="margin-top: 0px;">
	<div class="user-info" >
	<div class="user-info dummycolor" style="background-color: #FE6500"></div>
	<div style="display: inline; float: left;height: 180px;width: 180px; margin: 0px;text-align: center; padding-top: 26px;margin-top: -113px;">
	<c:if test="${!empty user.com_img}">
		<img src="../user/file/${user.com_img}" width="125px" height="125px" style=" border-radius:70%;">
	</c:if>
	<c:if test="${empty user.com_img}">
		<img src="../assets/img/user.svg" width="125px" height="125px">
	</c:if>
	</div>
	<div style="display: inline; float: left; width: 75%;margin-top:-64px;">
		<div class="user-profile">
			${user.com_name}
		</div>
		<div class="user-action">
			<table>
				<tr>
					<td>판매수익</td>
					<td>판매 중</td>
					<td>판매 완료</td>
				</tr>
				<tr>
					<td>${balance}원</td>
					<td>${sellcount}건</td>
					<td>${sold}건</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<div class="order_downview">
		<div class="order_leftdiv">
		<ul>
			<li><a class="a_leftdivbtn" href="sellList.shop?id=${user.userid}">요약보기</a></li>
			<li><a class="a_leftdivbtn" href="sellList_item.shop?id=${user.userid}">등록상품</a></li>
			<li><a class="a_leftdivbtn" href="sellList_list.shop?id=${user.userid}">판매내역</a></li>
			<li><a class="a_leftdivbtn leftdivbtn_selected2">문의관리</a></li>
		</ul>
		</div>
		<div class="order_main">
			<h1>내용</h1>
		</div>
	</div>
</div>
</body>
</html>