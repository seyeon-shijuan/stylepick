<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
<link rel="stylesheet" href="../assets/css/user.css">
</head>
<body>
<div style="margin-left: auto;margin-right:auto; width: 60%; max-width: 750px;">
	<div style="text-align: center; margin-top: 80px;">
		<h1 style="font-size: 56px;">판매자 등록이 완료되었습니다!</h1>
	</div>
	<div style="margin-top: 40px;">
			<ul class="welcome_ul">
	    		<li class="welcome_li"><a class="welcome_a" href="../sns/main.shop?ksb=hot&type=1">메인페이지</a></li>
		  		 <li class="welcome_li"><a class="welcome_a" href="sellList.shop?id=${sessionScope.loginUser.userid }">판매자페이지</a></li>
	    	</ul>
	</div>
</div>
</body>
</html>