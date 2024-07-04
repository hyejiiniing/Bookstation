<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MyPage.jsp</title>
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
<style>
		/* 폰트 설정 */
		@font-face {
			font-family: 'SUITE-Regular';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
			font-weight: 500;
			font-style: normal;
		}
		* {font-family: 'SUITE-Regular';}
		/* 폰트 설정 */
		div, li, td, th, input, textarea, select {
		    font-size: 15px;
			font-family: 'SUITE-Regular';
		    line-height: 18px;
		    color: #505050;
		    text-align: left;
		  }
		  input, textarea, label {
		  display:inline;
		  }
</style>
<body>
	
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
	<section class="bg0  p-t-16  p-b-20 custom">
		<div class="container">
			<div class="row">
				<!-- 본문 수정 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2" style="margin-top:10px;">
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
							
						<!-- 탭메뉴 -->
						<div class="tabs" style="font-size:13px; border-bottom:1px solid black;">
							<button class="tab-link active" data-tab="reviews-to-write">작성 가능한 리뷰</button>
							<button class="tab-link" data-tab="written-reviews">작성한 리뷰</button>
						</div>
						  
						  <div id="reviews-to-write" class="content active">
							<div class="box gray-box" style="border:1px solid; margin:20px 0px 20px; padding:10px; background: #F3F4F8;">
								<div style="display: inline-block;">
								  <h3 style="display: inline; margin-right: 30px; margin-bottom: 22px;">기간별 조회</h3>
								  
									  		<form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="day">
								                <button type="submit" class="btn btn-info" style="display: inline-block;">하루</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="week">
								                <button type="submit" class="btn btn-primary" style="display: inline-block;">일주일</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="month">
								                <button type="submit" class="btn btn-success" style="display: inline-block;">1개월</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="3months">
								                <button type="submit" class="btn btn-warning" style="display: inline-block;">3개월</button>
								            </form>
								</div>
							  
							  <br><br>
							  <!-- 주문별 일자 조회 -->
							  <h3 style="padding-top:3px;">주문별 일자 조회</h3> <br>
							  <div class="form-container">
							  
							  		<form action="review.do" method="get">
								        <label for="fromDate" >From:</label>
								        <input type="date" id="fromDate" name="fromDate" style="margin-bottom:0px; ">
								        <label for="toDate">To:</label>
								        <input type="date" id="toDate" name="toDate" style="margin-bottom:0px;">
								        <button type="submit" class="btn btn-success" style="margin-top:0px; margin-left: 20px; margin-bottom:0px;">검색</button>
								    </form>
							  </div>
							</div>
						  
						  
							<table class="table">
							  <tr>
								<th>주문번호</th>
								<th>주문상품</th>
								<th>주문일자</th>
								<th>상태</th>
							  </tr>
							  
							  
	                        <c:forEach var="review" items="${notReviewedList}">

	                         <c:if test="${review.isReview==0}">
	                        <tr>
								 <td>${review.ordersPrint_id}</td>
								 <td>${review.isReview}</td>
								 <td>
				                        <fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" />
				                 </td>
								 <td>
								 <button class="action-button">
								 	<a href="reviewWrite.do?isReview=1">리뷰쓰기</a>
								 </button></td>
							 </tr>
							 </c:if>
	                        </c:forEach>
	                        
							  <!-- Add more rows as needed -->
							</table>
							
							
							<!-- Pagination -->
								<div class="flex-c-m flex-w w-full p-t-38">
								    ${pagingHtml} <!-- 페이징 HTML 출력 -->
								</div>
							
						  </div>
						  
						  <div id="written-reviews" class="content">
							<div class="box gray-box" style="border:1px solid; margin:20px 0px 20px; padding:10px; background: #F3F4F8;">
								<div style="display: inline-block;">
								  <h3 style="display: inline; margin-right: 30px; margin-bottom: 22px;">기간별 조회</h3>
								  		
								  			<form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="1">
								                <button type="submit" class="btn btn-info" style="display: inline-block;">하루</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="7">
								                <button type="submit" class="btn btn-primary" style="display: inline-block;">일주일</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="30">
								                <button type="submit" class="btn btn-success" style="display: inline-block;">1개월</button>
								            </form>
								            <form action="review.do" method="get" style="display: inline-block;">
								                <input type="hidden" name="filter" value="90">
								                <button type="submit" class="btn btn-warning" style="display: inline-block;">3개월</button>
								            </form>
								</div>
							  
							  <br><br>
							  <!-- 주문별 일자 조회 -->
							  <h3>주문별 일자 조회</h3> <br>
							  <div class="form-container">
							  
									  <form action="review.do" method="get">
								        <label for="fromDate">From:</label>
								        <input type="date" id="fromDate" name="fromDate" style="margin-bottom:0px;">
								        <label for="toDate">To:</label>
								        <input type="date" id="toDate" name="toDate" style="margin-bottom:0px;">
								        <button type="submit" class="btn btn-success" style="margin-top:0px; margin-left: 20px; margin-bottom:0px;">검색</button>
								    </form>
							  </div>
							</div>

							<table class="table">
							  <tr>
								<th>리뷰번호</th>
								<th>도서명</th>
								<th>작성일</th>
								<th>상태</th>
							  </tr>
							   <c:forEach var="written" items="${reviewedList}">
	                         	<c:if test="${written.isReview==1}">
								  <tr>
								    <td>${written.review_id }</td>
									<td>벌거벗은 한국사</td>
									<td>
				                        <fmt:formatDate value="${written.review_date}" pattern="yyyy-MM-dd" />
				                    </td>
									<td>
									<button class="action-button delete">
							            <a href="deletePro.do?review_id=${written.review_id}" onclick="return confirmDelete();">삭제</a>
							          </button>
										<button class="action-button"><a href="reviewDetail.do?review_id=${written.review_id}">조회</a></button>
									</td>
								  </tr>
								  <!-- Add more rows as needed -->
								  </c:if>
							  </c:forEach>
							</table>
							
							<!-- Pagination -->
								<div class="flex-c-m flex-w w-full p-t-38">
								    ${pagingHtml} <!-- 페이징 HTML 출력 -->
								</div>
							
						  </div>
						<!-- 반품/교환/취소 -->
					</div>
				</div>
				<!-- 본문 수정 -->

				<!-- 사이드바 수정 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- 사이드바 -->
				
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
	<!-- bottom -->
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
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	<script>
	function confirmDelete() {
	    return confirm("정말 삭제하시겠습니까?");
	  }
	</script>
	<script>
	const tabLinks = document.querySelectorAll('.tab-link');
	const contents = document.querySelectorAll('.content');

	  tabLinks.forEach(link => {
	    link.addEventListener('click', () => {
	      tabLinks.forEach(btn => btn.classList.remove('active'));
	      link.classList.add('active');

	      contents.forEach(content => content.classList.remove('active'));
	      document.getElementById(link.dataset.tab).classList.add('active');
	    });
	  });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<!-- <script src="js/tab.js"></script> -->

</body>
</html>