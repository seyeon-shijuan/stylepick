<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A작성하기</title>
<script type="text/javascript">
function refresh(){
	opener.document.location.reload();
		self.close();
	}
</script>
<script type="text/javascript">
function inputcheck(){
	f=document.f;
	if(f.content.value==""){
		alert("궁금한 내용을 작성해 주세요!!!");
		f.evaluation.focus();
		return;
	}
	
	
	f.submit()
	
}
</script>
<style type="text/css">
.btn{
      text-decoration: none;
      font-size:1.5rem;
      color:black;
      margin:20px;
      display:inline-block;
      border:2px solid #333333;
      border-radius: 10px;
      transition:all 0.1s;
      font-family: 'Lobster', cursive;
    }
</style>
</head>
<body onunload="refresh()">
<form:form modelAttribute="qna" action="plus.shop"  name="f">
 <input type="hidden" name="item_no" value="${param.item_no}"/>
  <input type="hidden" name="userid" value="${sessionScope.loginUser.userid}"/>
  <input type="hidden" name="type" value="0"/>
	<h2>Q&A작성하기</h2>
	<hr>
	<h4>궁금한 것이 있으시면 적어주세요</h4>
	<div>
	<textarea name="content" cols="55" rows="12" ></textarea>
	</div>
	<a href="javascript:inputcheck()" class="btn" id="con1">작성</a>

</form:form>
</body>
</html>