<%-- 
    Document   : cart
    Created on : Mar 13, 2025, 10:04:38 AM
    Author     : Naammm
--%>

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
        <main class="main-wrapper">
            <div class="container">                
                <div class="cart-container">
                    <c:forEach items="${cart}" var="orderItem">
                        <div class="cart-item" action="CartController" method="post">
                            <img src="${orderItem.getProduct().thumbnail}" alt="">
                            <div class="item-info">
                                <h3>${orderItem.getProduct().productName}</h3>
                                <p class="price"><fmt:formatNumber value="${orderItem.price}" type="number" pattern="#,###"/> VNĐ</p>
                            </div>
                            <div class="item-control">
                                <form  action="CartController" method="POST">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="productId" value="${orderItem.productID}">
                                    <button class="delete" ><i class="fa-light fa-trash-xmark"></i></button>
                                </form>
                                <form class="quantity-control" action="CartController" method="POST">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="productId" value="${orderItem.productID}">
                                    <button id="minus" class="quantity-btn-left">-</button>
                                    <input id="theInput" class="quantity-btn" type="text" name="quantity" value="${orderItem.quantity}" readonly="readonly" >
                                    <button id="plus" class="quantity-btn-right">+</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>             
                <div class="checkout">
                    <p>Tạm tính: <span class="total-price"><fmt:formatNumber value="${total}" type="number" pattern="#,###"/> VNĐ</span></p>
                    <button class="checkout-btn">Mua ngay</button>
                </div>
            </div>
        </main>
         <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".quantity-control").forEach(function (control) {
                    let input = control.querySelector(".quantity-btn");
                    let plusBtn = control.querySelector(".quantity-btn-right");
                    let minusBtn = control.querySelector(".quantity-btn-left");

                    plusBtn.addEventListener("click", function () {
                        input.value = parseInt(input.value, 10) + 1;
                    });

                    minusBtn.addEventListener("click", function () {
                            input.value = parseInt(input.value, 10) - 1;
                    });
                });
            });
        </script>
    </body>
</html>
