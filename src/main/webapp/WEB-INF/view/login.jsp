<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>로그인</title>
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
</head>
<body class="animsition">
    <div class="container">
		<!-- 사진 LogService.css 20번째 라인 -->
        <div class="image"></div>
		<!-- 입력폼 -->
        <div class="form">
            <!-- <h1>BookStation</h1> -->
			<a href="main.do"><img src="images/icons/Logo-1.png" alt="logo" class="logo"></a>
            <form action="login.do" method="post">
                <input type="text" id="userId" class="form-control" name="member_id" placeholder="아이디 입력">
                <input type="password" id="userPwd" class="form-control" name="member_password" placeholder="비밀번호 입력">
                <button id="btn-login" class="flex-c-m stext-101 cl0 size-116 bg3 bor4 hov-btn3 p-lr-15 trans-04 pointer" type="submit">로그인</button>
            </form>
            <!-- 로그인 실패 시 알림 메시지 -->
			<c:if test="${not empty loginError}">
			    <script type="text/javascript">
			        alert("${loginError}");
			    </script>
			</c:if>
            <div class="links">
                <a href="register.do">회원가입</a>
				<span>|</span>
                <a href="memberFind.do">아이디 찾기</a>
                <span>|</span>
                <a href="memberFind.do">비밀번호 찾기</a>
            </div>
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
	<script>
	$(function(){
        $('#btn-login').click(function(event){
            // 폼 제출을 막기 위해 기본 이벤트를 중단
            event.preventDefault();
            
            // 아이디와 비밀번호 입력 값 확인
            var userId = $('#userId').val();
            var userPwd = $('#userPwd').val();

            // 입력 값이 없는 경우 알림 표시 및 폼 제출 방지
            if(userId.trim() === "" && userPwd.trim() === ""){
                alert("아이디와 비밀번호를 입력해주세요.");
            }
            else if(userId.trim() === ""){
                alert("아이디를 입력해주세요.");
            }
            else if(userPwd.trim() === ""){
                alert("비밀번호를 입력해주세요.");
            }
            else{
                // 입력 값이 모두 있는 경우 폼 제출
                $(this).closest('form').submit();
                /* location.href = "main.do"; */
            }
        });
    });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>