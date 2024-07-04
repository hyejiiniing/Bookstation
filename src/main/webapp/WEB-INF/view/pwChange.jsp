<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>비밀번호 재설정</title>
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
	<link rel="stylesheet" type="text/css" href="css/LogService.css">
<!--===============================================================================================-->

<!-- 유효성검사 메세지 css -->
	<link rel="stylesheet" type="text/css" href="css/message.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
    <div class="container">
        <div class="image"></div>
        <div class="form">
            <h3>비밀번호 재설정</h3>
            <form action="updatePassword.do" method="post">
            	<input type="hidden" name="member_id" value="${member_id}" />
                <input type="password" id="userPwd" class="form-control" name="member_password" placeholder="새 비밀번호" required>
				<div class="valid-message2">올바른 비밀번호 형식입니다.</div>
				<div class="invalid-message3">비밀번호는 영문과 숫자를 포함한 8~16자입니다.</div>

                <input type="password" id="rePwd" class="form-control" placeholder="새 비밀번호 확인" required>
				<div class="valid-message3">비밀번호가 일치합니다.</div>
				<div class="invalid-message4">비밀번호가 일치하지 않습니다.</div>
                <button id="pcButton" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer" type="submit" onclick="return changePassword()">비밀번호 변경</button>
            </form>
        </div>
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
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<!-- 유효성검사를 위한 js -->
	<script src="js/validation.js"></script>
<!--===============================================================================================-->
</body>
</html>