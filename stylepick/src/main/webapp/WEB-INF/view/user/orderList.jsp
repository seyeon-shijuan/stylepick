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
		<li class="userli" style="width: auto;"><a class="a_blockbutton blockbutton_selected"
		href="orderList.shop?id=${user.userid}">구매자</a></li>
		<c:if test="${user.seller==1}">
			<li class="userli" style="width: auto;"><a class="a_blockbutton"
			href="sellList.shop?id=${user.userid}">판매자</a></li>
		</c:if>
	</ul>
	<hr style="margin-top: 0px;">
	<div class="user-info" >
	<div class="user-info dummycolor"></div>
	<div style="display: inline; float: left;height: 180px;width: 180px; margin: 0px;text-align: center; padding-top: 26px;margin-top: -113px;">
	<c:if test="${!empty user.imgurl}">
		<img src="../user/file/${user.imgurl}" width="125px" height="125px" style=" border-radius:70%;">
	</c:if>
	<c:if test="${empty user.imgurl}">
		<img src="../assets/img/user.svg" width="125px" height="125px">
	</c:if>
	</div>
	<div style="display: inline; float: left; width: 75%;margin-top:-64px;">
		<div class="user-profile">
			${user.nickname}
		</div>
		<div class="user-action">
			<table>
				<tr>
					<td>배송중</td>
					<td>쓰지않은 한줄평</td>
				</tr>
				<tr>
					<td>${shipping}건</td>
					<td>${notmentioned}건</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<div class="order_downview" >
		<div class="order_leftdiv">
			<ul>
				<li><a class="a_leftdivbtn leftdivbtn_selected" href="orderList.shop?id=${user.userid}">요약보기</a></li>
				<li><a class="a_leftdivbtn" href="orderList_order.shop?id=${user.userid}">주문내역</a></li>
				<li><a class="a_leftdivbtn" href="orderList_review.shop?id=${user.userid}">내 한줄평</a></li>
			</ul>
		</div>
		<div class="order_main">
			<div class="order_main_block">
				<div style="width: 50%; float: left; text-align: left;">
				<a class="order_header">주문내역</a>
				</div>
				<div style="width: 50%;float: left; text-align: right;">
				<a href="orderList_order.shop">더보기 >></a>
				</div>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 40%">품목</th>
					<th class="order" style="width: 20%">주문일자</th>
					<th class="order" style="width: 20%">가격</th>
					<th class="order" style="width: 20%">상태</th>
					</tr>
					<c:forEach items="${order}" var="item" end="4" varStatus="stat">
						<tr class="order">
							<td class="order">${item.item_name}</td>
							<td class="order"><fmt:formatDate value="${item.orderdate}" pattern="yyyy-MM-dd"/></td>
							<td class="order">${item.price}</td>
							<td class="order">
								<c:if test="${item.stat==0}">배송전</c:if>
								<c:if test="${item.stat==1}">배송중</c:if>
								<c:if test="${item.stat==2}">배송완료</c:if> 
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="order_main_block" style="padding-top: 20px;">
				<div style="width: 50%; float: left; text-align: left;">
				<a class="order_header">내 한줄평</a>
				</div>
				<div style="width: 50%;float: left; text-align: right;">
				<a href="orderList_review.shop">더보기 >></a>
				</div>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 40%">상품 제목</th>
					<th class="order" style="width: 50%">한줄평</th>
					<th class="order" style="width: 10%">평점</th>
					</tr>
					<c:forEach items="${line}" var="item" end="4" varStatus="stat">
						<tr class="order">
							<td class="order">${item.item_name}</td>
							<td class="order">${item.content}</td>
							<td class="order">${item.evaluation}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>