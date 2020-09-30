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
				<li  id="admin_menu"><a href="../admin/list.shop" style="color:skyblue;">유저</a></li><br>
				<li  id="admin_menu"><a href="../admin/storelist.shop">스토어 관리</a></li><br>
				<li  id="admin_menu"><a href="../admin/salesmgr.shop">매출 관리</a></li><br>
				<li  id="admin_menu"><a href="../board/qna.shop">고객센터</a></li>
			</ul>
	</div>
	<div class="right-div" style="width: 80%; margin-left: 3%;  padding: 1%; float:left;">
		<!-- <form action="mailForm.shop" method="post"> -->
			<h3>Users</h3><br>
		
			<h5 style="text-align: center;">' STYLEPICK USERS '</h5>
			<br>
			<p style="text-align: center; margin-bottom: 30px;"><img src="https://cdn.crowdpic.net/list-thumb/thumb_l_775E9063849AE734A72BCFF462FF9239.png" style="width:20px; height:auto;"></p>
			
			<!-- <table class="user_list_table"> -->
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td colspan="8" style="margin: 20px; padding: 20px;">
						<!-- 검색바 -->
						<form action="list.shop" method="post" name="searchform">
						<input type = "hidden" name="pageNum" value="1">
							<select name="searchtype" style="width:100px;">
											<option value="">검색 필터</option>
											<option value="userid">아이디</option>
											<option value="nickname">닉네임</option>
											<option value="email">이메일</option>
											<option value="age">나이</option>
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
					<th class="user_list_th">아이디</th><th class="user_list_th">닉네임</th><th class="user_list_th">이메일</th><th class="user_list_th">전화</th><th class="user_list_th">나이</th><th class="user_list_th">성별</th><th class="user_list_th">가입날짜</th><th class="user_list_th">수정·회원페이지</th>
					<!-- 
					<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
					 -->
				</tr>
				<c:forEach items="${list}" var="user">
					<tr class="user_list_table">
						<td class="user_list_table">${user.userid}</td>
						<td class="user_list_table">${user.nickname}</td>
						<td class="user_list_table">${user.email}</td>
						<td class="user_list_table">${user.tel}</td>
						<%-- <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td> --%>
						<td class="user_list_table">${user.age}</td>
						<td class="user_list_table">
						<c:choose>
								<c:when test="${user.gender eq '1'}">남자</c:when>
								<c:when test="${user.gender eq '2'}">여자</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td class="user_list_table"><fmt:formatDate value="${user.regdate}" pattern="yyyy-MM-dd"/></td>
						<td class="user_list_table">
							<a href="../user/update.shop?id=${user.userid}">edit</a>
							<!-- <a href="../user/delete.shop?id=${user.userid}">강제탈퇴</a>  -->
							<a href="../sns/mypage.shop?userid=${user.userid}">sns</a>
							<!-- http://localhost:8080/stylepick/sns/mypage.shop?userid=jieun -->
						</td>
						<!-- 
						<td class="user_list_table">
							<input type="checkbox" name="idchks" class="idchks" value="${user.userid}">
						</td>
						 -->
					</tr>
				</c:forEach>
			</table>
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