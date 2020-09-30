<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/header/main.jsp" %>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="${path}/assets/css/list.css?ver=1">
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
</head>
<body>
<div class="item-list">
	<div class="categoryName">
		<c:choose>
			<c:when test="${param.category==1}">모자</c:when>
			<c:when test="${param.category==2}">아우터</c:when>
			<c:when test="${param.category==3}">원피스</c:when>
			<c:when test="${param.category==4}">상의</c:when>
			<c:when test="${param.category==5}">하의</c:when>
			<c:when test="${param.category==6}">가방</c:when>
			<c:when test="${param.category==7}">신발</c:when>
			<c:when test="${param.category==8}">시계</c:when>
		</c:choose>
	</div>
	<div class="itemContainer">
	</div>
<c:if test="${!empty sessionScope.loginUser.com_name}">
<a href="create.shop" class="btn">상품 등록</a>
</c:if>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	var listAmount = 1;
	var status = 0;
	<c:if test="${!empty param.category}">
		var category = ${param.category};
	</c:if>
	<c:if test="${empty param.category}">
		var category = "";
	</c:if>
	
	$(function(){
			snsList(category,listAmount,status);
	})
	
	function snsList(category,listAmount,status){
			var params = "category=" + category + "&listAmount=" + listAmount + "&status=" + status;
			console.log(params);
			$.ajax({
				data:params,
				type:"get",
				url:"${path}/ajax/list.shop",
				success : function(data) {
					console.log("넘어오는 데이터 : "+data)
					$(".itemContainer").append(data);
				},
				error : function(e) {
					alert("상품 조회시 서버 오류:"+e.status);
				}
			})
	}
	
	$(window).scroll(function() {
		// 스크롤이 80% 이상이 되면 해당 컨텐츠가 자동 생성
		console.log(((window.scrollY + window.innerHeight) / $('body').prop("scrollHeight") * 100));
		if(((window.scrollY + window.innerHeight) / $('body').prop("scrollHeight") * 100) > 90) 
		  {
			if(status == 0){
				listAmount++;
				<c:if test="${!empty param.category}">
					var params = "category=" + category + "&listAmount=" + listAmount + "&status=" + status;
				</c:if>
				<c:if test="${empty param.category}">
					var params = "listAmount=" + listAmount + "&status=" + status;
				</c:if>
			 	console.log("work"+params);
				status = 1;
				$.ajax({
					data: params,
					type: "get",
					url: "${path}/ajax/list.shop",
					success : function(data) {
						console.log(data);
						$(".itemContainer").append(data);
						if(data != null){
							status = 0;						
						}
					},
					error : function(e) {
						alert("상품 조회시 서버 오류:"+e.status);
					}
				})
			}
		}
	});
</script>
</body>
</html>