<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- minicart -->
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>
    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">장바구니</span>
            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>
        <div class="header-cart-content flex-w js-pscroll">
        <input type="hidden" name="member_id" value="${member_id}"/>
            <c:if test="${empty cartList}">
                장바구니에 담긴 상품이 없습니다.
            </c:if>
            
            <c:forEach var="item" items="${cartList}">
                <ul class="header-cart-wrapitem w-full">
                    <li class="header-cart-item flex-w flex-t m-b-12">
                        <div class="header-cart-item-img" onclick="deleteCart('${item.cart_id}','${item.member_id}')">
                            <img src="https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/${item.isbn}.jpg" alt="IMG">
                        </div>
                        <div class="header-cart-item-txt p-t-8">
                            <a class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                ${item.book_name}
                            </a>
                            <span class="header-cart-item-info">
                               <fmt:formatNumber value="${(item.book_price * (100 - item.book_discount) / 100) * item.bookCount}" pattern="###,###원"/>
                            </span>
                        </div>
                    </li>       
                </ul>
            </c:forEach>
            
            <!-- 총 합계 -->
            <div class="w-full">
                <div class="header-cart-total w-full p-tb-40">
                	<!-- <span>배송비 : 3,000원</span> -->
                    <span>총 합계 : </span>
                    <c:set var="totalPrice" value="0"/><c:set var="totalPrice" value="0"/>
					<c:forEach var="item" items="${cartList}">
					    <c:set var="discountedPrice" value="${item.book_price * (100.0 - item.book_discount) / 100 * item.bookCount}"/>
					    <c:set var="totalPrice" value="${totalPrice + discountedPrice}"/>
					</c:forEach>
					<span><fmt:formatNumber value="${totalPrice}" pattern="###,### 원"/></span>
                </div>
                
                <!-- 장바구니 / 주문하기 -->
                <div class="header-cart-buttons flex-w w-full">
                    <a href="cart.do" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        장바구니
                    </a>
                    <a href="cart.do" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                        주문하기
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/script.js"></script>

