<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>주문하기</title>

<style>
.ammount {
	float: right;
	right: 150px;
	text-align: right;
	margin-right: 115px;
}
th, td {
	margin: 8px;
}
</style>

<!-- 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script>
	var addr1 = ""
	var addr3 = $("#addr3").val()
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
				
				addr1 = data.zonecode + " " + fullRoadAddr + " "
				if (addr3 == "undefined" || addr3 == null) {
					addr3 = ""
				}
			    $("#address").val(addr1 + addr3)
			}
		}).open();
	}
</script>
</head>
<body>
	<c:set var="total" value="0"/>
	<section class="cart_area section">
		<div class="container">
			<h1>주문/결제</h1>
			<br>
			<h2>주문상품</h2>
			<table>
				<tbody>
					<tr>
						<th>상품명</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					<c:forEach items="${sessionScope.CART.itemSetList}" var="c">
						<tr>
							<td>${c.item.item_name}</td>
							<td>${c.quantity}</td>
							<td>${c.item.price}</td>
							<c:set var="total" value="${total + c.item.price * c.quantity}"/>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<form:form modelAttribute="sale" method="post" action="end.shop" name="f">
				<h2>배송지</h2>
				<hr width="90%" align="left">
				<table>
					<tr>
						<th>받는분</th>
						<td><input type="text" name="name" placeholder="받으실분 이름" autocomplete="off"></td>
					</tr>
					<tr class="form-group">
						<th>우편번호</th>
						<td>
							<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
							<button type="button" class="genric-btn success medium" onclick="execPostCode();">
								<i class="fa fa-search"></i> 우편번호 찾기
							</button>
						</td>
					</tr>
					<tr class="form-group">
						<th>주소</th>
						<td>
							<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
						</td>
					</tr>
					<tr class="form-group">
						<th>상세주소</th>
						<td><input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" required="required"/></td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td><input type="text" name="tel" placeholder="전화번호" autocomplete="off"></td>
					</tr>
					<tr>
						<th>배송 메모</th>
						<td><textarea cols="60" rows="5" name="memo"></textarea></td>
					</tr>
				</table>
				<input type="hidden" name="address" id="address">
				<br>
				<h2>주문자</h2>
				<hr width="90%" align="left">
				<table>
					<tr>
						<th>이름</th>
						<td>
							${sessionScope.loginUser.nickname}
							<c:if test="${empty sessionScope.loginUser}">익명</c:if>
							님 (${sessionScope.loginUser.userid})
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${sessionScope.loginUser.email}</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>${sessionScope.loginUser.tel}</td>
					</tr>
				</table>
				<br>

				<h2>최종 결제 금액</h2>
				<hr width="90%" align="left">
				<div class="ammount"></div>
				<div class="ammount">
					<div>총 상품 금액</div>
					<div>${total}원</div>
				</div>
				<br>
				<br>
				<div class="checkout_btn_inner ">
					<center>
						<button type="submit" class="btn" style="width: 400px">구매</button>
					</center>
				</div>
			</form:form>
		</div>
	</section>
<script>
	$(function() {
		$("#addr3").on("propertychange change keyup paste input", function() {
		    var current = $(this).val();
		    if(current == addr3) {
		        return;
		    }
		    addr3 = current;
		    $("#address").val(addr1 + addr3)
		});
	})
</script>
</body>
</html>