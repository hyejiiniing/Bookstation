<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" type="text/css" href="css/qnaDetail.css">
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>질문상세내역보기</title>
<script>
	$(function(){
		
	})
</script>
</head>
<body class="animsition">
	
	<!-- header -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<a href="mypage.do" class="stext-109 cl8 hov-cl1 trans-04">
				My Page
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				QnA Detail
			</span>
		</div>
	</div>

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 본문 -->
				<div class="col-md-8 col-lg-9 p-b-80 order-md-2">
					<div class="p-r-45 p-r-0-lg">
						<div class="wrap-pic-w how-pos5-parent"></div>
						<!-- 문의내역 -->
						<div class="con">
							<div class="title">
								<h3>My Page</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h3>My QnA</h3>
								<a href="qna.do" class="btn type01">문의 내역보기 〉</a>
							</div>
							<table class="mp_table type01">
								<colgroup>
									<col width="150">
									<col width="250">
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="150">
								</colgroup>
								<tbody>
									<c:forEach var="qna" items="${qnaList }">
										<tr>
											<th class="normal">유형</th>
											<td class="p10">${qna.qna_type }</td>
											<th class="normal">등록일</th>
											<td class="p10">${qna.qna_date }</td>
											<th class="normal">처리상태</th>
											<td class="p10">${qna.qna_state }</td>
										</tr>
										<tr>
											<th class="normal">제목</th>
											<td colspan="5" class="p10">${qna.qna_title }</td>
										</tr>
										<tr height="200px">
											<th class="normal">내용</th>
											<td colspan="5" class="p10">${qna.qna_content }</td>
										</tr>
										<tr height="200px">
											<th class="normal">답변</th>
											<td colspan="5" class="p10" style="color:red;">아직 답변이 작성되지 않았습니다</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="button-container">
								<c:forEach var="qna" items="${qnaList }">
									<button class="button"><a href="qnaUpdate.do?qna_id=${qna.qna_id }" style="color: inherit;">수정하기</a></button>
									<button class="opposite-button" onclick="history.back()">취소</button>
								</c:forEach>
							</div>
						</div>
						<!-- /문의내역 -->
					</div>
				</div>
				<!-- /본문 -->
				
				<!-- 사이드바 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- /사이드바 -->
				
			</div>
		</div>
	</section>	
	
	<!-- Footer -->
	<jsp:include page="bottom.jsp"></jsp:include>
	<!-- /Footer -->

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