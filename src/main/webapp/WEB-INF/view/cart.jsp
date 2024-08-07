<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>장바구니</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
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
    <link rel="stylesheet" type="text/css" href="css/cart.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
    <!-- top -->
    <div style="height:124px">
        <jsp:include page="top.jsp" flush="false" />
    </div>
   
    <!-- breadcrumb -->
    <div class="container">
        <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
            <a href="main.do" class="stext-109 cl8 hov-cl1 trans-04">
                홈
                <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
            </a>
            <span class="stext-109 cl4">
                장바구니
            </span>
        </div>
    </div>

    <!-- Shoping Cart -->
    <form class="bg0 p-t-75 p-b-85" id="cartForm" action="order.do" method="GET">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                        <c:if test="${empty cartList}">
                            <p>장바구니에 담긴 상품이 없습니다.</p>
                        </c:if>
                        <c:if test="${not empty cartList}">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1" style="padding-left:85px;">상품</th>
                                    <th class="column-2" style="padding-left:70px;">상품명</th>
                                    <th class="column-3" style="padding-left:15px;">가격</th>
                                    <th class="column-4" style="text-align:left; padding-left:60px;">수량</th>
                                    <th class="column-5">총 상품금액</th>
                                </tr>
                                
                                <c:forEach var="item" items="${cartList}">
                                    <tr class="table_row">
                                        <td class="column-1">
                                            <div class="how-itemcart1 m-l-20" onclick="deleteCart('${item.cart_id}', '${item.member_id}')">
                                                <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${item.isbn}.jpg" alt="IMG"> 
                                            </div>
                                        </td>
                                        <td class="column-2" style="text-align:center; padding-left:5px; padding-right:10px;">${item.book_name}</td>
                                        <div>
                                            <td class="column-3" style="text-align:left; padding-left:-5px;">
                                               <fmt:formatNumber value="${item.book_price * (100 - item.book_discount) / 100}" pattern="###,###원"/>
                                            </td>
                                        </div>
                                        <td class="column-4">
								            <div class="wrap-num-product flex-w m-l-auto m-r-0">
								                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m" onclick="changeQuantity('${item.cart_id}', '${item.member_id}', 'down')">
								                    <i class="fs-16 zmdi zmdi-minus"></i>
								                </div>
								                <input class="mtext-104 cl3 txt-center num-product" type="number" name="bookCount" value="${item.bookCount}" data-cart-id="${item.cart_id}" data-member-id="${item.member_id}" readonly>
								                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" onclick="changeQuantity('${item.cart_id}', '${item.member_id}', 'up')">
								                    <i class="fs-16 zmdi zmdi-plus"></i>
								                </div>
								            </div>
								        </td>
                                        <td class="column-5" id="price1">
                                            <fmt:formatNumber value="${(item.book_price * (100 - item.book_discount) / 100) * item.bookCount}" pattern="###,###원" />
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                          </c:if>
                        </div>
                        
                        <!-- 포인트 -->
                        <c:if test="${not empty cartList}">
                        <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                            <div class="flex-w flex-m m-r-20 m-tb-5">
                                <span class="m-r-10">보유 포인트 :</span>
                                <span class="m-r-20">
                                     <fmt:formatNumber value="${loginMember.member_point}" pattern="###,###원" />
                                </span>
                                <input class="stext-104 cl2 plh4 size-point1 bor13 p-lr-20 m-r-10 m-tb-5" type="text" id="point">
                                <button type="button" class="flex-c-m stext-101 cl2 size-point2 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5 m-r-10" onclick="usePoints()">사용하기</button>
                                <button type="button" class="flex-c-m stext-101 cl2 size-point2 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5 m-r-1" onclick="useAllPoints()">전액 사용 </button>
                            </div>
                        </div>
                        </c:if>
                    </div>
                </div>

                <!-- 결제 금액 -->
                <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                    <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                        <h4 class="mtext-109 cl2 p-b-20">
                            총 주문 금액 
                        </h4>
                        
                        <div class="flex-w flex-t bor12 p-b-13">
                            <div class="size-208">
                                <span class="mtext-101 cl2">
                                    상품금액 :
                                </span>
                            </div>
                            <div class="size-209">
                                <span class="mtext-110 cl2" id="totalPrice">
                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach var="item" items="${cartList}">
                                        <c:set var="totalPrice" value="${totalPrice + ((item.book_price * (100 - item.book_discount) / 100) * item.bookCount)}"/>
                                    </c:forEach>
                                    <span><fmt:formatNumber value="${totalPrice}" pattern="###,### 원"/></span>
                                </span>
                            </div>
                        </div>
                        <div class="flex-w flex-t bor12 p-t-15 p-b-15">
                            <div class="size-208 w-full-ssm">
                                <span class="stext-110 cl2" id="shippingCost">
                                    배송비 :
                                </span>
                            </div>
                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                <p class="stext-111 cl6 p-t-2" id="shippingCost">
                                    3,000원
                                </p>
                            </div>
                        </div>

                        <!-- 적립 포인트 --> 
                        <div class="flex-w flex-t bor12 p-t-15 p-b-15">
                            <div class="size-208 w-full-ssm">
                                <span class="stext-110 cl2">
                                    적립 포인트 :
                                </span>
                            </div>
                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                <p class="stext-111 cl6 p-t-2">
                                  <c:set var="totalReward" value="0"/>
                                  <c:forEach var="item" items="${cartList}">
                                        <c:set var="reward" value="${item.book_price * 0.05}"/>
                                        <c:set var="totalReward" value="${totalReward + reward}"/>
                                    </c:forEach>
                                    <span><fmt:formatNumber value="${totalReward}" type="number" pattern="###,### 원"/></span>
                                </p>
                            </div>
                        </div>
                        
                        <!-- 사용할 포인트 -->
                        <div class="flex-w flex-t bor12 p-t-15 p-b-15">
                            <div class="size-208 w-full-ssm">
                                <span class="stext-110 cl2">
                                    사용 포인트 : 
                                </span>
                            </div>
                            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                <p class="stext-111 cl6 p-t-2" id="point1">
                                    0원
                                </p>
                            </div>    
                        </div>
                   
                        <!-- 최종금액 -->
                        <div class="flex-w flex-t p-t-27 p-b-27">
                            <div class="size-208">
                                <span class="mtext-101 cl2">
                                    최종 금액 :
                                </span>
                            </div>
                            <div class="size-209 p-t-1">
                                <span class="mtext-110 cl2" id="total">
                                    <fmt:formatNumber value="${totalPrice + 3000}" pattern="###,### 원"/>
                                </span>
                            </div>
                        </div>
                        
                        <!-- 주문하기 버튼 -->
                        <button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            상품 주문하기
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" name="totalPrice" id="hiddenTotalPrice" value="${totalPrice + 3000 - usePoint}">
        <input type="hidden" name="usePoint" id="hiddenUsePoint" value="0">
        <%-- <input type="hidden" name="savePoint" value="${totalReward}"> --%>
        <input type="hidden" name="savePoint" value="<fmt:formatNumber value='${totalReward}' type='number' pattern='###' />">
    </form>
    <jsp:include page="bottom.jsp" flush="false"/> 
