<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/header/main.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
	<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="${path}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${path}/assets/css/flaticon.css">
	<link rel="stylesheet" href="${path}/assets/css/slicknav.css">
	<link rel="stylesheet" href="${path}/assets/css/animate.min.css">
	<link rel="stylesheet" href="${path}/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${path}/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="${path}/assets/css/themify-icons.css?ver=1">
	<link rel="stylesheet" href="${path}/assets/css/slick.css">
	<link rel="stylesheet" href="${path}/assets/css/nice-select.css">
	<link rel="stylesheet" href="${path}/assets/css/style.css?ver=1.2">
	<link rel="stylesheet" href="${path}/assets/css/final.css?ver=1.1">
	<link rel="stylesheet" href="${path}/assets/css/admin.css">
	
	<title><decorator:title/></title>
	<decorator:head/>
	<c:if test="${fn:contains(path2,'board')}" >
		<%@ include file="/header/theader.jsp"%>
	</c:if>
</head>
<body>
<header>
	<!-- Header Start -->
	<div class="header-area">
		<div class="main-header ">
			
			<div class="header-top top-bg d-none d-lg-block">
				<div class="container-fluid">
					<div class="col-xl-12">
						<div class="row d-flex justify-content-between align-items-center">
							<div class="header-info-right">
								<ul>
								<li>
									<a href="../sns/main.shop?ksb=hot&type=1" style="font-weight:bold; font-size:18px;">#OOTD</a>
									<a href="../item/store.shop" style="font-weight:bold; font-size:18px;">STORE</a>
								</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="header-bottom  header-sticky">
				<div class="container-fluid">
					<div class="row align-items-center">
						<!-- Logo -->
						<div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
							<div class="logo">
								<a href="../sns/main.shop?ksb=hot&type=1"><img src="${path}/assets/img/logo/splogo5.jpg" alt=""></a> <!-- sns 인기글 -->
							</div>
						</div>
						<div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
							<!-- Main-menu -->
							<div class="main-menu f-right d-none d-lg-block">
								<nav>                                                
									<ul id="navigation">  
										<c:if test="${!fn:contains(path2,'sns')}" >
										<c:if test="${sessionScope.loginUser.userid.equals('admin') }">
										<li><a href="../admin/dashboard.shop">admin</a></li>
										</c:if>
										<li><a href="../item/store.shop">Home</a></li>
										<li><a href="../item/list.shop">스토어</a>
											<ul class="submenu">
												<li><a href="${path}/item/list.shop?category=1">모자</a></li>
												<li><a href="${path}/item/list.shop?category=2">아우터</a></li>
												<li><a href="${path}/item/list.shop?category=3">원피스</a></li>
												<li><a href="${path}/item/list.shop?category=4">상의</a></li>
												<li><a href="${path}/item/list.shop?category=5">하의</a></li>
												<li><a href="${path}/item/list.shop?category=6">가방</a></li>
												<li><a href="${path}/item/list.shop?category=7">신발</a></li>
												<li><a href="${path}/item/list.shop?category=8">시계</a></li>	
											</ul>
										</li>
										<li><a href="${path}/board/support.shop">고객센터</a>
											<ul class="submenu">
												<li><a href="${path}/board/notice.shop">공지사항</a></li>
												<li><a href="${path}/board/qna.shop">Q&A</a></li>
												<li><a href="${path}/board/faq.shop">FAQ</a></li>
											</ul>
										</li>
										</c:if>
										<c:if test="${fn:contains(path2,'sns')}" >
											<li class="hot"><a href="../sns/main.shop?ksb=hot&type=1">인기</a></li>
											<li><a href="../sns/main.shop?ksb=new&type=1">최신</a></li>
											<li><a href="../sns/main.shop?type=2">QnA</a>
										</c:if>
										<!-- 
										<li class="hot"><a href="#">Menu002</a></li> 핫 사용
										<li><a href="#">Menu003</a>
											<ul class="submenu">     		서브메뉴 사용
												<li><a href="#">SubMenu001</a></li>
											</ul>
                                        </li> -->
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        
						<div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
							<ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
								<li class="d-none d-xl-block">
									<div class="form-box f-right ">
									<form name="searchform">
										<input type="text" name="keyword" autocomplete="off" placeholder="검색">
										<div class="search-icon">
											<c:if test="${fn:contains(path2,'sns')}" >
												<i class="fas fa-search special-tag" onclick="javascript:listpage('sns')"></i>
											</c:if>
											<c:if test="${fn:contains(path2,'item')}" >
												<i class="fas fa-search special-tag" onclick="javascript:listpage('item')"></i>
											</c:if>
										</div>
									</form>
									<script type="text/javascript">
										function listpage(page) {
											var keyword = document.searchform.keyword.value;
											location.href="../"+page+"/searchResult.shop?keyword="+keyword;
										}
									</script>
								    </div>
								</li>
								<li>
									<div class="shopping-ard" style="font-size:30px;">
										<a href="${path }/cart/cartView.shop"><i class="fas fa-shopping-cart"></i></a>
									</div>
								</li>
									<!-- ~0812 <li class="d-none d-lg-block"> <a href="../user/login.shop" class="btn header-btn">로그인</a></li> -->
									<!-- 0813 seyeon 로그인 후 드롭다운 / 이미지 path 변경 요망 / 화면 크기 작아지면 동그라미 안보임-->
									<!-- 0818 c_hyeon 판매자가 아닐경우 등록 드롭다운 표시 -->
									<li class="d-none d-lg-block">
										<c:if test="${empty sessionScope.loginUser}">
											<a href="../user/login.shop" class="btn header-btn">로그인</a>
										</c:if>
										<c:if test="${!empty sessionScope.loginUser}">
											<div class="main-menu f-right d-none d-lg-block">
											    <nav>
												    <ul id="navigation">
													    <li>
													    	<div class="login_circle" style="background: none;">
													    		<c:if test="${!empty sessionScope.loginUser.imgurl}">
														   			<img class="profile_image" src="../user/file/${sessionScope.loginUser.imgurl}">
														   		</c:if>
														   		<c:if test="${empty sessionScope.loginUser.imgurl}">
														   			<img class="profile_image" src="../assets/img/user.svg">
														   		</c:if>
														   	</div>
															<ul class="submenu">
																<c:if test="${loginUser.userid.equals('admin')}"><li><a href="${path}/admin/dashboard.shop">관리자 페이지</a></li></c:if>
																<c:if test="${!loginUser.userid.equals('admin')}"><li><a href="${path}/sns/mypage.shop?userid=${sessionScope.loginUser.userid}">mypage</a></li></c:if>
																<c:if test="${loginUser.seller==0}"><li><a href="${path}/user/sellerEntry.shop?id=${sessionScope.loginUser.userid}">판매자 등록</a></c:if>
																<c:if test="${loginUser.seller==1}"><li><a href="${path}/user/sellerUpdate.shop?id=${sessionScope.loginUser.userid}">판매자 정보 수정</a></c:if>
																<li><a href="${path}/user/orderList.shop?id=${sessionScope.loginUser.userid}">주문내역</a></li>
																<li><a href="${path}/user/logout.shop">logout</a></li>
															</ul>
														</li>
													   </ul> 
												   </nav>
											</div>
										</c:if>
									</li>
								</ul>
						</div>
						
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End -->
</header>
<main>
    <div class="best-collection-area align-center">
        <div class="main-mapper" style="margin-top: 20px;">
        	<c:if test="${fn:contains(path2,'item/list')}" >
        		<div class="item-category">
        			<ul>
        				<li><a href="${path}/item/list.shop">전체</a></li>
        				<li><a href="${path}/item/list.shop?category=1">모자</a></li>
        				<li><a href="${path}/item/list.shop?category=2">아우터</a></li>
        				<li><a href="${path}/item/list.shop?category=3">원피스</a></li>
        				<li><a href="${path}/item/list.shop?category=4">상의</a></li>
        				<li><a href="${path}/item/list.shop?category=5">하의</a></li>
        				<li><a href="${path}/item/list.shop?category=6">가방</a></li>
        				<li><a href="${path}/item/list.shop?category=7">신발</a></li>
        				<li><a href="${path}/item/list.shop?category=8">시계</a></li>
        			</ul>
        		</div>
        	</c:if>
        	<decorator:body/>
        </div>
    </div>
