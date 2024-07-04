<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>개인정보 수정</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 템플릿과 bootstrap 사용을 위한 코드 -->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/mp_myinfo.css">
<!--===============================================================================================-->

<!-- 사이드바 css -->
	<link rel="stylesheet" type="text/css" href="css/mypage.css">
<!--===============================================================================================-->
	<style>
	.mp_table input {
		/* 회원 정보 수정 본문 input 페이지에만 테두리 */
		border: 1px solid gray;
		border-radius: 2px;
		padding: 2px 3px;
	}
	</style>
</head>
<body class="animsition">
	<!-- top -->
	<div style="height:124px">
		<jsp:include page="top.jsp" flush="false" />
	</div>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="myPage.jsp" class="stext-109 cl8 hov-cl1 trans-04">
				MyPage
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				회원정보 수정
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
						<!-- 회원정보 -->
						<form action="userInfoChange.do" method="post">
							<div class="con">
								<div class="title">
									<h3>MyPage</h3>
									<hr style="border: 1px solid black;">
								</div>
								<div class="title">
									<h3>회원정보</h3>
								</div>
								<table class="mp_table type01">
									<colgroup>
										<col width="200">
										<col width="250">
										<col width="200">
										<col width="350">
									</colgroup>
									<tbody>
										<tr>
											<th class="normal">아이디</th>
											<td colspan="3" class="p10">
												<span>${member.member_id}</span>
											</td>
										</tr>
										<tr>
											<th class="normal">비밀번호 변경</th>
											<td colspan="3" class="p10">
												<div class="passwd">
													<input type="password" name="" id="nowPwd" placeholder="현재 비밀번호">
													<input type="password" name="member_password" id="newPwd" placeholder="새 비밀번호">
													<input type="password" id="newPwdCheck" placeholder="새 비밀번호 확인">
													<button id="passwordChangeButton" class="button" style="margin: 0;">변경하기</button>
												</div>
											</td>
										</tr>
										<tr>
											<th class="normal">이름</th>
											<td colspan="3" class="p10">
												<span id="userName">${member.member_name}</span>
												<input type="text" name="member_name" id="nameInput" style="display: none;">
											</td>
										</tr>
										<tr>
											<th class="normal">성별</th>
											<td colspan="3" class="p10">${member.member_gender}</td>
										</tr>
										<tr>
											<th class="normal">생년월일</th>
											<td colspan="3" class="p10">
												<span id="userBirth">${member.member_birthday}</span>
												<input type="text" name="" id="birthInput" style="display: none;" oninput="formatDate(this)">
											</td>
										</tr>
										<tr>
											<th class="normal">이메일</th>
											<td colspan="3" class="p10">
												<span id="userEmail">${member.member_email}</span>
												<input type="text" name="member_email" id="emailInput" style="display: none;">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<!-- 기본 배송정보 -->
							<div class="con">
								<div class="title">
									<h3>기본 배송정보</h3>
								</div>
								<table class="mp_table type01">
									<colgroup>
										<col width="200">
										<col width="250">
										<col width="200">
										<col width="350">
									</colgroup>
									<tbody>
										<tr>
											<th class="normal">주소</th>
											<td colspan="3" class="p10">
												<div class="shipping">
													<span id="userAddr1" class="ss">${member.member_zipcode}</span>
													<span id="userAddr2" class="ss">${member.member_address1}</span>
													<span id="userAddr3">${member.member_address2}</span>
												</div>
												<div class="addr" style="display: none;">
													<div id="addrDiv">
														<input type="text" name="member_zipcode" id="addrInput1" size="9">
														<input type="button" value="우편번호" class="button" style="margin: 0;" onclick="sample6_execDaumPostcode()">
													</div>
													<input type="text" name="member_address1" id="addrInput2" size="23"><br>
													<input type="text" name="member_address2" id="addrInput3" size="23">
												</div>
											</td>
										</tr>
										<tr>
											<th class="normal">전화번호</th>
											<td colspan="3" class="p10">
												<span id="userPhone">${member.member_phone}</span>
												<input type="text" name="member_phone" id="phone" style="display: none;" oninput="numberphone(this)">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="button-container">
									<button class="button" id="editButton">수정하기</button>
									<button type="submit" class="button" id="saveButton" style="display: none;">저장</button>
									<button class="opposite-button" id="cancelButton" style="display: none;">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 본문 수정 -->

				<!-- 사이드바 수정 -->
				<jsp:include page="sidebar.jsp" flush="false" />
				<!-- 사이드바 -->
			</div>
		</div>
	</section>	
	
	<!-- bottom -->
    <jsp:include page="bottom.jsp" flush="false" />

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!-- 템플릿과 bootstrap, jQuery 사용을 위한 코드 -->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	//우편번호 검색
	function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('addrInput1').value = data.zonecode;
	            document.getElementById('addrInput2').value = addr;
	            // 상세주소 입력란에 포커스 설정
	            document.getElementById('addrInput3').focus();
	        }
	    }).open();
	}
	</script>
