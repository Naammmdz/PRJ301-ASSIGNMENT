<%-- 
    Document   : main
    Created on : Feb 18, 2025, 12:59:14 PM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TÁO ZIN</title>
        <link href='assets/img/logo-color.png' rel='icon' type='image/x-icon' />
        <link rel="stylesheet" href="assets/css/style.css"> 
        <link rel="stylesheet" href="assets/font/font-awesome-pro-v6-6.2.0/css/all.min.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!--==================== MAIN ====================-->
        <main class="main-wrapper">
            <div class="container" id="homescreen">
                <div class="home-banner">
                    <img src="assets/img/banner.png" alt="">
                </div>
                <div class="home-service">
                    <div class="home-service-item">
                        <div class="home-service-item-icon">
                            <i class="fa-light fa-badge-check"></i>
                        </div>
                        <div class="home-service-item-content">
                            <h4>BẢO HÀNH CHÍNH HÃNG</h4>
                            <p class="home-service-item-content-desc">Đảm bảo quyền lợi khách hàng</p>
                        </div>
                    </div>
                    <div class="home-service-item">
                        <div class="home-service-item-icon">
                            <i class="fa-light fa-rotate"></i>
                        </div>
                        <div class="home-service-item-content">
                            <h4>30 NGÀY ĐỔI MỚI </h4>
                            <p class="home-service-item-content-desc">Lỗi từ nhà sản xuất</p>
                        </div>
                    </div>
                    <div class="home-service-item">
                        <div class="home-service-item-icon">
                            <i class="fa-light fa-truck-fast"></i>
                        </div>
                        <div class="home-service-item-content">
                            <h4>GIAO HÀNG NHANH</h4>
                            <p class="home-service-item-content-desc">Vận chuyển nhanh chóng</p>
                        </div>
                    </div>
                    <div class="home-service-item">
                        <div class="home-service-item-icon">
                            <i class="fa-light fa-headset"></i>
                        </div>
                        <div class="home-service-item-content">
                            <h4>HỖ TRỢ 24/7</h4>
                            <p class="home-service-item-content-desc">Tất cả ngày trong tuần</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
