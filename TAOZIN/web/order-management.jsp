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
                            <h3>Quản lý đơn hàng</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Bordered table start -->
                <section class="section">
                    <div class="row" id="table-bordered">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <a href="create-user.jsp" class="btn btn-primary">Add</a>
                                    </div>
                                    <div class="card-body">
                                        <form action="SearchOrderController" method="GET">
                                            <input type="text" name="orderCode" placeholder="Nhập mã đơn hàng..." value="${requestScope.orderCode}">
                                            <button type="submit">Tìm kiếm</button>
                                        </form>
                                    </div>
                                    <!-- table bordered -->
                                    <div class="table-responsive">
                                        <table class="table table-bordered mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn</th>
                                                    <th>Khách hàng</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chi tiết</th>
                                                    <th>Xóa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${requestScope.orderList}">
                                                    <tr>
                                                        <td class="text-bold-500">#${order.code}</td>
                                                        <td>${order.getUserPhone()}</td>
                                                        <td>${order.createdAt}</td>
                                                        <td><fmt:formatNumber value="${order.totalAmount}" type="number" pattern="#,###"/> VNĐ</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${order.status eq 'Đang xử lý'}">
                                                                    <a href="UpdateOrderStatusController?orderID=${order.orderID}" 
                                                                       class="badge bg-warning text-decoration-none">
                                                                        ${order.status}
                                                                    </a>
                                                                </c:when>
                                                                <c:when test="${order.status eq 'Đã hủy'}">
                                                                    <span class="badge bg-danger">${order.status}</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-success">${order.status}</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="OrderDetailController?orderID=${order.orderID}" class="btn btn-info">Chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a href="DeleteOrderController?orderID=${order.orderID}" class="btn btn-danger"
                                                               onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này?')">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Bordered table end -->

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
