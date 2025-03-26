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
                            <h3>Quản lý sản phẩm</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
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
                                    <h4 class="card-title">Thêm sản phẩm mới</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <c:if test="${not empty requestScope.errorMessage}">
                                        <div class="alert alert-danger"><i class="bi bi-file-excel"></i>${requestScope.errorMessage}</div>
                                        </c:if>
                                        <form class="form form-vertical" action="CreateProductController" method="POST">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Tên sản phẩm</label>
                                                            <input type="text" class="form-control" name="productName" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Mô tả sản phẩm</label>
                                                            <textarea type="text" class="form-control" name="description"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Giá sản phẩm (VNĐ)</label>
                                                            <input type="number" class="form-control" name="price" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Số lượng</label>
                                                            <input type="number" class="form-control" name="stockQuantity" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Danh mục sản phẩm</label>
                                                            <select class="form-control" name="categoryID">
                                                                <option value="1">iPhone</option>
                                                                <option value="2">iPad</option>
                                                                <option value="3">MacBook</option>
                                                                <option value="4">Âm thanh</option>
                                                                <option value="5">Phụ kiện</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label>Hình ảnh</label>
                                                            <input type="hidden" id="txtImage" name="txtImage"/>
                                                            <input type="file" class="form-control" id="imageUpload" accept="image/*" multiple>
                                                            <div class="file-info" id="fileInfo">No file selected</div>
                                                            <div class="progress-bar-container" id="progressContainer">
                                                                <div class="progress-bar" id="progressBar"></div>
                                                            </div>
                                                        </div>
                                                        <div class="image-preview" id="imagePreview"></div>
                                                    </div>
                                                    <div class="col-12 d-flex justify-content-end">
                                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/admin/js/product-form.js"></script>
</body>

</html>
