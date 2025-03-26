<%-- 
    Document   : user-management
    Created on : Mar 25, 2025, 6:01:12 PM
    Author     : Naammm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/admin/css/bootstrap.css">

    <link rel="stylesheet" href="assets/admin/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/admin/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/admin/css/app.css">
    <link rel="shortcut icon" href="assets/admin/images/favicon.svg" type="image/x-icon">
</head>

<body>
    <div id="app">
        <%@include file="sidebar.jsp" %>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Quản lý tài khoản</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Tài khoản</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Basic Vertical form layout section start -->
                <section id="basic-vertical-layouts">
                    <div class="row match-height">
                        <div class="col-9">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Chỉnh sửa tài khoản</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <c:if test="${not empty requestScope.errorMessage}">
                                        <div class="alert alert-danger"><i class="bi bi-file-excel"></i>${requestScope.errorMessage}</div>
                                        </c:if>
                                        <form class="form form-vertical" action="EditUserController" method="POST">
                                            <input type="hidden" name="userID" value="${sessionScope.userEdit.userID}"/>
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Tên đầy đủ</label>
                                                            <input type="text"
                                                                   class="form-control" name="fullName" value="${sessionScope.userEdit.fullName}">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Số điện thoại</label>
                                                            <input type="text"
                                                                   class="form-control" name="phone" value="${sessionScope.userEdit.phone}">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Role</label>
                                                            <select class="form-control" name="RoleID">
                                                                <option value="AD" ${sessionScope.userEdit.roleID == 'AD' ? 'selected' : ''}>Admin</option>
                                                                <option value="US" ${sessionScope.userEdit.roleID == 'US' ? 'selected' : ''}>User</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Mật khẩu mới</label>
                                                            <input type="password"
                                                                class="form-control" name="password">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Nhập lại mật khẩu mới</label>
                                                            <input type="password"
                                                                class="form-control" name="repeatPass">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="password-vertical">Email</label>
                                                            <input type="email"
                                                                   class="form-control" name="email" value="${sessionScope.userEdit.email}">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="password-vertical">Địa chỉ</label>
                                                            <input type="text"
                                                                   class="form-control" name="address" value="${sessionScope.userEdit.address}">
                                                        </div>
                                                    </div>
                                                    <div class="col-12 d-flex justify-content-end">
                                                        <button type="submit"
                                                            class="btn btn-primary me-1 mb-1">Submit</button>
                                                            <button type="reset"
                                                            class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic Vertical form layout section end -->

            </div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2021 &copy; Mazer</p>
                    </div>
                    <div class="float-end">
                        <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                href="http://ahmadsaugi.com">A. Saugi</a></p>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="assets/admin/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/admin/js/bootstrap.bundle.min.js"></script>

    <script src="assets/admin/js/main.js"></script>
</body>

</html>
