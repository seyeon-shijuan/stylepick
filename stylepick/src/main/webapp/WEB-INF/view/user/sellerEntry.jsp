<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link rel="stylesheet" href="../assets/css/user.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var namechecked=false;
	var telchecked=false;
	
	function win_upload(){
		var op = "width=500,height=500,left=50,top=150";
		open("pictureForm.shop","",op);
	}
	
	function allchkbox(allchk){
		$("input[name='chkbox']").prop("checked",allchk.checked)
	}
	
	function emptynamechk(){
		document.getElementById('nameinputbox').style.border='1px solid #dadada'
		var name =  $("#name").val();
		if(name==""){
			$("#emptyname").show();
			namechecked = false;
		}else{
			$("#emptyname").hide();
			namechecked = true;
		}
	}
	function emptytelchk(){ //숫자가 아닌경우도 배제할것
		document.getElementById('telinputbox').style.border='1px solid #dadada'
		var tel =  $("#tel").val();
		if(tel==""){
			$("#emptytel").show();
			telchecked = false;
		}else{
			$("#emptytel").hide();
			telchecked = true;
		}
	}

	
	function chkboxcheck(f) {
		  var question = confirm("등록하시겠습니까?");
		  if(!question){
			  return false;
		  }
		  var result = true;
		  if(!namechecked){
			  result = false;
			  alert("이름을 확인하세요.")
		  }
		  if(!telchecked){
			  result = false;
			  alert("전화번호를 확인하세요.")
		  }
		  if(!$("input:checkbox[id='chkbox1']").is(":checked")) {
	        alert("이용 약관에 동의하세요.")
	        result=false;
	      }
	      if(!$("input:checkbox[id='chkbox2']").is(":checked")) {
	        alert("개인정보 수집 이용 약관에 동의하세요.")
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
    		 
	<form:form modelAttribute="user" method="post" enctype="multipart/form-data" action="sellerEntry.shop" onsubmit="return chkboxcheck(this)">
		<input type="hidden" name="userid" value="${loginUser.userid}">
		<div style="width: 100%; display:inline;text-align: center; height: 100px;">
			<spring:hasBindErrors name="user">
				<font class="userfont" color="red">
					<c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
				</font>
			</spring:hasBindErrors>
    	</div>
    	<div class="social_login_box" style="height: auto; margin-top: 15px;">
    		
    		<div style="width: 100%; text-align: center;">
    			<h1 class="sellEntry_header">판매자 신청</h1>
    		</div>
    		<div class="entry_text">
    			<a>이름</a><a style="color: red;">*</a>&nbsp;&nbsp;&nbsp;<a style="font-size: 15px; color: black;">등록후 변경 불가능합니다.</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="nameinputbox" >
					<input type="text" id="name" name="name" placeholder="이름" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('nameinputbox').style.border='2px solid #FE6500'"
					 onblur="javascript:emptynamechk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="emptyname" style="display: none;"><font class="userfont" id="emptynameval">필수사항입니다.</font></div></div>
    		
    		<div class="entry_text">
    			<a>전화번호</a><a style="color: red;">*</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="telinputbox" >
					<input type="text" id="tel" name="tel" placeholder="전화번호" value="${loginUser.tel}"
					 class="input_input" autocomplete="off"
					 onfocus="document.getElementById('telinputbox').style.border='2px solid #FE6500'"
					 onblur="javascript:emptytelchk()">
				</div>
    		</div>
    		<div class="input_err" style="margin-left: 60px;">
    		<div id="emptytel" style="display: none;"><font class="userfont" id="emptytelval">필수사항입니다.</font></div></div>
    		<hr style="margin-top: 24px; width: 90%">
			
    		<div class="entry_text">
    			<a>회사 이름</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="com_nameinputbox" >
					<input type="text" id="com_name" name="com_name" placeholder="회사이름" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_nameinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_nameinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		
    		<div class="entry_text">
    			<a>사업자 등록번호</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="com_registinputbox" >
					<input type="text" id="com_regist" name="com_regist" placeholder="사업자 등록번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_registinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_registinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
    		
    		<div class="entry_text">
    			<a>회사 전화번호</a>
    		</div>
    		<div class="entry_input">
    			<div class="input_box" id="com_telinputbox" >
					<input type="text" id="com_tel" name="com_tel" placeholder="회사 전화번호" class="input_input" autocomplete="off"
					 onfocus="document.getElementById('com_telinputbox').style.border='2px solid #FE6500'"
					 onblur="document.getElementById('com_telinputbox').style.border='1px solid #dadada'">
				</div>
    		</div>
   		
    		<div class="entry_text">
    			<a>회사 대표 사진</a>
    		</div>
    		<div class="img_box" >
  				<div class="img preview-image" id="imgs">
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
					               console.log(src);
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
  			<hr style="margin-top: 180px;margin-bottom: 20px; width: 90%">
  			<%--TODO css구성 --%>
  			<div style="width:70%; margin-left:15%; height:175px; border: 2px solid black;">
  			<input type="checkbox" name="allchk" onchange="allchkbox(this)">전체 약관에 동의합니다.<br>
  			<input type="checkbox" name="chkbox" id="chkbox1">이용약관 동의<br>
  			<input type="checkbox" name="chkbox" id="chkbox2">개인정보 수집 및 동의
  			</div>
    	</div>
    	<input class="input_submit" style="font-size:36px; height: 90px;background-color:#FE6500;" type="submit" value="판매자 가입 ">
	</form:form>
</div>
</div>
</div>
</body>
</html>
