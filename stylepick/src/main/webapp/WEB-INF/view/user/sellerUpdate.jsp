<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/WEB-INF/view/jspHeader.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	function submitcheck(f){
		var result = true;
		/* if(!nickchecked){
			alert("닉네임을 확인하세요.")
			result=false;
		} */
		return result;
	}

</script>
<title>사용자 정보 수정</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="sellerUpdate.shop" onsubmit="return submitcheck(this)">
	<input type="hidden" name="userid" id="userid" value="${user.userid}">
	<div class="default_center" style="height:auto; margin-top: 15px;">
	<h2>회원 정보 수정</h2>
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
		<div style="border: 2px solid black; padding-left: 15px;">
			<div class="update_tuple">
    		<div class="update_text">
    			<a>이름</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="nameinputbox" >
					<input type="text" id="name" name="name" value="${user.name}" class="input_input" readonly="readonly"
					 onfocus="document.getElementById('nameinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>회사 이름</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="com_nameinputbox" >
					<input type="text" id="com_name" name="com_name" value="${user.com_name}"
					placeholder="회사 이름" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_nameinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>사업자 등록번호</a>
    		</div>
    		
    		<div class="update_input">
    			<div class="input_box" id="com_registinputbox" >
					<input type="text" id="com_regist" name="com_regist" 
					value="${user.com_regist}"
					placeholder="사업자 등록번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_registinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_registinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>회사 전화번호</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="com_telinputbox" >
					<input type="text" id="com_tel" name="com_tel" value="${user.com_tel}"
					placeholder="사업자 등록번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_telinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_telinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple" style="height: 170px; margin-bottom: 50px;">
    		<div class="update_text">
    			<a>회사 대표 사진</a>
    		</div>
    		    		<div class="img_box" >
  				<div class="img preview-image" id="imgs">
  				<div class="upload-display"><div class="upload-thumb-wrap"><img src="file/${user.com_img}" class="upload-thumb"></div></div>
				<input type="file" id="input-file" class="upload-hidden" name="com_imgM">
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
  			</div>
				<label for="input-file" style="margin-top: 10px; margin-left: -68px;" id="imglabel">업로드</label>
  			</div>
  			</div>
  			<input class="input_submit" style="font-size:36px; width:300px; margin: 0 auto; margin-top:50px;background-color:#FE6500;" type="submit" value="수정하기">
    	</div>
</form:form>
</body>
</html>