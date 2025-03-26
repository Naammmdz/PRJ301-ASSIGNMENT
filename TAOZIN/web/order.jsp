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
       <main class="order-history-page">
            <div class="order-history-container">
                <h2 class="order-history-title">Lịch sử đơn hàng</h2>
                <div class="order-history-list">
                    <c:forEach var="order" items="${orderList}">
                        <div class="order-history-item">
                            <div class="order-info">
                                <h3 class="order-id">Mã đơn hàng: #${order.code}</h3>
                                <p class="order-date">Ngày đặt: ${order.createdAt}</p>
                                <p class="order-status">
                                    Trạng thái: 
                                    <span class="${order.status eq 'Đang xử lý' ? 'status-processing' : 'status-completed'}">
                                        ${order.status}
                                    </span>
                                </p>
                            </div>
                            <div class="order-items">
                                <c:forEach var="item" items="${order.orderItems}">
                                    <div class="order-product">
                                        <div class="order-product-info">
                                            <p class="order-product-name">Sản phẩm: ${item.getProductName()}</p>
                                            <p class="order-product-qty">Số lượng: ${item.quantity}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <p class="order-total">Tổng tiền: <span><fmt:formatNumber value="${order.totalAmount}" type="number" pattern="#,###"/> VNĐ</span></p>
                        </div>
                    </c:forEach>
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
