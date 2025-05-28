# PRJ301-ASSIGNMENT: Apple Product E-commerce Website

*Một trang web thương mại điện tử để duyệt và mua các sản phẩm của Apple, được xây dựng bằng Java Servlet, JSP và Microsoft SQL Server.*

[![last commit](https://img.shields.io/github/last-commit/Naammmdz/PRJ301-ASSIGNMENT?style=flat-square)](https://github.com/Naammmdz/PRJ301-ASSIGNMENT/commits/main)
[![top language](https://img.shields.io/github/languages/top/Naammmdz/PRJ301-ASSIGNMENT?style=flat-square)](https://github.com/Naammmdz/PRJ301-ASSIGNMENT)
[![languages](https://img.shields.io/github/languages/count/Naammmdz/PRJ301-ASSIGNMENT?style=flat-square)](https://github.com/Naammmdz/PRJ301-ASSIGNMENT)

**Built with the tools and technologies:**

[![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)]()
[![Java Servlet](https://img.shields.io/badge/Java_Servlet-F89820?style=for-the-badge&logo=java&logoColor=white)]()
[![JSP (JavaServer Pages)](https://img.shields.io/badge/JSP-5382A1?style=for-the-badge&logo=java&logoColor=white)]()
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)]()
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)]()
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)]()
[![Microsoft SQL Server](https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)]()
[![Apache Tomcat](https://img.shields.io/badge/Apache_Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)]()
[![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)]()
[![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)]()

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Database Setup](#database-setup)
  - [Usage (Deployment & Access)](#usage-deployment--access)
- [Project Structure](#project-structure)
- [Screenshots (Optional)](#screenshots-optional)
- [Future Enhancements (Optional)](#future-enhancements-optional)

---

## Overview

Đây là dự án cho môn học PRJ301, một ứng dụng web thương mại điện tử mô phỏng cửa hàng trực tuyến bán các sản phẩm của Apple (iPhone, iPad, MacBook, Apple Watch, v.v.). Dự án được xây dựng theo kiến trúc Model-View-Controller (MVC):
*   **Model:** Các lớp Java (JavaBeans/POJOs) đại diện cho dữ liệu (Sản phẩm, Người dùng, Đơn hàng, Giỏ hàng) và các lớp DAO (Data Access Objects) để tương tác với cơ sở dữ liệu Microsoft SQL Server.
*   **View:** Các trang JSP (JavaServer Pages) để hiển thị giao diện người dùng và dữ liệu sản phẩm.
*   **Controller:** Các Java Servlets xử lý yêu cầu từ người dùng, tương tác với Model và chọn View phù hợp để phản hồi.

---

## Features

Các tính năng chính của trang web bán sản phẩm Apple:

- 🛍️ **Hiển thị sản phẩm:**
    -   Liệt kê sản phẩm theo danh mục (iPhone, iPad, MacBook, etc.).
    -   Trang chi tiết sản phẩm với hình ảnh, mô tả, thông số kỹ thuật, giá bán.
    -   Phân trang cho danh sách sản phẩm.
- 🔍 **Tìm kiếm và Lọc sản phẩm:**
    -   Tìm kiếm sản phẩm theo tên.
    -   (Tùy chọn) Lọc sản phẩm theo giá, dung lượng, màu sắc, v.v.
- 🛒 **Giỏ hàng:**
    -   Thêm sản phẩm vào giỏ hàng.
    -   Xem và cập nhật số lượng sản phẩm trong giỏ hàng.
    -   Xóa sản phẩm khỏi giỏ hàng.
- 👤 **Quản lý tài khoản người dùng:**
    -   Đăng ký tài khoản mới.
    -   Đăng nhập, đăng xuất.
    -   (Tùy chọn) Xem lịch sử đặt hàng.
    -   (Tùy chọn) Cập nhật thông tin cá nhân.
- 💳 **Đặt hàng và Thanh toán (Mô phỏng):**
    -   Quy trình đặt hàng (checkout) với thông tin giao hàng.
    -   (Tùy chọn) Mô phỏng các phương thức thanh toán.
- 👨‍💼 **(Admin Panel - Tùy chọn mở rộng):**
    -   Quản lý sản phẩm (thêm, sửa, xóa).
    -   Quản lý danh mục.
    -   Xem và quản lý đơn hàng.
    -   Quản lý tài khoản người dùng.

---

## Getting Started

Hướng dẫn để cài đặt và chạy dự án trên máy cục bộ.

### Prerequisites

Các phần mềm và công cụ cần thiết để chạy dự án:

- **Java Development Kit (JDK):** Phiên bản 8, 11 hoặc 17.
- **Apache Maven:** Phiên bản 3.6+
- **Apache Tomcat:** Phiên bản 9.0 hoặc 10.0.
- **Microsoft SQL Server:** Phiên bản 2019 Developer Edition (hoặc tương đương).
- **IDE (Tùy chọn):** IntelliJ IDEA, Eclipse (với WTP), NetBeans.
- **Trình duyệt Web:** Chrome, Firefox, Edge.

### Installation

Các bước để cài đặt dự án:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Naammmdz/PRJ301-ASSIGNMENT.git
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd PRJ301-ASSIGNMENT
    ```

3.  **Build the project** (sử dụng Maven để tạo file `.war`):
    ```bash
    mvn clean package
    ```
    Thao tác này sẽ tạo một file `.war` (ví dụ: `AppleStore.war` hoặc tên bạn đặt trong `pom.xml`) trong thư mục `target`.

### Database Setup

Hướng dẫn cài đặt cơ sở dữ liệu:

1.  **Mở Microsoft SQL Server Management Studio (SSMS)**.
2.  **Kết nối** tới instance SQL Server của bạn.
3.  **Tạo một database mới** (ví dụ: `AppleStoreDB`).
4.  **Chạy các scripts SQL** có trong thư mục `database_scripts` (hoặc đường dẫn bạn lưu trữ scripts) để tạo cấu trúc bảng (Products, Categories, Users, Orders, OrderDetails, Cart, etc.) và chèn dữ liệu mẫu.
    *   Ví dụ: `schema.sql` để tạo bảng, `sample_data_apple_products.sql` để chèn dữ liệu sản phẩm Apple.
5.  **Cấu hình kết nối CSDL trong dự án:**
    *   Trong lớp tiện ích Java (ví dụ: `DBContext.java`):
        ```java
        // Trong lớp DBContext.java hoặc tương tự
        private final String serverName = "localhost"; // Hoặc tên server của bạn
        private final String dbName = "AppleStoreDB";   // Tên database bạn đã tạo
        private final String portNumber = "1433";
        private final String userID = "your_sql_username"; // Username SQL Server
        private final String password = "your_sql_password"; // Password SQL Server

        public Connection getConnection() throws Exception {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName +";encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, userID, password);
        }
        ```
    *   **Quan trọng:** Đảm bảo `mssql-jdbc` driver đã được thêm vào `pom.xml`:
        ```xml
        <dependency>
            <groupId>com.microsoft.sqlserver</groupId>
            <artifactId>mssql-jdbc</artifactId>
            <version>9.4.1.jre11</version> <!-- Hoặc phiên bản mới hơn/phù hợp -->
        </dependency>
        ```

### Usage (Deployment & Access)

Hướng dẫn cách deploy và truy cập ứng dụng:

1.  **Sao chép file `.war`** (từ thư mục `target`) vào thư mục `webapps` của Apache Tomcat.
    *   Ví dụ: `C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\AppleStore.war`

2.  **Start (hoặc Restart) Apache Tomcat server.**

3.  **Truy cập ứng dụng** qua trình duyệt web:
    `http://localhost:[cổng_tomcat]/[tên_file_war_không_có_đuôi_war]`
    *   Ví dụ: `http://localhost:8080/AppleStore/`

---

## Project Structure

Cấu trúc thư mục chính của dự án:
```
PRJ301-ASSIGNMENT/
├── src/
│   ├── main/
│   │   ├── java/                     -- Lớp Java (Servlets, Filters, JavaBeans, DAO, Utils)
│   │   │   └── com/naammmdz/prj301/  -- (Hoặc package của bạn)
│   │   │       ├── controller/       -- Servlets (ProductController, CartController, UserController, etc.)
│   │   │       ├── model/            -- JavaBeans (Product, User, Order, CartItem, etc.)
│   │   │       ├── dao/              -- DAO (ProductDAO, UserDAO, OrderDAO, etc.)
│   │   │       └── utils/            -- Tiện ích (DBContext, PasswordHashing, etc.)
│   │   ├── webapp/                   -- Thư mục gốc ứng dụng web
│   │   │   ├── WEB-INF/
│   │   │   │   ├── web.xml           -- Deployment descriptor
│   │   │   │   └── lib/              -- (Thư viện do Maven quản lý)
│   │   │   ├── css/                  -- Files CSS
│   │   │   ├── js/                   -- Files JavaScript
│   │   │   ├── images/               -- Hình ảnh sản phẩm, logo
│   │   │   ├── views/                -- (Thư mục chứa các trang JSP)
│   │   │   │   ├── product/          -- productList.jsp, productDetail.jsp
│   │   │   │   ├── cart/             -- cart.jsp
│   │   │   │   ├── user/             -- login.jsp, register.jsp, profile.jsp
│   │   │   │   ├── common/           -- header.jsp, footer.jsp, navigation.jsp
│   │   │   │   └── home.jsp          -- Trang chủ
│   │   │   └── index.jsp             -- (Có thể redirect về home.jsp hoặc một servlet)
│   │   └── resources/                -- (Các file cấu hình khác nếu có)
├── database_scripts/                 -- Scripts SQL (schema.sql, sample_data_apple_products.sql)
├── pom.xml                           -- File cấu hình Maven
└── README.md
```

---

## Screenshots (Optional)

Thêm một vài ảnh chụp màn hình giao diện chính của ứng dụng (trang chủ, trang sản phẩm, giỏ hàng).

```
![Trang chủ](path/to/screenshot_home.png)
![Trang sản phẩm](path/to/screenshot_product_detail.png)
```

---

## Future Enhancements (Optional)

Liệt kê các ý tưởng để phát triển thêm cho dự án:

-   Tích hợp thanh toán trực tuyến thực tế.
-   Hệ thống đánh giá sản phẩm.
-   Gợi ý sản phẩm liên quan.
-   Chức năng quản trị viên nâng cao.
-   Tối ưu hóa hiệu năng và bảo mật.

---

⬆️ [Return to Top](#table-of-contents)