<!--===============================================================================================-->
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
    <script src="js/main.js"></script>
    <script src="js/script.js"></script>
    <script>
    function formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
    }

    function validatePoints() {
        var pointInput = document.getElementById('point');
        var pointValue = parseInt(pointInput.value.replace(/,/g, ''), 10);
        var totalPoints = parseInt("${loginMember.member_point}", 10);
        
        if (!isNaN(pointValue) && pointValue > totalPoints) {
            alert("보유한 포인트보다 더 많이 입력할 수 없습니다.");
            pointInput.value = totalPoints;
        }
    }

    function usePoints() {
        var pointInput = document.getElementById('point').value;
        var pointDisplay = document.getElementById('point1');
        var pointValue = parseInt(pointInput.replace(/,/g, ''), 10);
        var totalPoints = parseInt("${loginMember.member_point}", 10);
        
        if (!isNaN(pointValue)) {
            if (pointValue > totalPoints) {
                alert("보유한 포인트보다 더 많이 입력할 수 없습니다.");
                pointValue = totalPoints;
                document.getElementById('point').value = totalPoints;
            }
            pointDisplay.innerHTML = formatNumber(pointValue);
            calculateTotal(pointValue);
        } else {
            pointDisplay.innerHTML = '0원';
            calculateTotal(0);
        }
    }

    function useAllPoints() {
        var totalPoints = parseInt("${loginMember.member_point}", 10);
        var pointInput = document.getElementById('point');
        var pointDisplay = document.getElementById('point1');
        pointInput.value = totalPoints;
        pointDisplay.innerHTML = formatNumber(totalPoints);
        calculateTotal(totalPoints);
    }

    function calculateTotal(usedPoints) {
        var totalPriceElement = document.getElementById('totalPrice').innerText.replace(/[^0-9]/g, '');
        var totalPrice = parseInt(totalPriceElement, 10);
        var finalTotal = totalPrice + 3000 - usedPoints; // 상품금액 + 배송비 - 사용 포인트
        var totalElement = document.getElementById('total');
        totalElement.innerHTML = formatNumber(finalTotal);

        // 사용 포인트 hidden 필드에 값 설정
        document.getElementById('hiddenUsePoint').value = usedPoints;
        
     // 최종 금액 hidden 필드에 값 설정
        document.getElementsByName('totalPrice')[0].value = finalTotal;
    }
    </script>
<script>
    function changeQuantity(cartId, memberId, action) {
        var form = document.createElement('form');
        form.method = 'POST';

        if (action === 'down') {
            form.action = 'decreaseCartItemCount.do';
        } else if (action === 'up') {
            form.action = 'increaseCartItemCount.do';
        }

        var cartIdField = document.createElement('input');
        cartIdField.type = 'hidden';
        cartIdField.name = 'cart_id';
        cartIdField.value = cartId;
        form.appendChild(cartIdField);

        var memberIdField = document.createElement('input');
        memberIdField.type = 'hidden';
        memberIdField.name = 'member_id';
        memberIdField.value = memberId;
        form.appendChild(memberIdField);

        document.body.appendChild(form);
        form.submit();
    }
</script>



</body>
</html>
