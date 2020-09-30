<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회</title>
<link rel="stylesheet" href="../assets/css/user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function sellerInfo(order_no,seq) {
		var op = "width=500,height=500,left=50,top=150";
		open("sellerInfo.shop?order_no="+order_no+"&seq="+seq,"",op);
	}
	function enter(f){
		f.style.backgroundColor='#f5f6f7';
	}
	function leave(f){
		f.style.backgroundColor='white';
	}
	function updatestat(order_no,seq,stat){
		var question='';
		if(stat==0)
			question='배송중으로 바꾸시겠습니까?';
		if(stat==1)
			question='배송완료로 바꾸시겠습니까?';
		if(stat==2){
			return;
		}
		var answer = confirm(question);
		if(answer){
			$.ajax({
				url : "updatestat.shop",
				data : {order_no:order_no,seq:seq,stat:++stat},
				success : function(result){
					if(result ==1){
						alert('업데이트 되었습니다!');
						location.reload();
					}else{
						alert('업데이트에 실패했습니다.');
						location.reload();
					}
				}
			})
		}
	}
</script>
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
			<li><a class="a_leftdivbtn leftdivbtn_selected2" href="sellList_list.shop?id=${user.userid}">판매내역</a></li>
			<li><a class="a_leftdivbtn">문의관리</a></li>
		</ul>
		</div>
		<div class="order_main">
			<div class="order_main_block">
				<div style="width: 100%;text-align: left;">
				<a class="order_header">판매내역</a>
				</div>
				<table class="order_table">
					<tr class="order">
					<th class="order" style="width: 10%">거래번호</th>
					<th class="order" style="width: 30%">품목</th>
					<th class="order" style="width: 20%">구매자</th>
					<th class="order" style="Width: 10%">갯수</th>
					<th class="order" style="width: 20%">가격</th>
					<th class="order" style="width: 10%">상태</th>
					</tr>
					<c:forEach items="${list}" var="item" varStatus="stat">
						<tr class="order">
							<td class="order">${item.order_no}</td>
							<td class="order"onmouseenter="enter(this)" onmouseleave="leave(this)" style="cursor: pointer;"
								onclick="location.href='../item/detail.shop?item_no=${item.item_no}'">${item.item.item_name}</td>
							<td class="order"onmouseenter="enter(this)" onmouseleave="leave(this)" style="cursor: pointer;"
								onclick="javascript:sellerInfo('${item.order_no}','${item.seq}')">${item.userid}</td>
							<td class="order">${item.quantity}개</td>
							<td class="order">${item.quantity*item.item.price}원</td>
							<td class="order"onmouseenter="enter(this)" onmouseleave="leave(this)" style="cursor: pointer;"
							onclick="javascript:updatestat('${item.order_no}','${item.seq}','${item.stat}')">
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