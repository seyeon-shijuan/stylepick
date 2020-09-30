<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header/main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/assets/css/store.css?ver=1.2">
<style>
	#slider {
		position:relative;
		overflow: hidden;
		width:1200px;
		height:500px;
		text-align: center;
	}


	#slider .slide {
		float: left;
		list-style-type: none;
	}



	#slider-nav {
	position:absolute;
	height:2em;
	bottom:0em;
	width:100%;
	cursor:default;
	}

	.slider_image{
	float:left;
	width:1200px;
	height:500px;
	}
	
	#slider-nav-dot-con {
	text-align:center;
	}

	.slider-nav-dot {
	list-style:none;
	border: 0.15em solid white;
	box-sizing:border-box;
	width:1em;
	height:1em;
	display:inline-block;
	border-radius:50%;
	vertical-align:middle;
	}

	.slider-nav-dot:hover {
	background:white;
	}

</style>
<script>
	'use strict';

	$(function() {

		//이 부분을 자신의 상황에 맞게 수정
		var width = 1200; //슬라이드 한 개의 폭
		var height = 500; //슬라이드 높이
		var animationSpeed = 1500; //화면전환 속도
		var pause = 4000; //화면전환 후 일시 정지 속도
		var totalSlides = 10; //복제 슬라이드를 포함한 전체 슬라이드 개수

		var currentSlide = 2; //이 항목은 수정하지 않음
		var interval;
		var action;
		var dotNum;
		var dMinusC;

		//cache DOM elements
		var $slideCon = $('#slider');
		var $slideUl = $('.slides');
		var $slides = $('.slide');
		var $dots = $('.slider-nav-dot');
		var $sliderNavPrv = $('#slider-nav-prv');
		var $sliderNavNxt = $('#slider-nav-nxt');

		function initSlider(){
			$slideCon.css('width',width);
			$slideCon.css('height',height);
			$slideUl.css('margin-left',-width);
			$slideUl.css('width',totalSlides*width);
			$slides.css('width',width);
			$slides.css('height',height);
		}

		function startSlider(action, dotNum) {

			if(action == 'prv'){
				$slideUl.animate({'margin-left': '+='+width}, animationSpeed, function() {
					if (--currentSlide === 1) {
						currentSlide = $slides.length-1;
						$slideUl.css('margin-left', -($slides.length-2)*width);
					}else{}

					for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
					$dots[currentSlide-2].style.background = "white";
				});
			} else if(action == 'nxt') {
				$slideUl.animate({'margin-left': '-='+width}, animationSpeed, function() {
					if (++currentSlide === $slides.length) {
						currentSlide = 2;
						$slideUl.css('margin-left', -width);
					}else{}

					for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
					$dots[currentSlide-2].style.background = "white";
				});
			} else if(action == 'dot') {
				dMinusC = dotNum-currentSlide;
				currentSlide = dotNum;

				for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
				$dots[currentSlide-2].style.background = "white";

				$slideUl.animate({'margin-left': '-='+(dMinusC*width)}, animationSpeed);

			} else {
				// setInterval(function,milliseconds)
				// 지정한 시간에 한번씩 함수를 실행
				// 3초 마다 $slideUl 의 왼쪽 마진을 -width 함. 에니메이션 속도는 1초.
				interval = setInterval(function() {

					//.animate( CSS properties [, duration ] [, complete ] )
					$slideUl.animate({'margin-left': '-='+width}, animationSpeed, function() {
						if (++currentSlide === $slides.length) { // $slides.length == 7
							currentSlide = 2;
							$slideUl.css('margin-left', -width);
						}

						for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
						$dots[currentSlide-2].style.background = "white";
					});	

				}, pause);
			}

		}


		function pauseSlider() {
			clearInterval(interval);
		}

		function prvSlide(){
			startSlider('prv');
		}

		function nxtSlide(){
			startSlider('nxt');
		}

		function dotSelected(){
			dotNum = $(this).attr('id');
			dotNum = parseInt(dotNum.substring(7))+1;
			startSlider('dot', dotNum);
		}


		$slideUl
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$sliderNavPrv
			.on('click',prvSlide)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$sliderNavNxt
			.on('click',nxtSlide)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$dots
			.on('click', dotSelected)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);		

		
		initSlider();
		startSlider();

	});

</script>
</head>
<body>
<div style="width:1350px;">
<div style="float:right">

<!-- <a href="create.shop" class="genric-btn primary circle">상품 작성</a> -->

