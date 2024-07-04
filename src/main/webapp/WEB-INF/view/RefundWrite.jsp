<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- 신청완료 버튼을 누르면 뒤로가기 -->
<script>
    function goBack() {
        window.history.back();
    }
</script>

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
<!-- ======================================== -->
<link rel="stylesheet" type="text/css" href="css/RefundWrite.css">
<title></title> 
</head>


<!--  신청완료 버튼을 누르면 해당 데이터들을 오라클로 넘기는 함수 (검토필요) -->
<script>
    function submitSelectedItems() {
        var selectedItems = [];
        var checkboxes = document.getElementsByName('selectedItem');
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                selectedItems.push(checkbox.value);
            }
        });

        // 선택된 데이터를 서버로 전송하는 AJAX 요청
        var xhr = new XMLHttpRequest();
        //오라클에 URL경로 넣기 
        xhr.open('POST', 'url 경로 넣기 ', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert('신청이 완료되었습니다.');
                } else {
                    alert('오류가 발생했습니다. 다시 시도해주세요.');
                }
            }
        };
        xhr.send(JSON.stringify(selectedItems));
    }
</script>



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
						<div class="wrap-pic-w how-pos5-parent">
						</div>

						<!-- 여기부터 시작 -->
						<div class="con">
							<div class="title">
								<h3>주문/배송 취소 조회 상세</h3>
								<hr style="border: 1px solid black;">
							</div>
							<div class="title">
								<h4>주문/배송 취소 안내</h4>
							</div>
							<table class="mp_table type01">
								<colgroup>
									<col width="200">
									<col width="250">
									<col width="200">
									<col width="350">
								</colgroup>
								<tbody>
										<!--이 부분에 넣기 -->
										
							</table>
						</div>
						<!-- 본문 ===== -->


						<div id="goodsSearch" style="font-size: 14px;">
							<div class="goodsSearch_top">
								북스테이션에서 구입한 상품에 이상이 있거나, <br> 
								잘못 배달된 경우 어떠한 상황에도 책임을 지고 교환 및 환불이 가능합니다.<br>
								<span>( 단 휴일에는 모든 교환 및 환불처리가 되지 않습니다. )</span>
							</div>

							<h3 class="basket"><strong>취소안내</strong></h3>
							<div class="des">
								주문 후 입금대기, 주문완료 상태에서는 직접 취소가 가능합니다.<br>
								(배송조회 -&gt; 주문번호 선택 -&gt; 상품정보 확인 후 취소할 수 있습니다.)<br><br>
								직접 취소가 불가능한 경우 고객센터로 연락해 주시기 바랍니다.<br>
								(고객센터 근무시간 - 평일 09:00 ~ 18:00)<br><br>
								상품의 재고유무에 따라 주문 후 바로 출고가 되는 경우 취소가 불가능 할 수 있습니다.<br>
								상품 출고 이후에는 반품으로 처리가 진행되며, 반송에 따른 배송비 부담이 있을 수 있습니다.<br><br>
								
								<strong>도서의 품/절판이 확인되는 경우,</strong> 아래의 절차에 따라 주문 취소가 진행됩니다.<br>
								1. 주문상품 품/절판 확인일: 주문도서 품/절판에 따른 취소 안내<br>			
								2. 2차 안내: 취소 지연건 대상으로 일주일 이내 취소요청 미접수 시 직권취소 재차 안내<br>			
								3. 고객센터 직권취소: 2차 안내 후 7일 이내 취소진행 예정					
							</div>

							<h3 class="basket">파본이거나 잘못 배달된 국내서적의 교환</h3>
							<div class="des">파본, 낙장, 인쇄불량 등의 상품에 문제가 있거나, 잘못 배달된 상품의 경우 고객센터로 연락을 주시면 회수진행됩니다.<br> 회수비용은 당사에서 부담합니다.<br></div>
							<h3 class="basket">하자없는 상품의 반송</h3>
							<div class="des"> 원칙적으로 반송이 가능합니다.<br>
								다만, <strong>반송에 따른 택배료는 고객님께서 부담</strong>해 주셔야 합니다.<br>
								주문하신 <strong>모든 도서를 반송하실 경우, <span class="blue">왕복 택배료&nbsp; 5,000원</span>을, <br>
								부분 반품을 하실 경우에는 <span class="blue">편도 택배료 2,500원</span>을 부담</strong>해 주셔야 합니다. <br>
								(단, 부분 반품이라도 반품 제외 잔여 주문 도서금액이 &nbsp;10,000원 미만일 경우엔&nbsp;5,000원 입니다)<br>
								<strong><span class="blue">* 지정 택배사가 아닌 다른 택배사를 통해 전체 반품시,<br>
									선불로 보내는 경우라도 저희쪽에서 발송해 드렸던 비용 2,500원은 주문하신 분의 부담입니다.</span></strong>
								<br>
								<br>
								또한 다른 상품과는 달리 도서는 그 속에 담겨있는 정보에 가치가 있기 때문에 단기간에 필독이 가능한 도서는 교환 혹은 환불이 불가능합니다.<br>
								<span>☞ 환불 불가능 도서 : 문제지, 수험서, 만화, 시집, 요리책, 지도, 잡지, 사진집, 여행관련 도서 등<br>
								 ☞ 특히, 자격증관련 수험서,특정 업체를 위한 문제집, 인적성검사 관련 수험서류는 반품, 교환이 절대 불가능합니다-</span>
								<br>
								<br>
								<span class="blue" style="font-weight:bold;">1. 도서를 수령 후 반품요청 -&gt;고객센터나 이메일로 반품접수</span> <br>
								2. 잡지, 소프트웨어 등 비닐포장이 된 도서는 미개봉된 상태로 반품하셔야 환불을 받으실 수 있습니다.<br>
								3. 도서 수령일 기준 7일 이내에 접수<br>
								4. 도서의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 도서를 공급받은 날부터 3개월 이내, <br>
								그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다. <br>
								5. 반품접수건은 회수기사님이 방문 하십니다. <br>
								6. 해외에서  주문하신 도서는 반품이 불가하기 때문에, 파본도서를 제외하고 반품, 교환 등이 되지 않습니다.<br>
								<br>
								<strong>☞  온라인물류센터 : <span class="blue">(99999) 서울시 강남구 어딘가 </span></strong>
							</div><br>
							<h3 class="basket">고객님의 과실로 상품을 전달 받지 못하고 북스테이션으로 반송후 재발송 요구시</h3>
							<div class="des">고객님께서 <strong><span class="blue">수령 주소, 전화번호를 잘못 표기 하거나 3일간 상품 인수자가
								없어</span></strong> 북스테이션으로 반송이 된 경우 택배료는 구매금액과 관계없이 주문하신&nbsp;고객님께서 부담해 주셔야 합니다. 
								만약 재출고를&nbsp;요청하실 경우 왕복 택배료 5,000원을&nbsp;별도 입금해 주셔야 하고, 환불을&nbsp; 원하실 경우 5,000원을 제외한 상품대금을 환불해 드립니다. 
							</div>
							<br>
							<dl class="first">
								<dt>1.교환</dt>
								<dd>수령하신 도서가 파본일 경우 동일도서로의 교환은 가능하나 타도서로의 교환은 불가합니다.(반품 접수 후 재주문)</dd>
							</dl>
							<dl>
								<dt>2.반품</dt>
								<dd>먼저, 수령하신 매장에서 도서를 반품해 주시면 확인후 결제건을 취소해드립니다.
								<br>
								<strong>(단, 잡지/만화/수험서/문제집 등의 교환, 반품이 불가한 도서가 있음을 양해해주시기 바랍니다.)</strong></dd>
							</dl>
							<h3 class="basket">해외도서의 취소/교환/환불</h3>
							<div class="des">
							해외도서는 해외거래처의 상황에 따라 품절/지연될 수 있으며, 이 경우 주문진행 여부에 대하여 안내해드립니다.<br><strong><span class="blue">(주문진행 여부 안내 시 진행 요청하시면 요청 후 취소 및 단순변심에 의한 교환/환불 불가)</span></strong><br>
							해외도서는 고객님의 요청에 의해 주문이 진행되기 때문에 도서수급 중 취소 및 단순변심에 의한 교환/반품은 불가합니다.<br>
							(파본 및 오배송에 의한 교환/반품은 가능)<br>
							<strong><span class="blue">도서수급 중 취소 및 단순변심에 의한 교환/반품 시 도서판매가의 20%에 해당하는 수수료가 부과되오니 주문 시 유의해 주시기 바랍니다.</span></strong><br>
							(수수료 제외 후 환불)
							</div>
							<h3 class="basket">결제대금 환불방법</h3>
							<dl class="first">
								<dt>신용카드나 휴대폰 소액 결제</dt>
								<dd>전체 취소나 전체 반품일 경우 승인 금액이 청구되지 않도록 승인 취소를 요청해 드립니다.
								 <br>부분 취소나 부분 반품일 경우 예치금으로 전환 또는 <strong>*은행계좌</strong>로 환불해 드립니다 <br>휴대폰 결제건 중 이미 청구가 된 경우에는 예치금으로 전환 또는 환불해 드립니다. </dd>
							</dl>
							<dl>
								<dt>무통장 입금 결제 </dt>
								<dd>무통장 입금으로 결제하신 경우 예치금으로 전환 또는 <strong>*은행계좌</strong>로 환불해 드립니다. </dd>
								<strong style="display: block; margin-bottom: 20px;">* 은행계좌로 환불시 유선이나 메일로 계좌정보를 알려주셔야 환불 등록이 됩니다.</strong>
							</dl>
						</div>
							<hr>

						<div class="container">
							<!-- 안내문 -->
							<div class="box">
							  <h2>주문/배송 안내</h2>
							  <br>
							  <p>- 입금 대기 상태나 주문완료(결제완료) 상태에서는 직접 주문을 <strong>취소</strong>하실 수 있습니다.</p>
							  <p style="color: #fe0000; font-weight: bold;">- 이미 발송된 상태라면 배송지를 변경하실 수 없습니다.</p>
							</div>
						  
							<!-- 기간별 조회 -->
							<div class="box gray-box">
								<div style="display: inline-block;">
								  <h3 style="display: inline; margin-right: 30px; margin-bottom: 22px;">기간별 조회</h3>
								  
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
								style="margin-top:-11px; margin-left: 20px;">검색</button>
							  </div>
							</div>
						  
							<!-- 주문 목록 -->
							<div class="table-container orderlist">
								<table>
								  <thead>
									<tr>
									  <th></th>
									  <th>주문일</th>
									  <th>주문번호</th>
									  <th style="width: 200px;">상품명</th>
									  <th>주문금액</th>
									  <th>주문상태</th>
									  <th>신청사유</th>
									</tr>
								  </thead>
								  <tbody>
								  <c:forEach items="${list1}" var="order">
									<tr>
									  <td class="checkbox-cell"><input type="checkbox"></td>
									  <td> ${order.savePoint}2</td>
									  <td> ${order.savePoint}3</td>
									  <td> ${order.savePoint}4</td>
									  <td> ${order.savePoint}5</td>
									  <td> ${order.savePoint}6</td>
									  <td>
										<select name="reason">
										  <option value="1">단순 변심</option>
										  <option value="2">수량을 잘못 선택</option>
										  <option value="3">파손</option>
										  <option value="4">기타</option>
										</select>
									  </td>
									</tr>
									</c:forEach>
								  </tbody>
								</table>
								<!-- 버튼   -->
								<div class="container mt-5">
									<div class="row justify-content-center">
									  <div class="col-md-2">
					<button type="button" id="submitButton" class="btn btn-success btn-block" onclick="goBack()">신청완료</button>
									  </div>
									</div>
								  </div>
							  </div>
						  </div>
						  <script>
							function showMessage() {
							  alert("신청 완료 되었습니다.");
							}
						  </script>	
						  		<!-- 페이징 처리  -->
						  <div class="flex-c-m flex-w w-full p-t-38">
								${pagingHtml}
							</div>



						</div>
						<!-- 반품/교환/취소 -->
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
    <script src="js/AllOrderList_Button.js"></script> 

</body>
</html>