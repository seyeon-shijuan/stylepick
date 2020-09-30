<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../assets/css/user.css">
<script type="text/javascript">
	function enter(f){
		f.style.backgroundColor='#f5f6f7';
	}
	function leave(f){
		f.style.backgroundColor='white';
	}
</script>
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
					<td style="color: red;">최근 본 상품</td>
				</tr>
				<tr>
					<td>${shipping}건</td>
					<td>${notmentioned}건</td>
					<td style="color: red;">11</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	
	<div class="order_downview">
		<div class="order_leftdiv">
			<ul>
				<li><a class="a_leftdivbtn" href="orderList.shop?id=${user.userid}">요약보기</a></li>
				<li><a class="a_leftdivbtn leftdivbtn_selected" href="orderList_order.shop?id=${user.userid}">주문내역</a></li>
				<li><a class="a_leftdivbtn" href="orderList_review.shop?id=${user.userid}">내 한줄평</a></li>
			</ul>
		</div>
		<div class="order_main">
			<div class="order_main_block" style="padding-top: 20px;">
				<div style="width: 100%;text-align: left;">
				<a class="order_header">주문내역</a>
				</div>
				<!-- 주문별 반복 -->
				<c:forEach items="${buylist}" var="buy" varStatus="stat">
				<div class="order_buy">
					<div>
						<a class="order_18px">주문일 <fmt:formatDate value="${buy.orderdate}" pattern="yyyy/MM/dd" /></a>
					</div>
					<!-- 상품별 반복 -->
					<c:forEach items="${buy.itemList}" var="buylist">
					<div class="order_buyitem" onmouseenter="enter(this)" onmouseleave="leave(this)">
						<div class="order_buyitem_left" style="cursor: pointer;" onclick="location.href='../item/detail.shop?item_no=${butlist.item.item_no}'">
							<img src="../item/img/${buylist.item.pictureUrl}" style="width: 150px;height: 150px;" id="img">
						</div>
						<div class="order_buyitem_center" style="cursor: pointer;" onclick="location.href='../item/detail.shop?item_no=${buylist.item.item_no}'">
							<div class="order_buyitem_center_text" style="font-size: 25px;">${buylist.item.item_name}</div>
							<div class="order_buyitem_center_text" style="font-size: 20px;">${buylist.item.price}원 / ${buylist.quantity}개</div>
						</div>
						<div class="order_buyitem_right">
							<div class="order_buyitem_right_text">
							<c:if test="${buylist.stat==0}">배송전</c:if>
							<c:if test="${buylist.stat==1}">배송중</c:if>
							<c:if test="${buylist.stat==2}">배송완료</c:if>
							</div>
							<div class="order_buyitem_buttondiv">
								<button class="order_buyitem_button">교환신청</button>
							</div>
							<div class="order_buyitem_buttondiv">
								<button class="order_buyitem_button">반품신청</button>
							</div>
							<c:if test="${buylist.reviewed==0}">
							<div class="order_buyitem_buttondiv">
								<button onclick="window.open('../item/line.shop?item_no=${buylist.item.item_no}&order_no=${buylist.order_no}&seq=${buylist.seq}','','width=450,height=550,top=200,left=400')"
										 class="order_buyitem_button2">한줄평 쓰기</button>
							</div>
							</c:if>
						</div>
					</div>
					</c:forEach>
				
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
</html>