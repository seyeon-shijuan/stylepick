<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>sns 검색</title>
<link rel="stylesheet" href="${path}/assets/css/sns.css?ver=1.1">
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<style>
	.keyword {
		color: #047acc;
    	font-weight: bold;
    	font-size : x-large;
	}
	
	.style-card {
	margin : 10px;
	border : 1px solid #c5c2c2;
	border-radius : 6px;
	background-color: #ffffff;
	width:230px;
	height:395px;
}

.style-img {
	margin-bottom : 10px;
}

.style-content {
	margin : 0 6px 8px 6px;
}

.style-info {
	margin-left : 38px;
}

.style-profile {
	float : left;
    margin-right : 8px;
}

.txt_box { 
  display: -webkit-box; 
  display: -ms-flexbox; 
  display: box; margin-top:1px;  
  max-height:26px;  
  overflow:hidden;  
  vertical-align:top;  
  text-overflow: ellipsis;  
  word-break:break-all;  
  -webkit-box-orient:vertical;  
  -webkit-line-clamp:3  
}
</style>
</head>
<body>
<div>
	<p class="search-keyword" style="margin: 0 6% 2% 6%;">
		<span class="keyword">${param.keyword}</span>&nbsp;의 검색 결과
	</p>
</div>
<hr>
<div>
	<table style="margin: 0 6% 2% 6%;" class="snslist">
	</table>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	var listAmount = 1;
	var status = 0;
	var keyword = '${param.keyword}';
	
	$(function(){
		snsList(listAmount,status,keyword);
	})
	
	function snsList(listAmount,status,keyword){
			var params = "listAmount=" + listAmount + "&status=" + status + "&keyword=" + keyword;
			$.ajax({
				data:params,
				type:"get",
				url:"${path}/ajax/searchSns.shop",
				success : function(data) {
					$(".snslist").append(data);
				},
				error : function(e) {
					alert("검색 결과 조회시 서버 오류:"+e.status);
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
				var params = "listAmount=" + listAmount + "&status=" + status + "&keyword=" + keyword;
				status = 1;
				$.ajax({
					data: params,
					type: "get",
					url: "${path}/ajax/searchSns.shop",
					success : function(data) {
						console.log(data);
						$(".snslist").append(data);
						if(data != null){
							status = 0;						
						}
					},
					error : function(e) {
						alert("sns 조회시 서버 오류:"+e.status);
					}
				})
			}
	}
	});
</script>
</body>
</html>