<%-- 
    Document   : user
    Created on : Mar 14, 2025, 2:05:31 PM
    Author     : Naammm
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="utils.AuthUtils"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TÁO ZIN</title>
        <link href='assets/img/logo-color.png' rel='icon' type='image/x-icon' />
        <link rel="stylesheet" href="assets/css/style.css"> 
        <link rel="stylesheet" href="assets/css/toast-message.css"> 
        <link rel="stylesheet" href="assets/font/font-awesome-pro-v6-6.2.0/css/all.min.css"/>
    </head>
    <body>
         <%@include file="header.jsp" %>
        <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
        <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>
        
        <c:if test="${isLoggedIn}">
        <main class="main-wrapper">
            <div class="container">  
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="CartController">Giỏ hàng</a></li>
                        <li><a href="checkout.jsp">Thanh toán</a></li>
                    </ul>
                </nav>
            <div class="checkout-container">
                
                    <!-- Tiêu đề -->
                    <h2 class="checkout-title">Thông tin</h2>

                    <!-- Sản phẩm -->
                    <c:forEach items="${cart}" var="orderItem">
                    <div class="checkout-cart-item">
                        <img src="${orderItem.getProduct().thumbnail}" alt="" class="checkout-cart-image">
                        <div class="checkout-cart-details">
                            <h3 class="checkout-product-name">"${orderItem.getProduct().productName}</h3>
                            <p class="checkout-product-price"><fmt:formatNumber value="${orderItem.price}" type="number" pattern="#,###"/> VNĐ</p>
                            <p class="checkout-product-qty">Số lượng: <span>${orderItem.quantity}</span></p>
                        </div>
                    </div>
                    </c:forEach>

                    <!-- Thông tin khách hàng -->
                    <div class="checkout-customer-info">
                        <h3 class="checkout-section-title">Thông tin khách hàng</h3>
                        <label class="checkout-label">Họ và Tên:</label>
                        <input type="text" value="${sessionScope.user.fullName}" class="checkout-input" disabled="true">

                        <label class="checkout-label">Email:</label>
                        <input type="email" value="${sessionScope.user.email}" class="checkout-input" disabled="true">

                        <label class="checkout-label">Số điện thoại:</label>
                        <input type="text" value="${sessionScope.user.phone}" class="checkout-input" disabled="true">
                        
                        <label class="checkout-label">Địa chỉ nhận hàng:</label>
                        <input type="text" value="${sessionScope.user.address}" class="checkout-input" disabled="true">
                    </div>

                    <!-- Tổng tiền & nút tiếp tục -->
                    <div class="checkout-summary">
                        <p class="checkout-total-label">Tổng tiền: <span class="checkout-total-price"><fmt:formatNumber value="${total}" type="number" pattern="#,###"/> VNĐ</span></p>
                        <a href="CheckoutController"><button type="submit" class="checkout-btn">Thanh toán</button></a>
                    </div>
                </div>
            </div>
        </main>
        </c:if>
        <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
    </body>
</html>
