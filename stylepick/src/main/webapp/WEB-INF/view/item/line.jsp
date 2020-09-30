<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평</title>
<style>
	.con{
position:absolute;
top:35%;
left:27%;
transform:translate(-50%,-50%) rotateY(180deg);
display:flex;
	}
.con input{
display:none;
}	

.con label{
display:block;
cursor : pointer;
width:50px;
background:ccc;
}

.con label:before{
content:'\f005';
font-family:fontAwesome;
position:relative;
display:block;
font-size:50px;
color:#101010;
}
	
	.con label:after{
content:'\f005';
font-family:fontAwesome;
position:absolute;
display:block;
font-size:50px;
color:#1f9cff;
top:0;
opacity:0;
transition: .5s;
text-shadow: 0 2px 5px rgba(0,0,0,.5);
}

.con label:hover:after,
.con label:hover ~ label:after,
.con input:checked ~ label:after
{
opacity: 1;
}

#con{
position:absolute;
top:45%;
left:0%;
}
#con1{
position:absolute;
top:90%;
left:0%;
}



</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script> 
<script type="text/javascript">
function refresh(){
opener.document.location.reload();
	self.close();
}

$(function(){
	$('.review').on('keyup', function() {
		if($(this).val().length > 50) {
	alert("글자수는 50자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 50));
		}

	});
});
</script>
<script type="text/javascript">
function inputcheck(){
	f=document.f;
	if(f.evaluation.value==""){
		alert("별점을 등록해주세요");
		f.evaluation.focus();
		return;
	}
	if(f.content.value==""){
		alert("간단한 리뷰를 써주세요!");
		f.content.focus();
		return;
	}
	
	f.submit()
	
}
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
</head>
<body onunload="refresh()">
<div style="width:auto;">
   <h1>한줄평</h1>
<form:form action="write.shop"  name="f">
 <input type="hidden" name="item_no"  value="${param.item_no}">
 <input type="hidden" name="userid" value="${sessionScope.loginUser.userid}">
 <input type="hidden" name="order_no" value="${param.order_no}">
 <input type="hidden" name="seq" value="${param.seq}">
	<p class="title_star">별점과 한줄평을 남겨주세요.</p>
	<div class="con">
	<input type="radio" name="evaluation" id="star5" value="5"><label for="star5"></label>
	<input type="radio" name="evaluation" id="star4" value="4"><label for="star4"></label>
	<input type="radio" name="evaluation" id="star3" value="3"><label for="star3"></label>
	<input type="radio" name="evaluation" id="star2" value="2"><label for="star2"></label>
	<input type="radio" name="evaluation" id="star1" value="1"><label for="star1"></label>
	</div>
	<div>
<textarea id="con" class="review" name="content" cols="55" rows="12"  placeholder="내용을 입력해 주세요.(최대 50자)"></textarea>
</div>

<a href="javascript:inputcheck()" id="con1" class="genric-btn success medium">한줄평 작성</a>
</form:form>
</div>
</body>
</html>