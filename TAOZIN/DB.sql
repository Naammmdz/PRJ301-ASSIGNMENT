CREATE TABLE tblUsers (
    userID INT IDENTITY(1,1) PRIMARY KEY,
    fullName NVARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    roleID CHAR(2) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE tblOrders (
    orderID INT IDENTITY(1,1) PRIMARY KEY,
    code NVARCHAR(1028) NOT NULL,
    status NVARCHAR(1028) NOT NULL,
    userID INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (userID) REFERENCES tblUsers(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tblCategories (
    categoryID INT IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(128) NOT NULL,
    thumbnail NVARCHAR(1024)
);

CREATE TABLE tblProducts (
    productID INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(128) NOT NULL,
    description TEXT,
    price DECIMAL(10,0) NOT NULL,
    stockQuantity INT NOT NULL,
    productView INT DEFAULT 0,
    categoryID INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (categoryID) REFERENCES tblCategories(categoryID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE tblOrderItems (
    orderItemID INT IDENTITY(1,1) PRIMARY KEY,
    quantity INT NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    FOREIGN KEY (orderID) REFERENCES tblOrders(orderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProducts(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE tblProducts ADD thumbnail NVARCHAR(1024) NULL;

INSERT INTO tblProducts (productName, description, price, stockQuantity, productView, categoryID, created_at, thumbnail) 
VALUES 
('iPhone 15 Pro Max', 'Màn hình 6.7 inch, chip A17 Pro, camera 48MP', 33990000, 10, 0, 1, GETDATE(), 'assets/image/iphone15promax.jpg'),
('iPhone 15 Pro', 'Màn hình 6.1 inch, chip A17 Pro, camera 48MP', 29990000, 15, 0, 1, GETDATE(), 'assets/image/iphone15pro.jpg'),
('iPhone 15', 'Màn hình 6.1 inch, chip A16 Bionic, camera 48MP', 22990000, 20, 0, 1, GETDATE(), 'assets/image/iphone15.jpg');

INSERT INTO tblCategories (categoryName, thumbnail) 
VALUES ('iPhone', 'assets/image/iphone15promax.jpg');

SELECT * FROM tblProducts

INSERT INTO tblCategories (categoryName, thumbnail) 
VALUES 
('iPad', 'assets/image/ipad.jpg'),
('MacBook', 'assets/image/macbook.jpg'),
(N'Âm thanh', 'assets/image/speaker.jpg'),
(N'Phụ kiện', 'assets/image/accessory.jpg');

INSERT INTO tblProducts (productName, description, price, stockQuantity, productView, categoryID, created_at, thumbnail)
VALUES 
('iPad Pro 12.9 M2', 'Màn hình 12.9 inch, chip M2, 128GB', 27990000, 10, 50, 2, GETDATE(), 'assets/image/ipad_pro_m2.jpg'),
('iPad Air 5', 'Màn hình 10.9 inch, chip M1, 64GB', 16990000, 15, 40, 2, GETDATE(), 'assets/image/ipad_air_5.jpg'),
('iPad Mini 6', 'Màn hình 8.3 inch, chip A15 Bionic, 64GB', 13990000, 20, 30, 2, GETDATE(), 'assets/image/ipad_mini_6.jpg'),
('iPad Gen 10', 'Màn hình 10.9 inch, chip A14 Bionic, 64GB', 10990000, 25, 35, 2, GETDATE(), 'assets/image/ipad_10.jpg');

INSERT INTO tblProducts (productName, description, price, stockQuantity, productView, categoryID, created_at, thumbnail)
VALUES 
('MacBook Pro 16 M3 Max', 'Màn hình 16 inch, chip M3 Max, RAM 32GB, SSD 1TB', 79990000, 10, 100, 3, GETDATE(), 'assets/image/macbook_pro_16_m3.jpg'),
('MacBook Pro 14 M3 Pro', 'Màn hình 14 inch, chip M3 Pro, RAM 16GB, SSD 512GB', 59990000, 15, 80, 3, GETDATE(), 'assets/image/macbook_pro_14_m3.jpg'),
('MacBook Air 15 M2', 'Màn hình 15 inch, chip M2, RAM 8GB, SSD 256GB', 31990000, 20, 90, 3, GETDATE(), 'assets/image/macbook_air_15_m2.jpg'),
('MacBook Air 13 M2', 'Màn hình 13.6 inch, chip M2, RAM 8GB, SSD 256GB', 26990000, 25, 95, 3, GETDATE(), 'assets/image/macbook_air_13_m2.jpg');

ALTER TABLE tblUsers 
ADD email VARCHAR(100) NULL,
    address NVARCHAR(255) NULL;