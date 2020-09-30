<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상품 수정</title>
<link rel="stylesheet" href="${path}/assets/css/add.css?ver=1.2">
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
</head>
<body>
	<h1 style="width: fit-content;border-bottom: 3px solid #c0d4fb;">상품 올리기</h1>
	<h5>상품 올리기 관련 문의가 필요하시 다면 &nbsp;&nbsp; <a href="../board/add.shop?t=q" style="color:#35c5f0; font-size:15px">문의하러 가기</a></h5>
	<br>
<form:form modelAttribute="item" action="update.shop" enctype="multipart/form-data" name="f">
<form:hidden path="item_no" value="${param.item_no}"/>
<form:hidden path="userid" value="${sessionScope.loginUser.userid}"/>
	<div>
	<div>
	<ul>상품분류</ul>
	</div>
	<div>
	 <select class="category1" name="category">
	 		<option value="1" <c:if test="${item.category==1}">selected</c:if>>모자</option>
	 		<option value="2" <c:if test="${item.category==2}">selected</c:if>>아우터</option>
	 		<option value="3" <c:if test="${item.category==3}">selected</c:if>>원피스</option>
	 		<option value="4" <c:if test="${item.category==4}">selected</c:if>>상의</option>
	 		<option value="5" <c:if test="${item.category==5}">selected</c:if>>하의</option>
	 		<option value="6" <c:if test="${item.category==6}">selected</c:if>>가방</option>
	 		<option value="7" <c:if test="${item.category==7}">selected</c:if>>신발</option>
	 		<option value="8" <c:if test="${item.category==8}">selected</c:if>>시계</option>
	 </select>
	</div>
	<br>
	<br>
	<div class="subject-name">
	<ul class="subject-name2">상품 제목</ul>
	<dl><form:input type="text" path="subject" maxlength="20"  style="width:400px;"/></dl>
	</div>
	<div style="margin-bottom:15px;">
	<ul>대표 이미지</ul>
				<div class="img preview-image" id="imgs">
				<div class="upload-display"><div class="upload-thumb-wrap"><img src="img/${item.pictureUrl}" class="upload-thumb"></div></div>
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
	<dl><form:input path="item_name" maxlength="20"/></dl>
	</div>
	<div class="ii">
	<ul>상품 코드 (상품코드는 변경할 수 없습니다.)</ul>
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
		<dl><input type="text" name="item_option" style="width:345px"><input name="addButton" type="button" style="cursor:hand; width:45px;" onClick="insRow()" value="+" ></dl>
		<table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
			<c:forEach var="o" items="${option}">
			<tr><td>
				<input type=text name=item_option style="width:380px;" value="${o}">
				<input type=button value='삭제' onClick='removeRow()' style="cursor:hand; width:380px; margin-bottom:10px;">
			</td></tr>
			</c:forEach>
		</table>
	</div>
	<div class="oi2">
		<ul>사이즈</ul>
		<dl><input type="text" name="size" style="width:345px"><input name="addButton1" type="button" style="cursor:hand; width:45px;" onClick="insRow1()" value="+" ></dl>
		<table id="addTable1" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
			<c:forEach var="s" items="${size}">
			<tr><td>
				<input type=text name=size style="width:380px;" value="${s}">
				<input type=button value='삭제' onClick='removeRow1()' style="cursor:hand; width:380px; margin-bottom:10px;">
			</td></tr>
			</c:forEach>
		</table>
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
<input type="submit" class="genric-btn success medium" value="상품 수정" style="width: 150px;height: 45px;">
<input type="button" class="genric-btn success2 medium" value="상품 삭제" onclick="javascript:deletecheck()" style="width: 150px;margin-left: 20px;height: 45px;">
	</div>
 
</form:form>

<script>
function deletecheck() {
	var question = confirm("삭제하시겠습니까?");
	if(question){
		location.href="delete.shop?item_no="+${param.item_no}
	} else {
		return false;
	}
}
</script>
</body>
</html>