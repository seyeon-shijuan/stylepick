<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${type.title} 수정</title>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script>
function reg() {
	if ($('#title').val().trim() == "") {
		alert("제목을 입력하세요")
		$('#title').focus()
		return
	}
	if ($('#content').val().trim() == "") {
		alert("내용을 입력하세요")
		$('#content').focus()
		return
	}
	if (${empty sessionScope.loginUser} && ${param.t == 'q'} && $('#email').val().trim() == "") {
		alert("이메일을 입력하세요")
		$('#email').focus()
		return
	}
	$('#f').submit()
}
</script>
</head>
<body>
<br><br>
	<div align="center">
		<form:form modelAttribute="board" action="modify.shop" enctype="multipart/form-data" name="f" id="f">
			<input type="hidden" name="no" value="${param.no}">
		<c:if test="${empty sessionScope.loginUser}">
			<input type="hidden" name="author" value="비회원">
		</c:if>
		<c:if test="${!empty sessionScope.loginUser}">
			<input type="hidden" name="author" value="${sessionScope.loginUser.userid}">
		</c:if>
			<input type="hidden" name="seq" value="${seq}">
			<div class="col-lg-8 col-md-8">
				<h3 class="mb-30">${typetitle} 수정</h3>
					<!-- QnA -->
					<c:if test="${param.t == 'q'}">
					<input type="hidden" name="stat" value="wait">
					<div class="mt-10">
						<div id="default-select">
							<select id="cts">
								<option value="0">분류</option>
								<c:forEach items="${category}" var="c">
								<option value="${c}">${c}</option>
								</c:forEach>
							</select>
							<input type="hidden" name="category" id="cti">
						</div>
					</div>
					<br><br>
					</c:if>
					<!-- FAQ -->
					<c:if test="${param.t == 'f'}">
					<input type="hidden" name="category" id="category">
					<div class="mt-10">
						<input type="text" name="category1" id="category1" placeholder="대분류" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '대분류'" required class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" name="category2" id="category2" placeholder="중분류" onfocus="this.placeholder = ''" 
							onblur="this.placeholder = '중분류'" required class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" name="category3" id="category3" placeholder="소분류" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '소분류'" required class="single-input">
					</div>
					</c:if>
					
					<div class="mt-10">
						<input type="text" name="title" id="title" placeholder="제목" onfocus="this.placeholder = ''"
							onblur="this.placeholder = '제목'" required class="single-input" value="${board.title}">
					</div>
					<div class="mt-10">
						<textarea class="single-textarea" name="content" id="content" placeholder="내용"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '내용'">${board.content}</textarea>
					</div>
					<br>
					<p>첨부파일</p>
					<input type="file" name="file1" value="${board.file1}">
			</div>
			<br>
			<div class="col-lg-8 col-md-8">
				<c:if test="${param.t == 'q'}">
				<hr><br>
				<c:if test="${!empty sessionScope.loginUser}">
				<div class="switch-wrap d-flex justify-content-between">
					<input type="hidden" value="0" name="mail" id="mail">
					<p><b>이메일로 답변 받기</b></p>
					<div class="confirm-checkbox">
						<input type="checkbox" id="confirm-checkbox">
						<label for="confirm-checkbox"></label>
					</div>
				</div>
				</c:if>
				<c:if test="${empty sessionScope.loginUser}">
				<div class="switch-wrap d-flex justify-content-between">
					<input type="hidden" value="1" name="mail" id="mail">
					<p><b>이메일로 답변 받기</b></p>
					<div class="disabled-checkbox">
						<input type="checkbox" id="disabled-checkbox" checked disabled>
						<label for="disabled-checkbox"></label>
					</div>
				</div>
				</c:if>
				<div class="mt-10" id="div-email" style="display: none;">
					<input type="text" name="email" id="email" placeholder="이메일" onfocus="this.placeholder = ''"
						onblur="this.placeholder = '이메일'" class="single-input">
					<br>
				</div>
				<div class="switch-wrap d-flex justify-content-between">
					<input type="hidden" value="1" name="openstatus" id="openstatus">
					<p><b>비공개 질문으로 등록하기</b></p>
					<div class="confirm-checkbox">
						<input type="checkbox" id="confirm-checkbox2">
						<label for="confirm-checkbox2"></label>
					</div>
				</div>
				<div class="switch-wrap d-flex justify-content-between">
					<p>등록된 질문은 수정 및 삭제가 불가능하며 광고 등 부적절한 글은 관리자에 의해 삭제될 수 있습니다.</p>
				</div>
				</c:if>
				<hr>
				<div class="single-element-widget mt-30" style="text-align: center;">
					<a href="#" onclick="reg()" class="genric-btn danger">등록하기</a>
				</div>
			</div>
		</form:form>
	</div>
	
<script>
	$(function() {
		var category1 = $("#category1").val()
		var category2 = $("#category2").val()
		var category3 = $("#category3").val()
		
		$("#category1").on("propertychange change keyup paste input", function() {
		    var current = $(this).val();
		    if(current == category1) {
		        return;
		    }
		    category1 = current;
		    if (category1.trim() == "") {
		    	$("#category").val("")
		    } else if (category2.trim() == "") {
		    	$("#category").val(category1)
		    } else if (category3.trim() == "") {
		    	$("#category").val(category1 + "," + category2)
		    } else {
		    	$("#category").val(category1 + "," + category2 + "," + category3)
		    }
		});
		$("#category2").on("propertychange change keyup paste input", function() {
		    var current = $(this).val();
		    if(current == category1) {
		        return;
		    }
		    category2 = current;
		    if (category1.trim() == "") {
		    	$("#category").val("")
		    } else if (category2.trim() == "") {
		    	$("#category").val(category1)
		    } else if (category3.trim() == "") {
		    	$("#category").val(category1 + "," + category2)
		    } else {
		    	$("#category").val(category1 + "," + category2 + "," + category3)
		    }
		});
		$("#category3").on("propertychange change keyup paste input", function() {
		    var current = $(this).val();
		    if(current == category3) {
		        return;
		    }
		    category3 = current;
		    if (category1.trim() == "") {
		    	$("#category").val("")
		    } else if (category2.trim() == "") {
		    	$("#category").val(category1)
		    } else if (category3.trim() == "") {
		    	$("#category").val(category1 + "," + category2)
		    } else {
		    	$("#category").val(category1 + "," + category2 + "," + category3)
		    }
		});
		
		$("#confirm-checkbox").change(function() {
	        if ($("#confirm-checkbox").is(":checked")) {
				$("#div-email").css("display", "")
				$("#openstatus").val(1)
	        } else {
	        	$("#div-email").css("display", "none")
				$("#openstatus").val(0)
	        }
	    });
		
		if (${empty sessionScope.loginUser}) {
			$("#div-email").css("display", "")
		}
		
		$("#confirm-checkbox2").change(function() {
	        if ($("#confirm-checkbox2").is(":checked")) {
	            $("#openstatus").val(0)
	        } else {
	        	$("#openstatus").val(1)
	        }
		});
		
		$('#cts').change(function() { 
			$('#cti').val($('#cts option:selected').val())
		});
	})
</script>
</body>
</html>