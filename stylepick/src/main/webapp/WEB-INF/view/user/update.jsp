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
	var nickchecked=false;
	function alreadyNicknamechk(){
		document.getElementById('nicknameinputbox').style.border='1px solid #dadada'
		var nickname =  $("#nickname").val();
		$.ajax({
			url : "confirmnickname.shop",
			data : {nickname:nickname},
			success : function(result){
				if(result=='true'){
					$("#alreadyNickname").show();
					nickchecked=false;
				}
				else{
					$("#alreadyNickname").hide();
					nickchecked=true;
				}
			}
		})		
	}
	function submitcheck(f){
		var result = true;
		if($("#age").val()=""){
			f.age.value = "0"
			
			console.log($("#age").val())
		}
		if(!nickchecked){
			alert("닉네임을 확인하세요.")
			result=false;
		}
		return result;
	}

</script>
<title>사용자 정보 수정</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="update.shop" onsubmit="return submitcheck(this)">
	<input type="hidden" name="password" id="password" value="123123">
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
    			<a>아이디</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="idinputbox" >
					<input type="text" id="userid" name="userid" value="${user.userid}" class="input_input" readonly="readonly"
					 onfocus="document.getElementById('idinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('idinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>이메일</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="emailinputbox" >
					<input type="text" id="email" name="email" value="${user.email}" class="input_input" readonly="readonly" 
					 onfocus="document.getElementById('emailinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('emailinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>닉네임</a><a style="color: red;">*</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="nicknameinputbox" >
					<input type="text" id="nickname" name="nickname" value="${user.nickname}"
					placeholder="닉네임" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nicknameinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:alreadyNicknamechk()"> <%--자기닉넴으로 안됨 --%>
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="alreadyNickname" style="display: none;"><font class="userfont" id="alreadyNicknameval">이미 존재하는 이메일입니다.</font></div>
    		<font class="userfont"><form:errors path="nickname"/></font></div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>나이</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="ageinputbox" >
					<input type="text" id="age" name="age" value='${user.age}'
					placeholder="나이" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('ageinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('ageinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>성별</a>
    		</div>
    		
    		<div class="update_input"> <%--입력값대로 바꾸기 --%>
    			<div class="input_box" style="border: 0px;" >
					<input type="radio" name="gender" <c:if test="${user.gender==1}">checked</c:if> value="1">남
					<input type="radio" name="gender" <c:if test="${user.gender==2}">checked</c:if> value="2">여
					<input type="radio" name="gender" <c:if test="${user.gender==0}">checked</c:if> value="0">비공개
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>전화</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="telinputbox" >
					<input type="text" id="tel" name="tel" value="${user.tel}"
					placeholder="전화번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('telinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('telinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple">
    		<div class="update_text">
    			<a>한줄소개</a>
    		</div>
    		<div class="update_input">
    			<div class="input_box" id="commentinputbox" >
					<input type="text" id="comment" name="comment" value="${user.comment}"
					placeholder="한줄소개" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('commentinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('commentinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		</div>
    		
    		<div class="update_tuple" style="height: 170px; margin-bottom: 50px;">
    		<div class="update_text">
    			<a>프로필 사진</a>
    		</div>
    		<div class="img_box" >
  				<div class="img preview-image" id="imgs">
  				<div class="upload-display"><div class="upload-thumb-wrap"><img src="file/${user.imgurl}" class="upload-thumb"></div></div>
				<input type="file" id="input-file" class="upload-hidden" name="img">
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
  			<input class="input_submit" style="font-size:36px; width:300px; margin: 0 auto; margin-top:50px;" type="submit" value="수정하기">
    	</div>
</form:form>
</body>
</html>