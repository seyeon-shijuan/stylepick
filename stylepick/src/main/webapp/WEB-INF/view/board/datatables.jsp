<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datatables</title>
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/responsive.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${path}/assets/board/css/main.css">

<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script src="${path}/assets/board/js/jquery.dataTables.js"></script>
<script src="${path}/assets/board/js/dataTables.responsive.min.js"></script>
<script src="${path}/assets/board/js/dataTables.buttons.min.js"></script>
<script src="${path}/assets/board/js/buttons.html5.min.js"></script>
</head>
<body>
	<div class="wrap">
		<h1>게시판</h1>
		<table id="board" class="display" style="width: 100%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<script>
	$(function() {
		var table = $('#board').DataTable({
			data : [
				<c:forEach begin="1" end="10000" var="t">{"no" : ${t}, "title" : "공지 ${t}", "author" : "관리자", "regtime" : "2020-08-12"},</c:forEach>
			],
			responsive : true,
			orderMulti : true,
			order : [ [ 0, 'desc' ] ],
			columns : [
				{"data" : "no"}, 
				{"data" : "title"}, 
				{"data" : "author"},
				{"data" : "regtime"} 
			],
			rowId: function(r) {
			    return r.no;
			},
			"language" : {
				"emptyTable" : "데이터가 없습니다.",
				"lengthMenu" : "_MENU_ 개씩 보기",
				"info" : "",
				"infoEmpty" : "",
				"infoFiltered" : "",
				"search" : "검색 : ",
				"zeroRecords" : "일치하는 데이터가 없습니다.",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			}
		});
		
		$('#board').on('click', 'tr', function() {
		    var id = table.row( this ).id();
		    location.href='../board/detail.shop?id=' + id
		});
	});
	
	</script>
</body>
</html>