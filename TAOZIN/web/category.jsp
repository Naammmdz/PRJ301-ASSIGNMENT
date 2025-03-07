<%-- 
    Document   : category
    Created on : Mar 7, 2025, 10:18:54 PM
    Author     : Naammm
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <c:if test="${not empty requestScope.category}">
                            <li><a href="CategoryController?categoryID=${category.categoryID}">${category.categoryName}</a></li>
                        </c:if>
                        <c:if test="${not empty param.product}">
                            <li class="active">${param.product}</li>
                        </c:if>
                    </ul>
                </nav>
                <%
                    List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
                    DecimalFormat df = new DecimalFormat("#,###");
                %>
                <div class="home-products" id="home-products">
                    <% if (productList != null && !productList.isEmpty()) { %>
                        <% for (ProductDTO product : productList) { %>
                        <div class="col-product">
                            <div class="product-card">
                                <div class="product-image">
                                    <img src="<%= product.getThumbnail() %>" alt="Product Image">
                                    <span class="badge"><i class="fa-regular fa-truck"></i> Free shipping</span>
                                </div>
                                <div class="product-info">
                                    <h2><%= product.getProductName() %></h2>
                                    <p><%= product.getDescription()%></p>
                                    <div class="product-price">
                                        <span class="price"><%= df.format(product.getPrice()) %> VNĐ</span>
                                        <span class="rating">⭐⭐⭐⭐⭐</span>
                                    </div>
                                    <button class="details-btn">Xem chi tiết</button>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    <% } else { %>
                            <div class="no-result">
                                <div class="no-result-h">Tìm kiếm không có kết quả</div>
                                <div class="no-result-p">Xin lỗi, chúng tôi không thể tìm được kết quả hợp với tìm kiếm của bạn</div>
                                <div class="no-result-i"><i class="fa-light fa-face-sad-cry"></i></div>
                            </div>
                    <% } %>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
    </body>
</html>
