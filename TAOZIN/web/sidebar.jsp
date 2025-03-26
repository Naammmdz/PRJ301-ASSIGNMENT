<%-- 
    Document   : sidebar
    Created on : Mar 25, 2025, 5:45:51 PM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.html"><img src="assets/img/logo-no-background-1.png" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <c:set var="currentPage" value="${pageContext.request.requestURI}" />
                        <li class="sidebar-item active">
                            <a href="dashboard.jsp" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Trang tổng quan</span>
                            </a>
                        </li>

                        <li class="sidebar-title">Quản lý</li>

                        <li class="sidebar-item  ">
                            <a href="IndexUserController" class='sidebar-link'>
                                <i class="bi bi-people"></i>
                                <span>Tài khoản</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item  ">
                            <a href="SearchProductController?searchProduct=" class='sidebar-link'>
                                <i class="bi bi-archive"></i>
                                <span>Sản phẩm</span>
                            </a>
                        </li>
                        
                        <li class="sidebar-item  ">
                            <a href="IndexOrderController" class='sidebar-link'>
                                <i class="bi bi-bag-check"></i>
                                <span>Đơn hàng</span>
                            </a>
                        </li>
              
                        <li class="sidebar-title">Cài đặt</li>

                        <li class="sidebar-item  ">
                            <a href="index.jsp" class='sidebar-link'>
                                <i class="bi bi-arrow-bar-left"></i>
                                <span>Trang chủ</span>
                            </a>
                        </li>

                        <li class="sidebar-item  ">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-person-circle"></i>
                                <span>${sessionScope.user.fullName}</span>
                            </a>
                        </li>

                        <li class="sidebar-item  ">
                            <a href="MainController?action=logout" class='sidebar-link'>
                                <i class="bi bi-box-arrow-left"></i>
                                <span>Đăng xuất</span>
                            </a>
                        </li>

                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
