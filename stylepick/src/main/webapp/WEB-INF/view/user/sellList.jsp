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
			<li><a class="a_leftdivbtn leftdivbtn_selected2" href="sellList.shop?id=${user.userid}">요약보기</a></li>
			<li><a class="a_leftdivbtn" href="sellList_item.shop?id=${user.userid}">등록상품</a></li>
			<li><a class="a_leftdivbtn" href="sellList_list.shop?id=${user.userid}">판매내역</a></li>
			<li><a class="a_leftdivbtn">문의관리</a></li>
		</ul>
		</div>
		<div class="order_main">
			<div class="order_main_block">
				<div style="width: 50%; float: left; text-align: left;">
				<a class="order_header">등록상품</a>
				</div>
				<div style="width: 50%;float: left; text-align: right;">
				<a href="sellList_item.shop">더보기 >></a>
				</div>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 40%">품목</th>
					<th class="order" style="width: 20%">가격</th>
					<th class="order" style="width: 20%">조회수</th>
					<th class="order" style="width: 20%">미답변문의</th>
					</tr>
					<c:forEach items="${sell}" var="item" end="4" varStatus="stat">
						<tr class="order">
							<td class="order">${item.item_name}</td>
							<td class="order">${item.price}</td>
							<td class="order">${item.readcnt}</td>
							<td class="order"><%-- ${item.qna} --%>문의갯수</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="order_main_block" style="padding-top: 20px;">
				<div style="width: 50%; float: left; text-align: left;">
				<a class="order_header">판매내역</a>
				</div>
				<div style="width: 50%;float: left; text-align: right;">
				<a href="sellList_list.shop">더보기 >></a>
				</div>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 20%">거래번호</th>
					<th class="order" style="width: 40%">품목</th>
					<th class="order" style="width: 20%">구매자</th>
					<th class="order" style="width: 20%">상태</th>
					</tr>
					<c:forEach items="${list}" var="item" end="4" varStatus="stat">
						<tr class="order">
							<td class="order">${item.order_no}</td>
							<td class="order">${item.item.item_name}</td>
							<td class="order">${item.userid}</td>
							<td class="order">
								<c:if test="${item.stat==0}">배송전</c:if>
								<c:if test="${item.stat==1}">배송중</c:if>
								<c:if test="${item.stat==2}">배송완료</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>