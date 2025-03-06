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