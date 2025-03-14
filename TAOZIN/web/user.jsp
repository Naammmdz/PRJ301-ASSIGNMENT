<%-- 
    Document   : user
    Created on : Mar 14, 2025, 2:05:31 PM
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
            <c:if test="${not empty sessionScope.user}">
            <div class="container" id="account-user">                
                <div class="main-account">
                    <div class="main-account-header">
                        <h3>Thông tin tài khoản của bạn</h3>
                        <p>Quản lý thông tin để bảo mật tài khoản</p>
                    </div>
                    <div class="main-account-body">
                        <div class="main-account-body-col">
                            <form action="" class="info-user">
                                <div class="form-group">
                                    <label for="infoname" class="form-label">Họ và tên</label>
                                    <input class="form-control" type="text" name="txtFullName" value="${user.fullName}" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="infophone" class="form-label">Số điện thoại</label>
                                    <input class="form-control" type="text" name="txtPhone" id="infophone" disabled="true"
                                        placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="infoemail" class="form-label">Email</label>
                                    <input class="form-control" type="email" name="infoemail" id="infoemail"
                                        placeholder="Thêm địa chỉ email của bạn">
                                    <span class="inforemail-error form-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="infoaddress" class="form-label">Địa chỉ</label>
                                    <input class="form-control" type="text" name="infoaddress" id="infoaddress"
                                        placeholder="Thêm địa chỉ giao hàng của bạn">
                                </div>
                            </form>
                        </div>
                        <div class="main-account-body-col">
                            <form action="" class="change-password">
                                <div class="form-group">
                                    <label for="" class="form-label w60">Mật khẩu hiện tại</label>
                                    <input class="form-control" type="password" name="" id="password-cur-info"
                                        placeholder="Nhập mật khẩu hiện tại">
                                    <span class="password-cur-info-error form-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="" class="form-label w60">Mật khẩu mới </label>
                                    <input class="form-control" type="password" name="" id="password-after-info"
                                        placeholder="Nhập mật khẩu mới">
                                    <span class="password-after-info-error form-message"></span>
                                </div>
                                <div class="form-group">
                                    <label for="" class="form-label w60">Xác nhận mật khẩu mới</label>
                                    <input class="form-control" type="password" name="" id="password-comfirm-info"
                                        placeholder="Nhập lại mật khẩu mới">
                                    <span class="password-after-comfirm-error form-message"></span>
                                </div>
                            </form>
                        </div>
                        <div class="main-account-body-row">
                            <div>
                                <button id="save-info-user" onclick="changeInformation()"><i
                                        class="fa-regular fa-floppy-disk"></i> Lưu thay đổi</button>
                            </div>
                            <div>
                                <button id="save-password" onclick="changePassword()"><i class="fa-regular fa-key"></i> Đổi
                                    mật khẩu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:if>
        </main>
         <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
    </body>
</html>
