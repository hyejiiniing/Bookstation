	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.member.domain.*, java.util.List, java.util.ArrayList" %>
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
	<!--===============================================================================================-->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/AllOrderList.css">
	
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
	
							<br><br>
	
							<div class="table-responsive">
								<h3 class="green-text">전체 주문내역</h3>
								<div class="text-right">
								<!-- <button class="btn btn-info btn-sm text-right" 
												onclick="#">반품,교환,취소 신청</button> -->
								</div>
								<hr>
								<br>
								<br>
								<div class="box gray-box">
									<div style="display: inline-block;">
									  <h4 style="display: inline; margin-right: 30px; margin-bottom: 22px;">기간별 조회</h4>
									  
									  <button type="button" id="oneDayBtn" class="btn btn-info" style="display: inline-block;">하루</button>
									  <button type="button" id="oneWeekBtn" class="btn btn-primary" style="display: inline-block;">일주일</button>
									  <button type="button" id="oneMonthBtn" class="btn btn-success" style="display: inline-block;">1개월</button>
									  <button type="button" id="threeMonthsBtn" class="btn btn-warning" style="display: inline-block;">3개월</button>
									</div>
								  
								  <br><br>
								  <!-- 주문별 일자 조회 -->
								  <h3>주문별 일자 조회</h3> <br>
								  <div class="form-container">
									<label for="fromDate">From:</label>
									<input type="date" id="fromDate">
									<label for="toDate">To:</label>
									<input type="date" id="toDate">
									<button type="button" class="btn btn-success" id="searchBtn" 
									style="margin-top:-11px;margin-left: 20px;">검색</button>
								  </div>
								</div>
								<br><br>
								
							</div>
	
							<!-- 주문내역 조회 페이지 -->
							
									<!-- 주문목록-->
	
							<div class="container orderlist">
								<table>
									<thead>
									  <tr>
										<th>주문일</th>
										<th>주문상태</th>
										<th style="width: 200px;">상품명</th>
										<th>주문금액</th>
										<th>주문번호</th>
									  </tr>
									</thead>
									<tbody>
									<c:forEach items="${list1}" var="order">
										<tr>
												<td> ${order.orderDate}</td>
												<td> ${order.orderState}</td>
												<td> ${order.savePoint}</td>
												<td> <a href="RefundWrite.do"> ${order.totalPrice}</a></td>
												<td> <a href="ExchangeDetail.do">${order.order_id}</a></td>
											  </tr>
<%-- 										<c:if test="${order instanseof list<com.member.domain.OrderVO>}">
											  <tr>
												<td> ${order.orderDate}</td>
												<td> ${order.orderState}</td>
												<td> ${order.savePoint}</td>
												<td> <a href="RefundWrite.do"> ${order.totalPrice}</a></td>
												<td> <a href="ExchangeDetail.do">${order.order_id}</a></td>
											  </tr>
										</c:if> --%>
	<%-- 							<c:if test="${order instanseof List<OrdersPrintVO>}">
										</c:if>
										<c:if test="${order instanseof List<shippingVO>}">
										</c:if> --%>
	<%-- 								  <tr>
										<td> ${order.orderDate}</td>
										<td> ${order.orderState}</td>
										<td> ${order.savePoint}</td>
										<td> <a href="RefundWrite.do"> ${order.totalPrice}</a></td>
										<td> <a href="ExchangeDetail.do">${order.order_id}</a></td>
									  </tr> --%>
									</c:forEach>
									</tbody>
								  </table>	
							  
								<!-- 주문 목록 -->
								<div class="table-container">
									
									<!-- 버튼   -->
									<div class="container mt-5">
										<div class="row justify-content-center">
										  <div class="col-md-2">
											<!-- <a class="btn btn-primary" href="AllOrderList.jsp">확인</a> -->
										  </div>
										</div>
									  </div>
								  </div>
							  </div>
								<div class="flex-c-m flex-w w-full p-t-38">
								${pagingHtml}
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
		
	
	
	
	
	
	<!-- <!--  --> -->
	
	
	
	
	<!--===============================================================================================-->	
		<!--  <	 src="vendor/jquery/jquery-3.2.1.min.js"></script>-->
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
	    <script src="js/AllOrderList_Button.js"></script> 
	</body>
	</html>