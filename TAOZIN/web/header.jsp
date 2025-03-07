<%-- 
    Document   : header
    Created on : Feb 17, 2025, 10:58:00 AM
    Author     : Naammm
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--==================== HEADERHEADER ====================-->
<header class="header">
    <div class="container">
        <div class="header-left">

            <!-- LOGO -->
            <div class="header-logo">
                <a href="index.jsp" class="logo">
                    <img src="assets/img/logo-no-background-1.png" alt="TÁO ZIN - iPhone, iPad, Mac, phụ kiện điện tử chính hãng" class="header-logo-img" style="">
                </a>
            </div>

            <!-- DROPDOWN -->
            <div class="header-left-item dropdown">
                <div class="">
                    <span class="text-dm"><i class="fa-light fa-bars"></i> Danh mục</span>
                </div>
                <ul class="header-left-menu">
                    <li><a class="dropdown-item" href="CategoryController?categoryID=1">iPhone</a></li>
                    <li><a class="dropdown-item" href="CategoryController?categoryID=2">iPad</a></li>
                    <li><a class="dropdown-item" href="CategoryController?categoryID=3">Macbook</a></li>
                    <li><a class="dropdown-item" href="CategoryController?categoryID=4">Âm thanh</a></li>
                    <li><a class="dropdown-item" href="CategoryController?categoryID=5">Phụ kiện</a></li>
                    <li><a class="dropdown-item" href="#">Khuyến mãi</a></li>
                    <li><a class="dropdown-item" href="#">Chính sách bảo hành</a></li>
                </ul>
            </div>                        
        </div> 

        <div class="header-center">
            <!-- SEARCH -->
            <form action="SearchServlet" method="GET" class="form-search">
                <input type="text" class="form-search-input" placeholder="Tìm kiếm sản phẩm...">
                <span class="search-btn"><i class="fa-light fa-magnifying-glass"></i></span>
            </form>              
        </div>

        <div class="header-right">
            <ul class="header-right-list">
                <!-- <li class="header-right-item dnone open" onclick="openSearchMb()">
                    <div class="cart-icon-menu">
                        <i class="fa-light fa-magnifying-glass"></i>
                    </div>
                </li>
                <li class="header-right-item close" onclick="closeSearchMb()">
                    <div class="cart-icon-menu">
                        <i class="fa-light fa-circle-xmark"></i>
                    </div>
                </li> -->
                <li class="header-right-item dropdown <%= session.getAttribute("user") != null ? "logged-in" : "open" %>">
                    <i class="fa-light fa-user"></i>
                    <div class="auth-container">
                        <% if (session.getAttribute("user") != null) {
                            UserDTO user = (UserDTO) session.getAttribute("user");
                        %>
                            <span class="text-dndk">Tài khoản</span>
                            <span class="text-tk"><%= user.getFullName() %> <i class="fa-sharp fa-solid fa-caret-down"></i></span>
                    </div>    
                    <ul class="header-right-menu">
                        <% if (user.getRoleID().equals("AD")) { %>
                            <li><a href="./admin.html"><i class="fa-light fa-gear"></i> Quản lý cửa hàng</a></li>
                        <% } %>
                        <li><a href="javascript:;" onclick="myAccount()"><i class="fa-light fa-circle-user"></i> Tài khoản của tôi</a></li>
                        <li><a href="javascript:;" onclick="orderHistory()"><i class="fa-regular fa-bags-shopping"></i> Đơn hàng đã mua</a></li>
                        <li class="border"><a href="MainController?action=logout"><i class="fa-light fa-right-from-bracket"></i> Thoát tài khoản</a></li>
                    </ul>
                        <% } else { %>
                            <span class="text-dndk">Đăng nhập / Đăng ký</span>
                            <span class="text-tk">Tài khoản <i class="fa-sharp fa-solid fa-caret-down"></i></span>
                    </div>
                    <ul class="header-right-menu">
                        <li><a id="login" href="javascript:;"><i class="fa-light fa-right-to-bracket"></i> Đăng nhập</a></li>
                        <li><a id="signup" href="javascript:;"><i class="fa-light fa-user-plus"></i> Đăng ký</a></li>
                    </ul>
                    <% } %>
                </li>

                <li class="header-right-item open" onclick="openCart()">
                    <div class="cart-icon-menu">
                        <i class="fa-light fa-cart-shopping"></i>
                        <span class="count-product-cart">0</span>
                    </div>
                    <span>Giỏ hàng</span>
                </li>
            </ul>
        </div>
    </div>
</header>
