<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/list.jsp  --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>Users list</title>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function allchkbox(allchk){
		//$(".idchks").prop("checked",allchk.checked) //는 okle
		// 클래스 속성이 idchks의 프로퍼티(속성)을 checked라는 속성을 allchk.checked한다.
		
		//getElementbyName : name=idchks인거를 가져다가 chks에 담는다.
		var chks = document.getElementsByName("idchks");
		for(var i=0; i< chks.length; i++){
			chks[i].checked = allchk.checked;
		}//for
	}
	function graph_open(url) {
		var op = "width=800,height=800,scrollbars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
<script type="text/javascript">
	function listpage(page){
		document.searchform.pageNum.value=page;
		document.searchform.submit();
	}
</script>
</head>
<body>
	<div class="left-div" style="white-space:nowrap; width:10%; border-right:1px solid gray; float:left; text-align: center;">
			<ul>
				<li  id="admin_menu"><a href="../admin/dashboard.shop">대시보드</a></li><br>
				<li  id="admin_menu"><a href="../admin/widgets.shop">위젯</a></li><br>
				<li  id="admin_menu"><a href="../admin/charts.shop">차트</a></li><br>
				<li  id="admin_menu"><a href="../admin/list.shop">유저</a></li><br>
				<li  id="admin_menu"><a href="../admin/storelist.shop">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../admin/salesmgr.shop" style="color:skyblue;">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left;">
		<!-- <form action="mailForm.shop" method="post"> -->
			<h3>Sales</h3><br>
			<a href="../admin/salesanalysis.shop" style="text-align: right; margin-left: 85%; margin-bottom:30px; background: skyblue; color:white;">sales analysis</a><br><br><br>
			<h5 style="text-align: center;">' PURCHASE ORDERS '</h5>
			<br>
			<p style="text-align: center; margin-bottom: 30px;"><img src="https://cdn.crowdpic.net/list-thumb/thumb_l_775E9063849AE734A72BCFF462FF9239.png" style="width:20px; height:auto;"></p>
			
			
			<!-- <table class="user_list_table"> -->
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td colspan="5" style="margin: 20px; padding: 20px;">
						<!-- 검색바 -->
						<form action="salesmgr.shop" method="post" name="searchform">
							<select name="searchtype" style="width:100px;">
											<option value="">검색필터</option>
											<option value="order_no">오더번호</option>
											<option value="com_name">스토어</option>
							</select>
							<script type="text/javascript">
								searchform.searchtype.value="${param.searchtype}";
							</script>
							<input type="text" name="searchcontent" value="${param.searchContent}" style="width:250px; border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; background-color: #FCFCFC; height: 40px;">
							<input type="submit" value="검색" style="border: 1px solid #FCFCFC; background-color: none; color : gray; padding: 3px; background: #FCFCFC; height: 40px; width:60px; border-radius: 30%;">
						</form>
						
					</td>
				</tr>
				<tr class="user_list_table">
					<th class="user_list_th">오더번호</th><th class="user_list_th">판매일</th><th class="user_list_th">스토어</th>
					<th class="user_list_th">금액</th><th class="user_list_th">배송지</th>
					<!-- 
					<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
					 -->
				</tr>
				
				<!-- 스토어명 기준 : 2개 이상의 스토어에서 구매 시 -> 같은 오더번호가 2번 이상 나올 수 있도록 -->
				<!-- 주문 상세 내역 클릭시 사용자의 주문내역 확인 페이지로 이동 -->
				
				<c:forEach items="${list}" var="list">
					<tr class="user_list_table">
						<td class="user_list_table">${list.order_no}</td>
						<td class="user_list_table"><fmt:formatDate value="${list.orderdate}" pattern="yyyy-MM-dd"/></td>
						<td class="user_list_table">${list.com_name}</td>
						<td class="user_list_table"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></td>
						<!-- <td class="user_list_table">${list.stat}</td> -->
						<td class="user_list_table">${list.address}</td>
						<!-- <td class="user_list_table"><a href="#">[이동]</a></td> -->
					</tr>
				</c:forEach>
				<!-- 
				<tr>
					<td colspan="9" class="user_list_table">
						<input type="submit" value="메일보내기">
						<input type="button" value="게시물작성그래프보기(막대)" onclick="graph_open('graph1')">
					</td>
				</tr>
				 -->
			</table>
		<!-- </form> -->
			<div style="text-align: center; padding: 20px;">
				<c:if test="${pageNum >1}">
					<a href="javascript: listpage('${pageNum -1}')">이전</a>
				</c:if>
				<c:if test="${pageNum <= 1}">이전</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}">
						<a href="javascript: listpage('${a}')">[${a}]</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
					<a href="javascript: listpage('${pageNum +1}') ">다음</a>
				</c:if>
				<c:if test="${pageNum >= maxpage}">다음</c:if>
			</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>