</main>
<footer>
	<!-- Footer Start-->
	<div class="footer-area footer-padding">
		<div class="container">
			<!-- Footer bottom -->
			<div class="row">
				<div class="col-xl-7 col-lg-7 col-md-7">
					<div class="footer-copy-right">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						<p>
							Copyright &copy;
							<script>document.write(new Date().getFullYear());</script>
							All rights reserved
						</p>
					</div>
				</div>
				<div class="col-xl-5 col-lg-5 col-md-5">
					<div class="footer-copy-right f-right">
						<!-- social -->
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End-->
</footer>
	<!-- JS -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="${path}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="${path}/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${path}/assets/js/popper.min.js"></script>
	<script src="${path}/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="${path}/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="${path}/assets/js/owl.carousel.min.js"></script>
	<script src="${path}/assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="${path}/assets/js/wow.min.js"></script>
	<script src="${path}/assets/js/animated.headline.js"></script>
	<script src="${path}/assets/js/jquery.magnific-popup.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="${path}/assets/js/jquery.scrollUp.min.js"></script>
	<script src="${path}/assets/js/jquery.nice-select.min.js"></script>
	<script src="${path}/assets/js/jquery.sticky.js"></script>
        
	<!-- contact js -->
<c:if test="${!fn:contains(path2,'board')}" >
	<script src="${path}/assets/js/contact.js"></script>
</c:if>
	<script src="${path}/assets/js/jquery.form.js"></script>
	<script src="${path}/assets/js/jquery.validate.min.js"></script>
	<script src="${path}/assets/js/mail-script.js"></script>
	<script src="${path}/assets/js/jquery.ajaxchimp.min.js"></script>
        
	<!-- Jquery Plugins, main Jquery -->	
	<script src="${path}/assets/js/plugins.js"></script>
	<script src="${path}/assets/js/main.js"></script>
	<c:if test="${fn:contains(path2,'sns/main')}" >
		<c:if test="${param.type==1}">
			<button id="upload" onclick="location.href='../sns/write.shop'" style="position:fixed; margin-bottom:70px; font-size:xx-large;">+</button>
		</c:if>
		<c:if test="${param.type==2}">
			<button id="upload" onclick="location.href='../sns/qna.shop'" style="position:fixed; margin-bottom:70px; font-size:xx-large;">+</button>
		</c:if>
	</c:if>
	<c:if test="${fn:contains(path2,'board/faq') || fn:contains(path2,'board/qna') || fn:contains(path2,'board/notice')}" >
		<%@ include file="/header/tfooter.jsp"%>
	</c:if>
	<%@ include file="/header/socket.jsp"%>
</body>
</html>