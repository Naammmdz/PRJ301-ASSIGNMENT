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
  
        <div class="modal signup-login">
            <div class="modal-container">
                <button class="form-close" onclick="closeModal()"><i class="fa-regular fa-xmark"></i></button>
                <div class="forms mdl-cnt">
                    <div class="form-content sign-up">
                        <h3 class="form-title">
                            Đăng kí tài khoản
                        </h3>
                        <p class="form-description">Đăng kí thành viên để mua hàng và nhận ưu đãi độc quyền từ chúng tôi</p>
                        <form action="MainController" class="signup-form" method="post">
                            <input type="hidden" name="action" value="sign" />
                            <div class="form-group">
                                <label for="fullname" class="form-label">Tên đầy đủ</label>
                                <input type="text" id="fullname" name="fullname" placeholder="VD: Bành Thị Lú" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password_confirmation" class="form-label">Nhập lại mật khẩu</label>
                                <input type="password" id="password_confirmation" name="password_confirmation" 
                                    placeholder="Nhập lại mật khẩu" class="form-control">
                                <span class="form-message-password-confi form-message"></span>
                            </div>                    
                            <div class="form-group">
                                <input type="checkbox" id="checkbox-signup" name="checkbox" required="">
                                <label for="checkbox-signup" class="form-checkbox"><a href="#"
                                        target="_blank">Tôi đồng ý với chính sách cửa hàng</a></label>
                                <p class="form-message-checkbox form-message"></p>
                            </div>
                            <button class="form-submit" id="signup-button">Đăng kí</button>
                        </form>
                        <p class="chang-login">Bạn đã có tài khoản? <a href="javascript:;" class="login-link">Đăng nhập</a></p>
                    </div>
                    <div class="form-content login">
                        <h3 class="form-title">
                            Đăng nhập tài khoản
                        </h3>
                        <p class="form-description">Đăng nhập để mua hàng và nhận ưu đãi mới nhất</p>
                        <form action="MainController" class="login-form" method="post">
                            <input type="hidden" name="action" value="login" />
                            <div class="form-group">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" id="phone-login" name="phone" placeholder="Nhập số điện thoại" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="form-label">Mật khẩu</label>
                                <input type="password" id="password-login" name="password" placeholder="Nhập mật khẩu" class="form-control">
                                <span class="form-message-check-login form-message"></span>
                            </div>
                            <button class="form-submit" id="login-button">Đăng nhập</button>
                        </form>
                        <p class="change-login">Bạn chưa có tài khoản? <a href="javascript:;" class="signup-link">Đăng kí</a></p>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="footer.jsp"/>
        <script src="js/main.js"></script>
    </body>
</html>
