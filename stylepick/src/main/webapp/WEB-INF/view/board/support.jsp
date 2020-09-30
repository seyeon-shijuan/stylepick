<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<style>
.main-mapper {
	width: 100%;
	margin: 0;
}
p.typing-txt{display: none;}
  
.typing {  
     display: inline-block; 
      animation-name: cursor; 
      animation-duration: 0.3s; 
      animation-iteration-count: infinite; 
} 
@keyframes cursor{ 
      0%{border-right: 1px solid #fff} 
      50%{border-right: 1px solid #000} 
      100%{border-right: 1px solid #fff} 
}
</style>
</head>
<body>
<div align="center" style="width:100%; height:400px; background-image: url('${path}/assets/img/hero/h1_hero.jpg');">
	<br><br>
	<table>
	<tr><th><font size="14px" class="typing-txt" style="display: none;">안녕하세요, 고객지원센터입니다.</font><font size="14px" class="typing"></font></th></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><th><font size="6px"><a href="${path}/board/faq.shop" style="color: blue;">FAQ</a>에서 사용 방법을 찾고 문제를 해결하세요</font></th></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td><font size="5px">어떤 문제를 겪고 계신가요?</font></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>
		<a href="${path}/board/faq.shop?c=구매" class="genric-btn danger radius">구매</a>&nbsp;&nbsp;
		<a href="${path}/board/faq.shop?c=판매" class="genric-btn danger radius">판매</a>&nbsp;&nbsp;
		<a href="${path}/board/faq.shop?c=OOTD" class="genric-btn danger radius">OOTD</a>&nbsp;&nbsp;
		<a href="${path}/board/faq.shop?c=기타" class="genric-btn danger radius">기타</a>
	</td></tr>
	</table>
</div>
<br><br><br>
<div align="center" style="width:100%;">
	<h3>원하는 내용을 찾을 수 없으셨나요?</h3>
	<br>

	<c:if test="${empty sessionScope.loginUser}">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
		문의하기
	</button>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">문의하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
      			</div>
      			<div class="modal-body">
        			비회원도 이메일로 답변받으실 수 있습니다.
      			</div>
				<div align="center" style="margin-bottom: 30px">
					<a href="${path}/user/login.shop" class="genric-btn success radius">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${path}/board/add.shop?t=q" class="genric-btn success radius">비회원</a>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	
	<c:if test="${!empty sessionScope.loginUser}">
	<button type="button" class="btn btn-primary" onclick="location.href='${path}/board/add.shop?t=q'">
		문의하기
	</button>
	</c:if>
</div>
<script src="${path}/assets/board/js/jquery-3.3.1.min.js"></script>
<script>
$(function() {
	var typingBool = false; 
    var typingIdx=0; 
    var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다 
    typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
    if(typingBool==false){ // 타이핑이 진행되지 않았다면 
       typingBool=true; 
       
       var tyInt = setInterval(typing,100); // 반복동작 
     } 
     
     function typing(){ 
       if(typingIdx<typingTxt.length){ // 타이핑될 텍스트 길이만큼 반복 
         $(".typing").append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
         typingIdx++; 
       } else{ 
         clearInterval(tyInt); //끝나면 반복종료 
       } 
     }  
})
</script>
</body>
</html>