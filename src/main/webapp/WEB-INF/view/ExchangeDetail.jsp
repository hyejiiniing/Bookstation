<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<!--============================================================-->
<link rel="stylesheet" type="text/css" href="css/ExchangeDetail.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title></title> 
</head>



<body class="animsition">
	
	<!-- top -->
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
	<section class="bg0 p-t-16 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2">
					<div class="p-r-45 p-r-0-lg">
							

						<!-- 여기부터 본문 -->
						<div class="con">
							<div class="title">
								<h3>주문/배송 상세</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
							<c:forEach items="${mergedList}" var="order">				
								<ol class="breadcrumb">
									<li class="breadcrumb-item active" aria-current="page">${order.ordersPrint_date})</li>
									<li class="breadcrumb-item">주문번호 : ${order.order_id}</li>
								</ol>
							
							</c:forEach>
							</div>
						</div>
						
						<!-- 상품 정보 -->
						<div class="table-responsive orderlist">
							<h3 class="green-text">상품 정보</h3><hr>
							<table class="table table-bordered">
								<thead>
								<tr>
									<th>상품명</th>
									<th>수량</th>
									<th>판매가</th>
									<th>적립금</th>
									<th>상태</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${mergedList}" var="order">
								<tr>
									<td></td> <!-- 이 부분 상품명 올바른 루트로 변경 필요  -->
									<td>${order.ordersPrint_count}</td>
									<td>${order.ordersPrint_price}</td>
									<td>${order.savePoint}</td>
									<td>${order.ordersPrint_state}</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
						<br><br>

						<div class="table-responsive orderlist">
							<h3 class="green-text">결제 정보</h3>
							<div class="text-right">
							<!-- <button class="btn btn-info btn-sm text-right" 
											onclick="#">반품,교환,취소 신청</button> -->
							</div>
							<hr>
							<!-- 결제정보 -->
							<table class="table table-bordered "> 							
								<thead>
								<tr>
									<th>주문금액</th>
									<th>사용한 포인트</th>
									<th>적립한 포인트</th>
									<th>총 결제금액</th>
									<th>결제수단/은행</th>
								</tr>

								</thead>
			
								<c:forEach items="${mergedList}" var="order">
								<tbody>
 								<tr>
 									<td>${order.ordersPrint_price}</td>
									<td>${order.usePoint}</td>
									<td>${order.savePoint}</td>
									<td>${order.totalPrice}</td>
									<td>${order.payOption1}/${order.payOption2}</td>
								</tr>
								</tbody>
								</c:forEach>		
							</table>
							<br><br>
						</div>



						<!-- 배송 정보 테이블 -->
						<div class="table-responsive orderlist">
						    <h3 class="green-text">배송 정보</h3>
						    <hr>
						    <table class="table table-bordered">
						        <thead>
						        <c:forEach items="${mergedList}" var="order">
						        <tr>
						            <th>수령인</th>
						            <td style="background-color: white;">${order.shipping_name}</td>
						            <th>휴대전화</th>
						            <td style="background-color: white;">${order.shipping_phone}</td>
						            <th>택배방법</th>
						            <td style="background-color: white;">${order.shippingOption1}</td>
						        </tr>
						        </c:forEach>
						        </thead>
						        <tbody>
								<tr style="background-color: #cccccc;">
						            <th >주소</th>
						            <td colspan="5" style="background-color: white; text-align: left;">${order.shippingAddr2}</td>
						        </tr>
								<tr style="background-color: #f0f0f0;">
						            <th>요청사항</th>
						            <td colspan="5" style="background-color: white; text-align: left;">${order.shippingOption2}</td>
						        </tr>
						        </tbody>
						    </table>
						</div>


						<div class="container">
											
						  
							<!-- 주문 목록 -->
							<div class="table-container">
								
								<!-- 버튼   -->
								<div class="container mt-5">
									<div class="row justify-content-center">
									  <div class="col-md-2">
			<!-- history.back() 함수를 사용하여 이전 페이지로 이동되면서 페이지가 다른 곳으로 이동하거나 새로고침 하지 않게 한다-->
            		<a class="btn btn-primary" href="javascript:void(0);" onclick="history.back();">확인</a>

									  </div>
									</div>
								  </div>
							  </div>
						  </div>
							<div class="con">
						</div>
					</div>
				</div> 
				<!-- 본문 수정 -->

				<!-- 사이드바 수정 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- 사이드바 -->
			</div>
		</div>
	</section>	
	
<jsp:include page="bottom.jsp" flush="false"/>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- 작성한 js 파일로 이동 -->
    <script src="RefundWrite_Button.js"></script> 
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