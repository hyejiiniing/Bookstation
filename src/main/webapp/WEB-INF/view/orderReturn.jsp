<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MyPage.html</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
	<link rel="stylesheet" type="text/css" href="css/board.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="blog.html" class="stext-109 cl8 hov-cl1 trans-04">
				Blog
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				8 Inspiring Ways to Wear Dresses in the Winter
			</span>
		</div>
	</div>


	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2" style="margin-top:15px;">
					<div class="p-r-45 p-r-0-lg">
						<div class="wrap-pic-w how-pos5-parent">
							<!-- <img src="images/blog-04.jpg" alt="IMG-BLOG">
								<div class="flex-col-c-m size-123 bg9 how-pos5">
									<span class="ltext-107 cl2 txt-center">
										22
									</span>
									<span class="stext-109 cl3 txt-center">
										Jan 2018
									</span>
								</div> -->
						</div>
							
						<!-- 내정보 -->
						<div class="con">
							<div class="title" style="font-size:20px; font-weight:bold;">
								반품/교환/취소 내역
								<hr style="border: 1px solid black;">
							</div>
							
						</div>

						<!-- 리뷰 -->
						<div class="con">
							<div class="title" style="text-align:center;">
								
							</div>
							<table class="mp_table type01">
								<colgroup>
									<col width="150">
									<col width="50">
									<col width="150">
									<col width="250">
									<col width="100">
									<col width="150">
									<col width="150">
								</colgroup>
								<tbody>
									<tr>
										<th>접수일</th>
										<th>구분</th>
										<th>원주문번호</th>
										<th>상품명</th>
										<th>수량</th>
										<th>처리상태</th>
										<th>변경/취소</th>
									</tr>
									<tr>
										<td class="center bLine">2024.05.09</td>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine" style="color:#da4445;">33333</td>
										<td class="center bLine">벌거벗은 한국사</td>
										<td class="center bLine">1</td>
										<td class="center bLine">진행중</td>
										<td class="center bLine">
											<button class="change">변경</button>
											<button class="cancel">취소</button>
										</td>
									</tr>
									<tr>
										<td class="center bLine">2024.05.09</td>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine" style="color:#da4445;">22222</td>
										<td class="center bLine">마당 깊은 집</td>
										<td class="center bLine">1</td>
										<td class="center bLine">진행중</td>
										<td class="center bLine">
											<button class="change">변경</button>
											<button class="cancel">취소</button>
										</td>
									</tr>
									<tr>
										<td class="center bLine">2024.05.09</td>
										<td class="center bLine"><a href="javascript:fOrderView(0);" class="blue">0</a></td>
										<td class="money center bLine" style="color:#da4445;">11111</td>
										<td class="center bLine">마당 깊은 집</td>
										<td class="center bLine">1</td>
										<td class="center bLine">취소</td>
										<td class="center bLine">
											<button class="change">변경</button>
											<button class="cancel">취소</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

		
					</div>
				</div>
				<!-- 본문 수정 -->

				<!-- 사이드바 수정 -->
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<!-- <div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div> -->

						<!-- 사이드바 수정 -->
						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								MyPage
							</h4>
							<ul>
								<!-- <li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										허정호 회원님
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
									</div>
								</li> -->

								<!-- 회원 -->
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										허정호 회원님
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 등급
												<span class="Rtxt">일반회원</span>
											</a>
											<a href="#" class="list-group-item list-group-item-action"> 적립금
												<span class="Rtxt"><strong class="orange" style="font-size:12px;">1,000</strong> 원</span>
											</a>
										</div>
									</div>
								</li>

								<!-- 회원정보 -->
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My Info
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 개인정보 수정</a>
											<a href="#" class="list-group-item list-group-item-action"> 회원탈퇴</a>
										</div>
									</div>
								</li>

								<!-- 주문 -->
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My Order
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 주문/배송 조회</a>
											<a href="#" class="list-group-item list-group-item-action"> 반품/교환/취소 조회</a>
										</div>
									</div>
								</li>

								<!-- 리뷰 -->
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My Review
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 리뷰 작성하기</a>
											<a href="#" class="list-group-item list-group-item-action"> 리뷰 내역보기</a>
										</div>
									</div>
								</li>

								<!-- 상담 -->
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										My QnA
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 1:1 상담접수</a>
											<a href="#" class="list-group-item list-group-item-action"> 1:1 상담내역</a>
										</div>
									</div>
								</li>

							</ul>
						</div>

						<!-- 고객센터 -->
						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33">
								Service
							</h4>
							<ul>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										고객상담전화
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
										</div>
									</div>
								</li>
								<li class="bor18">
									<a href="#" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4" style="font-size: 40px;">
										1577-1577
									</a>
									<div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
										<div class="list-group-collapse sub-men">
											<a href="#" class="list-group-item list-group-item-action"> 월 ~ 금 09:00 ~ 18:00</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- 사이드바 수정 -->

						<div class="p-t-50">
							<h4 class="mtext-112 cl2 p-b-27">
								Tags
							</h4>

							<div class="flex-w m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 사이드바 -->
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
	<div style="height:124px">
	<jsp:include page="bottom.jsp" flush="false" />
</div>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>