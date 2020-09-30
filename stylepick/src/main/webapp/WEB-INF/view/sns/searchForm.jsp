<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 찾기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.1">
<script type="text/javascript">
	function searchbtn(item_no,index,category) {
			location.href="searchCommit.shop?item_no="+item_no+"&index="+index+"&category="+category;
	}
	function listpage(page) {
		document.f.pageNum.value=page;
		document.f.submit();
	}
</script>
</head>
<body style="margin:0;">
<div class="searchform">
<div class="title_area">
	스타일픽 상품찾기
</div>
<div class="search_area">
	<form name="f" action="search.shop" method="post">
		<input type="hidden" name="index" value="${param.index}">
		<input type="hidden" name="pageNum" value="1">
		<select name="category" style="width: 80px; height: 40px; float: left; margin-right: 10px;">
			<option value="1">Hat</option>
			<option value="2">Outer</option>
			<option value="3">One-piece</option>
			<option value="4">Top</option>
			<option value="5">Bottom</option>
			<option value="6">Bag</option>
			<option value="7">Shoes</option>
			<option value="8">Watch</option>
		</select>
		<input type="text" name="keyword" autocomplete="off" style="height: 34px;width: 300px;float: left;margin-right: 10px;">
		<input type="submit" value="검색" style="height: 40px;float: left;">
	</form>
</div>
<div class="table_area">
	<table>
		<c:forEach var="i" items="${itemlist}">
			<tr>
				<td rowspan="3" style="width: 80px;padding-right: 10px;"><img src="../item/img/${i.pictureUrl}" width="80px" height="80px"></td>
				<td style="font-weight:bold;width: 60%;padding-top: 10px;font-size: 17px;">${i.getSubject()}</td>
			</tr>
			<tr>
				<td>${i.getItem_name()}</td>
				<td><button class="selectbtn2" style="padding: 0 10px;" onclick="javascript:searchbtn(${i.getItem_no()},${index},${i.getCategory()})">선택</button>
				</td>
			</tr>
			<tr>
				<td style="padding-bottom: 20px;font-size: 14px;">${i.getName()}</td>
			</tr>
		</c:forEach>
	</table>	
</div>
<div class="page_area">
	<c:if test="${pageNum <= 1}"><span>이전</span></c:if>
	<c:if test="${pageNum > 1}">
		<span><a href="javascript:listdo(${pageNum-1})">이전</a></span>
	</c:if>
	<c:forEach var="a" begin="${startpage}" end="${endpage}">
		<c:if test="${a == b.pageNum}"><span class="active">${a}</span></c:if>
		<c:if test="${a != b.pageNum}"><span><a href="javascript:listdo(${a})">${a}</a></span></c:if>
	</c:forEach>
	<c:if test="${pageNum >= maxpage}"><span>다음</span></c:if>
	<c:if test="${pageNum < maxpage}"><span><a href="javascript:listdo(${pageNum+1})">다음</a></span></c:if>
</div>
</div>
</body>
</html>