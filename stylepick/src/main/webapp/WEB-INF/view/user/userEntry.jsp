<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link rel="stylesheet" href="../assets/css/user.css?ver=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var idchecked=false;
	var passchecked=false;
	var nickchecked=false;
	function passcheck(){
		 document.getElementById('pw2inputbox').style.border='1px solid #dadada'
		var pass=$("#password").val();
	       var pass2=$("#password2").val();
	       if(pass != "" || pass2 != "") {
	          if(pass == pass2) {
	             $("#alert_password2").hide();
	             passchecked=true;
	          } else {
	             $("#alert_password2").show();
	             passchecked=false;
	          }
	       }
	}
	
	function allchkbox(allchk){
		//document.getElementById('chkbox').checked=allchk.checked;
		$("input[name='chkbox']").prop("checked",allchk.checked)
	}
	
	function alreadyidchk(){
		document.getElementById('idinputbox').style.border='1px solid #dadada'
		var userid =  $("#userid").val();
		$.ajax({
			url : "confirmid.shop",
			data : {id:userid},
			success : function(result){
				if(result=='true'){
					$("#alreadyid").show();
					idchecked=false;
				}
				else{
					$("#alreadyid").hide();
					idchecked=true;
				}
			}
		})
	}
	
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
	function chkboxcheck(f) {
			var question = confirm("등록하시겠습니까?");
			if(!question){
			  return false;
			}
			
			var result = true;
			if(!idchecked){
				result=false;
				alert("아이디를 확인하세요.")
			}
			if(!passchecked){
				result=false;
				alert("패스워드를 확인하세요.")
			}
			if(!nickchecked){
				result=false;
				alert("닉네임을 확인하세요.")
			}
		  if(!$("input:checkbox[id='chkbox1']").is(":checked")) {
	        alert("이용 약관에 동의하세요.")
	        result=false;
	      }
	      if(!$("input:checkbox[id='chkbox2']").is(":checked")) {
	        alert("개인정보 수집 이용 약관에 동의하세요.")
	        result= false;
	      }
	      if(!$("input:checkbox[id='chkbox3']").is(":checked")) {
		        alert("14세 이상이여야 합니다.")
		        result= false;
		      }
	      return result;
	   }

</script>
</head>
<body bgcolor="#f5f6f7">
<div class="login_background">
<div class="center">
			<div style="width: 200px; margin-left:auto; padding-top: 20px" >
			<ul class="userul">
		  		<li class="userli"><a class="usera" href="../sns/main.shop?ksb=hot&type=1">홈</a></li>
		  		<li class="userli" style="width: 1px; height : 26px; background: #000; position: absolute;"/>
		  		<li class="userli"><a class="usera" href="../board/support.shop">고객센터</a></li> <%--TODO 고객센터 --%>
	  		</ul>
	  		</div>
<div style="margin-top:25px; margin-bottom:50px; position: relative;">
    		<img src="../assets/img/splogo.PNG" width="620px"
    		 onclick="javascript:location.href='../sns/main.shop?ksb=hot&type=1'" style="margin-bottom:20px; cursor: pointer;">
    	<div class="social_login_box" style="display: none;" >
    		<div style="padding-top: 1px; padding-left: 13px;">
    		<h2>소셜로 간편히 로그인하세요.</h2>
    			<ul class="userul">
    			<li class="userli"><a class="social_seq_button usera" href="#">Kakao</a></li>
	  			<li class="userli"><a class="social_seq_button usera" href="#">Facebook</a></li>
    			</ul>
    			
    			<ul class="userul" style="margin-top: 15px;">
    			<li class="userli"><a class="social_seq_button usera" href="#">Naver</a></li>
	  			<li class="userli"><a class="social_seq_button usera" href="#">Google</a></li>
    			</ul>
    		</div>
    	</div>
    	<hr style="display: none;">
	<form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="userEntry.shop" onsubmit="return chkboxcheck(this)">
		<div style="width: 100%; display:inline;text-align: center; height: 100px;">
			<spring:hasBindErrors name="user">
				<font class="userfont" color="red">
					<c:forEach items="${errors.globalErrors }" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font>
			</spring:hasBindErrors>
    	</div>
    	<div class="social_login_box" style="height: auto; margin-top: 15px;">
    		<div class="entry_text">
    			<a>아이디</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="idinputbox" >
					<input type="text" id="userid" name="userid" placeholder="아이디" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('idinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:alreadyidchk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="alreadyid" style="display: none;"><font class="userfont" id="alreadyidval">이미 존재하는 아이디입니다.</font></div>
    		<font class="userfont"><form:errors path="userid"/></font></div>
    		<div class="entry_text">
    			<a>비밀번호</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="pwinputbox" >
					<input type="password" id="password" name="password" placeholder="비밀번호 입력" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('pwinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('pwinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font class="userfont"><form:errors path="password"/></font></div>
    		
    		<div class="entry_text">
    			<a>비밀번호 재입력</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="pw2inputbox" > <%--비밀번호 확인 --%>
					<input type="password" id="password2" name="password2" placeholder="비밀번호 재입력" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('pw2inputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:passcheck()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font class="userfont"><a id="alert_password2" style="display: none; color: red;">비밀번호가 다릅니다.</a></font></div>
    		
    		<div class="entry_text">
    			<a>닉네임</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="nicknameinputbox" >
					<input type="text" id="nickname" name="nickname" placeholder="닉네임" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nicknameinputbox').style.border='2px solid #35C5F0'"
					 onblur="javascript:alreadyNicknamechk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="alreadyNickname" style="display: none;"><font class="userfont" id="alreadyNicknameval">이미 존재하는 이메일입니다.</font></div>
    		<font class="userfont"><form:errors path="nickname"/></font></div>
    		
    		<div class="entry_text">
    			<a>이메일</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="emailinputbox" >
					<input type="text" id="email" name="email" placeholder="aaa@bb.cc" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('emailinputbox').style.border='2px solid #35C5F0'"
					 onblur="document.getElementById('emailinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;"><font class="userfont"><form:errors path="email"/></font></div>
    		
    		<div class="entry_text">
    			<a>프로필 사진</a>
    		</div>
    		<div class="img_box" >
  				<div class="img preview-image" id="imgs">
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
  			<hr style="margin-top: 210px;margin-bottom: 20px;">
  			<%--TODO css구성 --%>
  			<div style="width:70%; margin-left:15%; height:175px; border: 2px solid black;">
  			<input type="checkbox" name="allchk" onchange="allchkbox(this)">전체 약관에 동의합니다.<br>
  			<input type="checkbox" name="chkbox" id="chkbox1">이용약관 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox2">개인정보 수집 및 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox3">14세 이상입니다.
  			
  			</div>
    	</div>
    	<input class="input_submit" id="submit" style="font-size:36px; height: 90px;" type="submit" value="stylepick 가입">
	</form:form>
</div>
</div>
</div>
</body>
</html>
