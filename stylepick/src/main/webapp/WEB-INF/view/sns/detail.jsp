<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 상세보기</title>
<link rel="stylesheet" href="../assets/css/sns.css?ver=1.4">
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
	.form {
   	 	margin-left: auto;
    	margin-right: auto;
    	width: 900px;
    	border : 1px solid #dad7d7;
    	background-color : #ffffff;
	}
	
	h4 {
		margin : 10px 0px;
	}
</style>
<script type="text/javascript">
	function logincheck() {
		<c:if test="${sessionScope.loginUser.userid==null}">
			alert("로그인 후 이용하세요.");
			return false;
		</c:if>
		return true;
	}
	
	function deletecheck(sns_no) {
		var question = confirm("삭제하시겠습니까?");
		if(question){
			deleteSns(sns_no);
		} else {
			return false;
		}
	}
	
	function deleteSns(sns_no){
		var params = "sns_no=" + sns_no;
		console.log(params)
			$.ajax({
			data : params,
			url : "${path}/ajax/delete.shop",
			success : function(data) {
				location.href="${path}/sns/mypage.shop?userid="+'${sessionScope.loginUser.userid}';
			},
			error : function(e) {
				alert("삭제 실패:"+e.status);
			}
		})
	}	
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="fullview-inner-wrapper">
		<input type="hidden" name="type" value="${type}">
		<input type="hidden" name="loginid" value="${sessionScope.loginUser.userid}"/>
		<input type="hidden" name="sns_no" value="${sns.sns_no}"/>
	<div class="pictures-wrapper">
		<div class="pictures op-carousel">
			<img src="file/${sns.img1url}" width="600px" height="600px">
		</div>
		<div class="style-button">
			<c:if test="${sessionScope.loginUser.userid==sns.userid}">
				<c:if test="${sns.type==1}">
					<a href="supdate.shop?sns_no=${sns.sns_no}" class="button" style="padding: 10px 20px; margin: 25px 0 29px 40%; color: #ffffff;">수정</a>
				</c:if>
				<c:if test="${sns.type==2}">
					<a href="qupdate.shop?sns_no=${sns.sns_no}" class="button" style="padding: 10px 20px; margin: 25px 0 29px 40%; color: #ffffff;">수정</a>
				</c:if>
				<a href="javascript:deletecheck(${sns.sns_no})" class="button" style="margin-left: 1%;padding: 10px 20px;background-color: #ff003c;color: #ffffff;">삭제</a>
			</c:if>
		</div>
	</div>
	<div class="side-position">
		<c:if test="${sns.type==1 && !empty shopitems}">
				<div class="side style-info">
				<p style="font-weight:bold;">스타일픽에서 구매 가능한 상품</p>
					<table>
						<c:forEach var="si" items="${shopitems}">
							<tr>
								<td rowspan="2" class="categoryimg"><img src="../item/img/${si.pictureUrl}" width="82px" height="80px"></td>
								<td class="category" style="padding:10px 0 1px 10px;"><a href="../item/detail.shop?item_no=${si.item_no}">${si.subject}</a></td>
							</tr>
							<tr>
								<td style="padding:0 10px 5px 10px;">${si.name}</td>
							</tr>
						</c:forEach>		
					</table>
				</div>
		</c:if>
		<c:if test="${sns.type==1 && !empty snsitems}">
		<div class="side style-info">
			<table>
				<c:forEach var="s" items="${snsitems}">
				<tr>
					<td rowspan="2" class="categoryimg"><img src="../assets/img/${s.category}.svg" width="50px" height="50px" style="margin:5px 15px;"></td>
					<td class="category" style="padding:10px 0 1px 10px;font-weight:bold;">${s.category}</td>
				</tr>
				<tr>
					<td style="padding:0 10px 5px 10px;">${s.detail}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		</c:if>
		<div class="side style-content">
			<div class="style-profile">
			<c:if test="${empty user.imgurl}">
				<img src="../assets/img/user.svg" width="30px" height="30px" style="margin-right: 10px;">
			</c:if>
			<c:if test="${!empty user.imgurl}">
				<img src="../user/file/${user.imgurl}" width="30px" height="30px" style="border-radius:70%; margin-right: 10px;">
			</c:if>
			<a href="mypage.shop?userid=${user.userid}">${user.nickname}</a></div>
			<div class="style-description">${sns.description}</div>
			<c:if test="${sns.height!=0 && sns.weight!=0}">
			<hr>
			<div class="style-option">size&nbsp;&nbsp;|&nbsp;&nbsp;${sns.height}cmㆍ${sns.weight}kg</div>
			</c:if>
		</div>
		<div class="style-action">
			<button class="likebtn" onclick="likeSns(${sns.sns_no},'${sessionScope.loginUser.userid}')"><img src="../assets/img/heart1.PNG" width="23px" height="21px"></button>
			|&nbsp;&nbsp;${sns.likenum}
		</div>
		<div class="style-comment">
			<img src="../assets/img/test8.PNG" width="30px" height="30px" style="margin-right: 10px;">Comment (${sns.commentnum})
			<form class="comment-feed__form" name="f" action="comment.shop" method="post" onsubmit="return logincheck(this)">
				<input type="hidden" name="sns_no" value="${param.sns_no}"/>
				<input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
				<textarea name="content" placeholder="댓글을 입력하세요" style="width:300px; height:50px; margin-top:10px;margin-left:5px;"></textarea>
				<button type="submit" style="height: 50px;float: right; margin-top:10px;border:none;background:#007bff;cursor:pointer;">입력</button>
			</form>
			<table class="reply_list"> 
			</table>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(function(){
	loadComment('${param.sns_no}');
})

function likeSns(sns_no,userid){
	var params = "sns_no=" + sns_no + "&userid=" + userid;
	console.log(params)
		$.ajax({
		data : params,
		url : "${path}/ajax/like.shop",
		success : function(data) {
			console.log(data)
			if(data.startsWith("<button"))
				$(".style-action").html(data);
			else
				alert(data);
			
		},
		error : function(e) {
			alert("이미 좋아요를 누르셨습니다.:"+e.status);
		}
	})
}

function loadComment(sns_no){
	var params = "sns_no=" + sns_no;
	console.log(params)
	$.ajax({
		data : params,
		url : "${path}/ajax/commentlist.shop",
		success : function(data) {
			console.log(data)
			$(".reply_list").html(data);
		},
		error : function(e) {
			alert("댓글 조회시 서버 오류:"+e.status);
		}
	})
}

</script>
</body>
</html>