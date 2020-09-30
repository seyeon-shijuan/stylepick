<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 등록</title>
<link rel="stylesheet" href="${path}/assets/css/add.css?ver=1.1">
<style>
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
	 	width: 240px; 
	 	height: 240px;
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
<script type="text/javascript">
var oTbl;
//Row 추가
function insRow() {
oTbl = document.getElementById("addTable");
var oRow = oTbl.insertRow();
oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRow.insertCell();

//삽입될 Form Tag

var frmTag = "<input type=text name=item_option style=width:380px; height:20px;> ";
frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand; width:380px; margin-bottom:10px;'>";
oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
	console.log(oTbl.clickedRowIndex);
oTbl.deleteRow(oTbl.clickedRowIndex);
}

//function frmCheck()
//{
//var frm = document.form;
//
//for( var i = 0; i <= frm.elements.length - 1; i++ ){
//   if( frm.elements[i].name == "addText" )
//   {
//       if( !frm.elements[i].value ){
//           alert("텍스트박스에 값을 입력하세요!");
//               frm.elements[i].focus();
//	 return;
//        }
//    }
// }
//}
</script>
<script>
var oTbl1;
//Row 추가
function insRow1() {
oTbl1 = document.getElementById("addTable1");
var oRow1 = oTbl1.insertRow();
oRow1.onmouseover=function(){oTbl1.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRow1.insertCell();

//삽입될 Form Tag
var frmTag = "<input type=text name=size style=width:380px; height:20px;> ";
frmTag += "<input type=button value='삭제' onClick='removeRow1()' style='cursor:hand; width:380px; margin-bottom:10px;'>";
oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow1() {
oTbl1.deleteRow(oTbl1.clickedRowIndex);
}
</script>
<script type="text/javascript">
function inputcheck(){
	f=document.f;
	if(f.subject.value==""){
		alert("제목을 입력해주세요");
		f.subject.focus();
		return;
	}
	if(f.category.value==""){
		alert("카테고리를 선택해주세요");
		f.category.focus();
		return;
	}
	if(f.code.value==""){
		alert("상품번호를 입력해주세요");
		f.code.focus();
		return;
	}
	if(f.item_name.value==""){
		alert("상품이름을 입력해주세요");
		f.item_name.focus();
		return;
	}
	if(f.price.value==0){
		alert("가격을 설정해주세요");
		f.price.focus();
		return;
	}
	
	f.submit()
	
}
</script>
</head>
<body>
	<h1 style="width: fit-content;border-bottom: 3px solid #c0d4fb;">상품 올리기</h1>
	<h5>상품 올리기 관련 문의가 필요하시 다면 &nbsp;&nbsp; <a href="../board/add.shop?t=q" style="color:#35c5f0; font-size:15px">문의하러 가기</a></h5>
	<br>
<form:form modelAttribute="item" action="register.shop" enctype="multipart/form-data" name="f">
<form:hidden path="userid" value="${sessionScope.loginUser.userid}"/>
	<div>
	<div>
	<ul>상품분류</ul>
	</div>
	<div>
	 <select class="category1" name="category">
	 		<option value="">카테고리</option>
	 		<option value="1">모자</option>
	 		<option value="2">아우터</option>
	 		<option value="3">원피스</option>
	 		<option value="4">상의</option>
	 		<option value="5">하의</option>
	 		<option value="6">가방</option>
	 		<option value="7">신발</option>
	 		<option value="8">시계</option>
	 </select>
	</div>
	<br>
	<br>
	<div class="subject-name">
	<ul class="subject-name2">상품 제목</ul>
	<dl><input type="text" name="subject" maxlength="40"  style="width:400px;"></dl>
	</div>
	<div style="margin-bottom:15px;">
	<ul>대표 이미지</ul>
				<div class="img preview-image" id="imgs">
				<label for="input-file" id="imglabel">업로드</label> 
				<input type="file" id="input-file" class="upload-hidden" name="imgurl">
				<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<div>
	<div class ="ii">
	<ul>상품 이름</ul>
	<dl><form:input path="item_name" maxlength="20" /></dl>
	</div>
	<div class="ii">
	<ul>상품 코드</ul>
	<dl><form:input path="code"/></dl>
	</div>
	</div>
	
	<div>
	<ul>상품 설명</ul>
	<dl><form:textarea path="content" cols="99" rows="12" /></dl>
	<script type="text/javascript">CKEDITOR.replace("content",{
		filebrowserImageUploadUrl : "imgupload.shop"
	});
	</script>
	</div>
	
	<div style="margin-bottom:15px;">
	<div class ="oi">
	<ul>상품 옵션</ul>

	<dl><input type="text" name="item_option" style="width:345px">
	<input name="addButton" type="button" style="cursor:hand; width:45px;" onClick="insRow()" value="+" ></dl>
	<table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0"></table>
	</div>
	
	<div class="oi2">
		<ul>사이즈</ul>

	<dl><input type="text" name="size" style="width:345px"><input name="addButton1" type="button" style="cursor:hand; width:45px;" onClick="insRow1()" value="+" ></dl>

		<table id="addTable1" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0"></table>
	</div>
	</div>
	
	<div>
	<div class ="ii">
	<ul>키워드</ul>
	<dl><form:input path="keyword" placeholder="ex)잇템,반지,귀여운 반지,유니크 반지"/></dl>

	</div>
	<div class="ii2">
		<ul>가격</ul>
	<dl><form:input path="price"/></dl>
	</div>
	</div>
	<br>
	<a href="javascript:inputcheck()" class="genric-btn success medium">상품등록</a>
	
	</div>
 
</form:form>


</body>
</html>