</div>
<div id="slider">
	<ul class="slides">
		<!-- 이 부분을 자신의 상황에 맞게 수정 -->
		<!-- 5개의 이미지 목록으로 구성한 슬라이드를 만들고 싶다면, 목록 처음과 끝에 복사본을 붙여넣어야함 -->
		<!-- 목록 처음에는 5번 이미지의 복사본을 붙여넣음  -->
		<!-- 목록 끝에는 1번 이미지의 복사본을 붙여넣음  -->
		<!-- 자세한 설명은 http://blog.naver.com/2woo30225/220838511483 에서 참고 -->
		<li class="slide slide8"><a href="${path}/item/list.shop?category=8"><img src="../assets/img/watch.PNG" class="slider_image" /></a></li>
		<li class="slide slide1"><a href="${path}/item/list.shop?category=1"><img src="../assets/img/hat.PNG" class="slider_image" /></a></li>
		<li class="slide slide2"><a href="${path}/item/list.shop?category=2"><img src="../assets/img/outer.PNG" class="slider_image" /></a></li>
		<li class="slide slide3"><a href="${path}/item/list.shop?category=3"><img src="../assets/img/onepiece.PNG" class="slider_image" /></a></li>
		<li class="slide slide4"><a href="${path}/item/list.shop?category=4"><img src="../assets/img/top.PNG" class="slider_image" /></a></li>
		<li class="slide slide5"><a href="${path}/item/list.shop?category=5"><img src="../assets/img/pants.PNG" class="slider_image" /></a></li>
		<li class="slide slide6"><a href="${path}/item/list.shop?category=6"><img src="../assets/img/bag.PNG" class="slider_image" /></a></li>
		<li class="slide slide7"><a href="${path}/item/list.shop?category=7"><img src="../assets/img/shoes.PNG" class="slider_image" /></a></li>
		<li class="slide slide8"><a href="${path}/item/list.shop?category=8"><img src="../assets/img/watch.PNG" class="slider_image" /></a></li>
		<li class="slide slide1"><a href="${path}/item/list.shop?category=1"><img src="../assets/img/hat.PNG" class="slider_image" /></a></li>
		<!-- 여기까지 수정 -->
	</ul>

	<div id="slider-nav">
		<div id="slider-nav-dot-con">
			<!-- 이 부분을 자신의 상황에 맞게 수정 -->
			<!-- 복사본을 제외한 슬라이드 개수가 5개라면 span은 5개-->
			<!-- id는 반드시 nav-dot1 부터 시작해서 nva-dot2 nav-dot3 ... nav-dot5와 같은 형태로 작성해야 함 -->
			<span class="slider-nav-dot" style="background:white" id="nav-dot1"></span>
			<span class="slider-nav-dot" id="nav-dot2"></span>
			<span class="slider-nav-dot" id="nav-dot3"></span>
			<span class="slider-nav-dot" id="nav-dot4"></span>
			<span class="slider-nav-dot" id="nav-dot5"></span>
			<span class="slider-nav-dot" id="nav-dot6"></span>
			<span class="slider-nav-dot" id="nav-dot7"></span>
			<span class="slider-nav-dot" id="nav-dot8"></span>
			<!-- 여기까지 수정 -->
		</div>
</div>
</div>
</div>
<div class="mainbox Ranking">
	<div class="boxtitle">인기 상품</div>
	<div class="boxitemlist">
		<c:forEach items="${rankItems}" var="rank">
			<div class="boxitem">
			<a href="${path}/item/detail.shop?item_no= ${rank.item_no}"><img src="img/${rank.pictureUrl}" width="290px" height="270px" ></a>
				<div class="itembrand">${rank.name}</div>
				<div class="itemsubject">${rank.item_name}</div>
				<div class="itemprice"><fmt:formatNumber value="${rank.price}" pattern="###,###,###"/>원</div>
			</div>
		</c:forEach>
	</div>
	<!-- <div class="boxbutton">
		<button class="btn" onclick="location.href='rank.shop'">더보기 ></button>
	</div>  -->
</div>
<!-- 
<div class="mainbox Keyword">
	<div class="boxtitle">실시간 인기 키워드</div>
	<div class="keywordRanking">
			<button class="tab-list" onclick="javascript:getItems()">지갑</button>
			<button class="tab-list" onclick="javascript:getItems()">지갑</button>
			<button class="tab-list" onclick="javascript:getItems()">지갑</button>
			<button class="tab-list" onclick="javascript:getItems()">지갑</button>
			<button class="tab-list" onclick="javascript:getItems()">지갑</button>
	</div>
	<div class="boxitemlist">
		<c:forEach begin="1" end="4">
			<div class="boxitem">
				<img src="#" width="290px" height="270px" >
				<div class="itembrand">브랜드명</div>
				<div class="itemsubject">상품명</div>
				<div class="itemprice">상품가격</div>
			</div>
		</c:forEach>
	</div>
	<div class="boxbutton">
		<button class="btn" onclick="location.href='rank.shop'">더보기 ></button>
	</div>
</div> -->
<div class="mainbox Newitem">
	<div class="boxtitle">최신 상품</div>
	<div class="boxitemlist">
	<c:forEach items="${newItems}" var="newi">
			<div class="boxitem">
				<a href="${path}/item/detail.shop?item_no= ${newi.item_no}"><img src="img/${newi.pictureUrl}" width="290px" height="270px" ></a>
				<div class="itembrand">${newi.name}</div>
				<div class="itemsubject">${newi.item_name}</div>
				<div class="itemprice"><fmt:formatNumber value="${newi.price}" pattern="###,###,###"/>원</div>
			</div>
		</c:forEach>
	</div>
	<!-- <div class="boxbutton">
		<button class="btn" onclick="location.href='rank.shop'">더보기 ></button>
	</div>  -->
</div>
</body>
</html>