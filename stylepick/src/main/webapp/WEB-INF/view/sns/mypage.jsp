<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.3">
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.main-mapper {
	padding : 0 0 2% 0;
}

.style-card {
	margin : 10px;
	border : 1px solid #c5c2c2;
	border-radius : 6px;
	background-color: #ffffff;
	width: 230px;
    height: 395px;
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

.user-profile {
	float : left;
    margin-top: 45px;
    margin-bottom: 10px;
    font-weight: bold;
    font-size: 30px;
}

</style>
</head>
<body>
<div class="user-info">
	<div style="display: inline; float: left;height: 180px;width: 180px; margin: 0px;text-align: center; padding-top: 10px;">
		<c:if test="${!empty user.imgurl}">
			<img src="../user/file/${user.imgurl}" width="125px" height="125px" style=" border-radius:70%;">
		</c:if>
		<c:if test="${empty user.imgurl}">
			<img class="profile_image" src="../assets/img/user.svg"  style="border-radius: 70%; width: 125px; height: 125px;">
		</c:if>
		</div>
		<div style="display: inline; float: left; width: 75%">
		<div class="user-profile">
			${user.nickname}
			<c:if test="${!empty loginUser}">
				<c:if test="${user.userid!=loginUser.userid}">
					<button class="followbtn" onclick="location.href='../sns/follow.shop?fuser=${user.userid}'"></button>
				</c:if>
			</c:if>
			<c:if test="${user.userid==loginUser.userid}">
				<button class="btn" onclick="location.href='../user/update.shop?id=${user.userid}'" style="margin-left:15px;width:90px;padding:15px 8px;font-size:15px;">수정하기</button>
			</c:if>
		</div>
	</div>
	<div class="user-action">
		<table>
			<tr>
				<td>OOTD</td>
				<td>Following</td>
				<td>Follower</td>
			</tr>
			<tr>
				<td>${mysnsnum}</td>
				<td>${follownum}</td>
				<td>${followernum}</td>
			</tr>
		</table>
	</div>
</div>
<h5>MY STYLE</h5>
<hr>
<div class="user-cards">
	<table class="snslist">
	</table>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	var listAmount = 1;
	var status = 0;
	var userid = '${param.userid}';
	
	$(function(){
		snsList(userid,listAmount,status);
	})
	
	function snsList(userid,listAmount,status){
			var params = "userid=" + userid + "&listAmount=" + listAmount + "&status=" + status;
			$.ajax({
				data:params,
				type:"get",
				url:"${path}/ajax/mypage.shop",
				success : function(data) {
					$(".snslist").append(data);
				},
				error : function(e) {
					alert("sns 조회시 서버 오류:"+e.status);
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
				var params = "userid=" + userid + "&listAmount=" + listAmount + "&status=" + status;
			 	console.log("work"+params);
				status = 1;
				$.ajax({
					data: params,
					type: "get",
					url: "${path}/ajax/mypage.shop",
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