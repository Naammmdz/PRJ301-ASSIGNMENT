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
            <div class="container" id="account-user">                
                <div class="main-account">
                    <div class="main-account-header">
                        <h3>Thông tin tài khoản của bạn</h3>
                        <p>Quản lý thông tin để bảo mật tài khoản</p>
                    </div>
                    <div class="main-account-body">
                        <div class="main-account-body-col">
                            <form id="form1" action="UserController" class="info-user" method="POST">
                                <input type="hidden" name="action" value="info">
                                <div class="form-group">
                                    <label for="infoname" class="form-label">Họ và tên</label>
                                    <input class="form-control" type="text" name="txtFullName" value="${user.fullName}" placeholder=""><br>
                                    <c:if test="${not empty requestScope.txtFullName_error}">
                                        <span class="form-message">${requestScope.txtFullName_error}</span>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="infophone" class="form-label">Số điện thoại</label>
                                    <input class="form-control" type="text" name="txtPhone" id="infophone" disabled="true"
                                        value="${user.phone}"><br>
                                </div>
                                <div class="form-group">
                                    <label for="infoemail" class="form-label">Email</label>
                                    <input class="form-control" type="email" name="txtEmail" id="infoemail"
                                        value="${not empty user.email ? user.email : ''}" placeholder="Thêm địa chỉ email của bạn"><br>
                                    <c:if test="${not empty requestScope.txtEmail_error}">
                                        <span class="form-message">${requestScope.txtEmail_error}</span>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label for="infoaddress" class="form-label">Địa chỉ</label>
                                    <input class="form-control" type="text" name="txtAddress" id="infoaddress"
                                        value="${not empty user.address ? user.address : ''}" placeholder="Thêm địa chỉ giao hàng của bạn"><br>
                                    <c:if test="${not empty requestScope.txtUserAddress_error}">
                                        <span class="form-message">${requestScope.txtUserAddress_error}</span>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                        <div class="main-account-body-col">
                            <form  id="form2" action="UserController" class="change-password" method="POST">
                                <input type="hidden" name="action" value="change">
                                <div class="form-group">
                                    <label for="" class="form-label w60">Mật khẩu hiện tại</label>
                                    <input class="form-control" type="password" name="oldPassword"
                                           placeholder="Nhập mật khẩu hiện tại"><br>
                                    <span class="password-cur-info-error form-message">${requestScope.oldPassword_error}</span>
                                </div>
                                <div class="form-group">
                                    <label for="" class="form-label w60">Mật khẩu mới </label>
                                    <input class="form-control" type="password" name="newPassword"
                                        placeholder="Nhập mật khẩu mới"><br>
                                    <span class="form-message">${requestScope.newPassword_error}</span>
                                </div>
                                <div class="form-group">
                                    <label for="" class="form-label w60">Xác nhận mật khẩu mới</label>
                                    <input class="form-control" type="password" name="confirmPassword"
                                        placeholder="Nhập lại mật khẩu mới"><br>
                                    <span class="form-message">${requestScope.confirmPassword_error}</span>
                                </div>
                            </form>
                        </div>
                        <div class="main-account-body-row">
                            <div>
                                <button id="save-info-user" onclick="submitForm('form1')"><i
                                        class="fa-regular fa-floppy-disk"></i> Lưu thay đổi</button>
                            </div>
                            <div>
                                <button id="save-password" onclick="submitForm('form2')">
                                    <i class="fa-regular fa-key"></i> Đổi mật khẩu</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        </c:if>
        <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
        <script>
            function submitForm(formId) {
                document.getElementById(formId).submit();
            }
        </script>
    </body>
</html>
