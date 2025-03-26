<%-- 
    Document   : user-management
    Created on : Mar 25, 2025, 6:01:12 PM
    Author     : Naammm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

                <section class="section">
        <div class="row" id="table-bordered">
            <div class="col-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <h2 class="order-title">Chi tiết đơn hàng</h2>

                            <div class="order-info">
                                <p><strong>Mã đơn hàng:</strong> #${order.code}</p>
                                <p><strong>Ngày đặt:</strong> <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
                                <p><strong>Trạng thái:</strong> <span class="${order.status eq 'Đang xử lý' ? 'status-processing' : 'status-completed'}">
                                    ${order.status}
                                </span></p>
                            </div>

                            <div class="customer-info">
                                <h3>Thông tin khách hàng</h3>
                                <p><strong>Họ tên:</strong> ${user.fullName}</p>
                                <p><strong>Số điện thoại:</strong> ${user.phone}</p>
                                <p><strong>Địa chỉ:</strong> ${user.address}</p>
                            </div>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${orderItems}">
                                        <tr>
                                            <td>${item.getProductName()}</td>
                                            <td>${item.quantity}</td>
                                            <td><fmt:formatNumber value="${item.price}" type="number" pattern="#,###" /> VNĐ</td>
                                            <td><fmt:formatNumber value="${item.quantity * item.price}" type="number" pattern="#,###" /> VNĐ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4" class="text-right"><strong>Tổng tiền:</strong></td>
                                        <td><fmt:formatNumber value="${order.totalAmount}" type="number" pattern="#,###" /> VNĐ</td>
                                    </tr>
                                </tfoot>
                            </table>

                            <div class="action-buttons">
                                <a href="IndexOrderController" class="btn btn-secondary">Quay lại</a>
                                <c:if test="${order.status eq 'Đang xử lý'}">
                                    <a href="CancelOrderController?orderID=${order.orderID}" class="btn btn-danger">Hủy đơn hàng</a>
                                </c:if>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
