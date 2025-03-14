<%-- 
    Document   : detail
    Created on : Mar 11, 2025, 4:27:30 PM
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
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <c:if test="${not empty requestScope.category}">
                            <li> <a href="CategoryController?categoryID=${category.categoryID}">${category.categoryName}</a> </li>
                        </c:if>
                        <c:if test="${not empty requestScope.productDetail}">
                            <li> <a href="DetailController?productID=${productDetail.productID}">${productDetail.productName}</a> </li>
                        </c:if>
                    </ul>
                </nav>
                
                <form class="detail" action="CartController" name="action" method="POST">
                    <input type="hidden" name="action" value="create">
<!--                    <input type="hidden" name="quantity" value="${productDetail.stockQuantity}">-->
                    <input type="hidden" name="productId" value="${productDetail.productID}">
                    <input type="hidden" name="productPrice" value="${productDetail.price}">
                    <div class="image">
                        <img src="${productDetail.thumbnail}" alt="">
                    </div>

                    <div class="info">
                        <h2 class="name">${productDetail.productName}</h2>
                        <p class="price"><fmt:formatNumber value="${productDetail.price}" type="number" pattern="#,###"/> VNĐ</p>

                        <div class="buttons">
                            <input class="quantity-btn" type="number" name="quantity" value="1" min="1">
                            <button class="cart-btn">
                                Thêm vào giỏ hàng 
                                <span><i class="fa-light fa-cart-shopping"></i></span>
                            </button>
                        </div>

                        <p class="description">
                            ${productDetail.description}
                        </p>
                    </div>
                </form>
                        
                <div class="similar-title-block" id="similar-title">
                    <h2 class="similar-title">Sản phẩm tương tự</h2>
                </div>
                <%
                    List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
                    DecimalFormat df = new DecimalFormat("#,###");
                %>
                <div class="slider-container">
                    <div id="formList">
                        <div id="list">
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
                                            <form action="DetailController" method="GET">
                                                <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                                                <button type="submit" class="details-btn">Xem chi tiết</button>
                                            </form>
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
                    <button id="prev" class="slider-btn prev">❮</button>
                    <button id="next" class="slider-btn next">❯</button>
                </div>
            </div>
        </main>
         <%@include file="footer.jsp" %>
        <%@include file="lst.jsp" %>
        <%@include file="scrollup.jsp" %>
        <script src="js/main.js"></script>
        <script src="js/card-slider.js"></script>
    </body>
</html>