<!--===============================================================================================-->
	<script>
		$(document).ready(function() {
		  // 수정하기 버튼을 클릭했을 때
		  $('#editButton').click(function() {
			// 폼 제출을 막아주는 코드, 저장버튼 눌렀을 때만 제출하기 위해 사용
			event.preventDefault();
			
			// 원래 정보를 가져와서 텍스트 박스에 표시
			var originalName = $('#userName').text();
			var originalEmail = $('#userEmail').text();
			var originalAddr1 = $('#userAddr1').text();
			var originalAddr2 = $('#userAddr2').text();
			var originalAddr3 = $('#userAddr3').text();
			var originalPhone = $('#userPhone').text();
			$('#nameInput').val(originalName);
			$('#emailInput').val(originalEmail);
			$('#addrInput1').val(originalAddr1);
			$('#addrInput2').val(originalAddr2);
			$('#addrInput3').val(originalAddr3);
			$('#phone').val(originalPhone);
			
			// 정보 보여주기 요소 숨기기
			$('#userName, #userEmail, .shipping, #userPhone').hide();
			// 입력 필드 보여주기
			$('#nameInput, #emailInput, .addr, #phone').show();
			// 수정 버튼 숨기기, 저장 및 취소 버튼 보이기
			$('#editButton').hide();
			$('#saveButton, #cancelButton').show();
		  });
	  
		  // 취소 버튼을 클릭했을 때
		  $('#cancelButton').click(function() {

			// 폼 제출을 막아주는 코드, 저장버튼 눌렀을 때만 제출하기 위해 사용
			event.preventDefault();

			// 입력 필드 숨기기
			$('#nameInput, #emailInput, .addr, #phone').hide();
			// 정보 보여주기 요소 보이기
			$('#userName, #userEmail, .shipping, #userPhone').show();
			// 저장 및 취소 버튼 숨기기, 수정 버튼 보이기
			$('#saveButton, #cancelButton').hide();
			$('#editButton').show();
		  });
	  
		  // 저장 버튼을 클릭했을 때
		  $('#saveButton').click(function() {

			// 폼 제출시 변경내용 적용은 백엔드에서 구현
			/* event.preventDefault(); */
			
			// 입력된 정보 가져오기
			var newName = $('#nameInput').val();
			var newEmail = $('#emailInput').val();
			var newAddr1 = $('#addrInput1').val();
			var newAddr2 = $('#addrInput2').val();
			var newAddr3 = $('#addrInput3').val();
			var newPhone = $('#phone').val();
			// 정보 보여주는 요소에 반영
			$('#userName').text(newName);
			$('#userEmail').text(newEmail);
			$('#userAddr1').text(newAddr1);
			$('#userAddr2').text(newAddr2);
			$('#userAddr3').text(newAddr3);
			$('#userPhone').text(newPhone);
			
			// 입력 필드 숨기기
			$('#nameInput, #emailInput, .addr, #phone').hide();
			// 정보 보여주기 요소 보이기
			$('#userName, #userEmail, .shipping, #userPhone').show();
			// 저장 및 취소 버튼 숨기기, 수정 버튼 보이기
			$('#saveButton, #cancelButton').hide();
			$('#editButton').show();
		  });
		});		
	  </script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!-- 유효성검사를 위한 js -->
	<script src="js/validation.js"></script>
<!-- 우편번호 검색 API -->	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--===============================================================================================-->
</body>
</html>