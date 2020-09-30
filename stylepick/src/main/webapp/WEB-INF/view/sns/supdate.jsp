<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OOTD 수정</title>
<style>
	.form {
   	 	margin-left: auto;
    	margin-right: auto;
    	width: 700px;
    	border : 1px solid #dad7d7;
    	padding : 25px;
    	background-color : #ffffff;
	}
	
	h4 {
		margin : 10px 0 15px 0px;
		width: fit-content;
   		border-bottom: 3px solid #c0d4fb;	
	}
	
	.style {
		margin-bottom : 30px;
		
	}
	
	.centerbutton {
		margin : 0 40%;
	}
	
	table {
		width : 100%;
		text-align:center;
	}
	
	#tab {
		border-bottom : 1px solid #f2f2f2;
	}
	
	#imglabel { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2;
		border-radius: .25em; 
	}
	
	#input-file {
		 /* 파일 필드 숨기기 */ 
		 position: absolute; 
		 width: 1px; 
		 height: 1px; 
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0; 
	}
		
	#input-file { 
		position: absolute; 
		width: 1px; height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); border: 0; 
	} 
	
	#imglabel { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
	} 
	
	/* imaged preview */
	
	.img .upload-display { 
		/* 이미지가 표시될 지역 */ 
		margin-bottom: 5px; 
	} 
	
	@media(min-width: 768px) { 
		.img .upload-display { 
			display: inline-block; margin-right: 5px; margin-bottom: 0; 
		}
	} 
	
	.img .upload-thumb-wrap {
	 	/* 추가될 이미지를 감싸는 요소 */ 
	 	display: inline-block; 
	 	width: 120px; 
	 	height: 120px;
	 	padding: 2px; 
	 	vertical-align: middle; 
	 	border: 1px solid #ddd; 
	 	border-radius: 5px; 
	 	background-color: #fff; 
	 } 
	 
	 .img .upload-display img {
	 	 /* 추가될 이미지 */ 
	 	 display: block; 
	 	 max-width: 100%; 
	 	 width: 100%; 
	 	 height: 100%; 
	 }

</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="form">
	<form:form modelAttribute="sns" action="update.shop" enctype="multipart/form-data" name="f">
		<form:hidden path="type"/>
		<form:hidden path="userid"/>
		<form:hidden path="sns_no"/>
		<div class="style imgs">
			<h4>스타일 이미지</h4>
			<div class="img preview-image" id="imgs">
				<div class="upload-display"><div class="upload-thumb-wrap"><img src="file/${sns.img1url}" class="upload-thumb"></div></div>
				<label for="input-file" id="imglabel">업로드</label> 
				<form:input type="file" id="input-file" class="upload-hidden" path="img1"/>
				<script>
					   var imgTarget = $('.preview-image .upload-hidden');

					   imgTarget.on('change', function(){
					       var parent = $(this).parent();
					       parent.children('.upload-display').remove();

					       if(window.FileReader){
					           //image 파일만
					           if (!$(this)[0].files[0].type.match(/image\//)) return;
					            
					           var reader = new FileReader();
					           reader.onload = function(e){
					               var src = e.target.result;
					               parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
					           }
					           reader.readAsDataURL($(this)[0].files[0]);
					       } else {
					           $(this)[0].select();
					           $(this)[0].blur();
					           var imgSrc = document.selection.createRange().text;
					           parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

					           var img = $(this).siblings('.upload-display').find('img');
					           img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
					       }
					   });
				</script>
			</div>
<!--		<input id="addImg" type="button" value="추가하기"/> -->
			<script>
				$(document).ready(function(){
					$('#addImg').click(function(){
						$('#imgs').append("<label for=\"input-file\" id=\"imglabel\">업로드</label><input type=\"file\" id=\"input-file\" class=\"upload-hidden\" name=\"imgs\">");
					})
				})
			</script>
		</div>
		<div class="style info">
			<h4>스타일 정보</h4>
			<table id="Table2">
				<tr id="tab">
					<td style="width:20%;">카테고리</td>
					<td style="width:60%;">상품 정보</td>
					<td></td>
				</tr>
				<c:forEach var="si" items="${snsitems}">
				<tr id="info">
					<td><select name="category">
							<option value="outer" <c:if test="${si.category=='outer'}">selected</c:if>>Outer</option>
							<option value="top" <c:if test="${si.category=='top'}">selected</c:if>>Top</option>
							<option value="bottom" <c:if test="${si.category=='bottom'}">selected</c:if>>Bottom</option>
							<option value="dress" <c:if test="${si.category=='dress'}">selected</c:if>>Dress</option>
							<option value="shoes" <c:if test="${si.category=='shoes'}">selected</c:if>>Shoes</option>
						</select></td>
					<td><input type="text" name="detail" placeholder="직접 입력" style="width: 270px;" value="${si.detail}">
						<button class="btn_3" style="padding: 3px 10px; margin-left: 7px;">상품 찾기</button></td>
					<td><button onclick="delete_row(this)" id="imglabel">삭제하기</button></td>
				</tr>
				</c:forEach>
			</table>
			<button type="button" onclick="javascript:add_row()" id="imglabel" style="margin-left:45%;">추가하기</button>
			<script>
				function add_row(){
					var text = document.getElementById("info").innerHTML
					$("#Table2").append("<tr>"+text+"</tr>");	
				}

				function delete_row(obj){
					var tr = $(obj).parent().parent();
					tr.remove();
				}
			</script>
		</div>
		<div class="style description">
			<h4>설명</h4>
			<form:textarea path="description" placeholder="내용을 입력해주세요" rows="5" cols="78"/>
		</div>
		<div class="style userinfo">
			<h4>추가정보</h4>
			키&nbsp;&nbsp;:&nbsp;&nbsp;<form:input type="text" path="height"/>&nbsp;&nbsp;kg&nbsp;&nbsp;&nbsp;&nbsp;
			몸무게&nbsp;&nbsp;:&nbsp;&nbsp;<form:input type="text" path="weight"/>&nbsp;&nbsp;cm
		</div>
		<div class="centerbutton">
			<button type="submit" class="btn">수정하기</button>
		</div>
	</form:form>
</div>
</body>
</html>