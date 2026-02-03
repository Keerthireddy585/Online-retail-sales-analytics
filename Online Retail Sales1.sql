CREATE DATABASE Online_Retail_Sales;

USE Online_Retail_Sales;

-- Customers Table
CREATE TABLE Customers (
	Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(100) UNIQUE,
	Phone VARCHAR(20),
	Address VARCHAR(200),
	City VARCHAR(50),
	Country VARCHAR(50)
);


CREATE TABLE Categories (
	Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) NOT NULL
);


CREATE TABLE Products (
	Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID INT,
    Price DECIMAL(10,2),
    Stock_quantity INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);


CREATE TABLE Orders (
	Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Order_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);


CREATE TABLE Order_details (
	Order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
	Product_ID INT,
    Quantity INT,
    PRICE DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);


CREATE TABLE Payments (
	Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_method VARCHAR(50),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Customers (First_Name, Last_Name, Email, Phone, Address, City, Country) VALUES
('John', 'Doe', 'john@gmail.com', '1234567890', '123 Main St', 'New York', 'USA'),
('Charlie', 'Ken', 'charlie5a@gmail.com', '2748988032', 'Chaplin St-5', 'California', 'USA'),
('Emily', 'Fernandez', 'emily05@gmail.com', '4656884389', 'George street 1A', 'Birmingham', 'UK'),
('Jordan', 'Henrich', 'henrichjor@gmail.com', '5674687433', 'Saint catherine street', 'Montreal', 'Canada'),
('Hannah', 'Jones', 'hennahj@gmail.com', '1768463467', '25 baker street', 'Manchester', 'UK');

INSERT INTO Categories (Category_Name) Values
('Clothing'),
('Beauty & Personal care'),
('Electronics'),
('Sports wear'),
('Jewellery & Accessories'), 
('Home & Furniture'), 
('Baby & Kids');
 
 -- Clothing (category_id = 1)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Men T-Shirt', 1, 499.00, 50),
('Women Jeans', 1, 1299.00, 40),
('Formal Shirt', 1, 999.00, 30),
('Summer Dress', 1, 1499.00, 25),
('Jacket', 1, 2499.00, 20);

-- Beauty & Personal Care (category_id = 2)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Face Wash', 2, 299.00, 100),
('Shampoo', 2, 499.00, 80),
('Moisturizer', 2, 599.00, 60),
('Perfume', 2, 1499.00, 25),
('Lipstick', 2, 399.00, 70);

-- Electronics (category_id = 3)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Laptop', 3, 75000.00, 10),
('Smartphone', 3, 35000.00, 25),
('Headphones', 3, 2000.00, 100),
('Smartwatch', 3, 5000.00, 15),
('Tablet', 3, 22000.00, 12);

-- Sports Wear (category_id = 4)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Running Shoes', 4, 2999.00, 15),
('Yoga Pants', 4, 999.00, 30),
('Sports T-Shirt', 4, 799.00, 60),
('Tracksuit', 4, 1499.00, 20),
('Gym Bag', 4, 1200.00, 18);

-- Jewellery & Accessories (category_id = 5)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Gold Necklace', 5, 25000.00, 5),
('Silver Earrings', 5, 1999.00, 20),
('Bracelet', 5, 2999.00, 15),
('Wrist Watch', 5, 4500.00, 12),
('Handbag', 5, 3499.00, 10);

-- Home & Furniture (category_id = 6)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Sofa Set', 6, 45000.00, 5),
('Dining Table', 6, 25000.00, 8),
('Bed', 6, 30000.00, 6),
('Dressing Mirror', 6, 5000.00, 12),
('Bookshelf', 6, 7000.00, 10);

-- Baby & Kids (category_id = 7)
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Baby Stroller', 7, 8000.00, 8),
('Toy Car', 7, 1200.00, 25),
('Kids T-Shirt', 7, 499.00, 40),
('School Bag', 7, 999.00, 30),
('Baby Diapers Pack', 7, 899.00, 50);
 
INSERT INTO Orders (Customer_ID, Order_Date, Status) VALUES
(1, '2025-08-15', 'Shipped'),
(2, '2025-08-16', 'Pending'),
(3, '2025-08-17', 'Delivered'),
(1, '2025-08-18', 'Cancelled'),
(4, '2025-08-19', 'Shipped');

INSERT INTO Orders (Customer_ID, Order_Date, Status) VALUES
(5, '2025-07-10', 'Delivered'),   
(3, '2025-07-22', 'Shipped'),     
(2, '2025-09-05', 'Delivered'),   
(4, '2025-09-18', 'Pending'),     
(1, '2025-10-02', 'Shipped'),     
(5, '2025-10-15', 'Delivered');   

INSERT INTO Order_details (Order_ID, Product_ID, Quantity, Price) VALUES
(1, 1, 1, 75000),
(2, 2, 2, 499),
(2, 3, 1, 2499),
(3, 4, 1, 1499),
(1, 5, 1, 5000),
(4, 6, 1, 2999);

INSERT INTO Order_details (Order_ID, Product_ID, Quantity, Price) VALUES
(6, 11, 1, 75000),
(6, 13, 2, 2000),
(7, 4, 1, 1499),
(7, 9, 1, 1499),
(8, 12, 1, 35000),
(8, 20, 1, 1200),
(9, 21, 1, 45000),
(9, 22, 1, 25000),
(10, 16, 1, 2999),
(10, 14, 1, 5000),
(11, 31, 1, 8000),
(11, 32, 2, 1200);

INSERT INTO Order_details (Order_ID, Product_ID, Quantity, Price) VALUES
(5, 7, 2, 499),
(5, 8, 1, 599);

ALTER TABLE Order_Details
ADD CONSTRAINT chk_quantity CHECK (Quantity > 0),
ADD CONSTRAINT chk_price CHECK (Price >= 0);

INSERT INTO Payments (Order_ID, Payment_Date, Amount, Payment_method)
VALUES 
(1, '2025-08-21', 80000.00, 'Credit Card'),   
(2, '2025-08-22', 3497.00, 'UPI'),           
(3, '2025-08-23', 1499.00, 'Net Banking'),   
(4, '2025-08-24', 2999.00, 'Debit Card'),
(5, '2025-08-25', 0.00, 'N/A');

INSERT INTO Payments (Order_ID, Payment_Date, Amount, Payment_method) VALUES
(6, '2025-07-12', 79000.00, 'Credit Card'),
(7, '2025-07-23', 2998.00, 'UPI'),
(8, '2025-09-06', 36200.00, 'Debit Card'),
(9, '2025-09-20', 70000.00, 'Net Banking'),
(10, '2025-10-03', 7999.00, 'UPI'),
(11, '2025-10-16', 10400.00, 'Credit Card');

UPDATE Payments
SET Amount = 1597.00, Payment_method = 'Credit Card'
WHERE Order_ID = 5;

ALTER TABLE Payments
ADD CONSTRAINT chk_amount CHECK (Amount >= 0);

-- Get all customer orders with products
SELECT c.First_Name, c.Last_Name, o.Order_ID, p.Product_Name
FROM Customers C
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Order_details od ON o.Order_ID = od.Order_ID
JOIN Products p ON od.Product_ID = p.Product_ID;


-- Find total sales by category
SELECT cat.Category_Name, SUM(od.Quantity * od.Price) AS Total_sales
FROM Order_details od
JOIN Products p ON od.product_id = p.product_id
JOIN Categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;


-- Top 5 customers by total spending
SELECT c.First_Name, c.Last_Name, SUM(pay.Amount) AS Total_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Payments pay ON o.Order_ID = pay.Order_ID
GROUP BY c.Customer_ID
ORDER BY Total_spent DESC
LIMIT 5;


-- Monthly Sales trend
SELECT DATE_FORMAT(o.Order_Date, '%y-%m') AS Month, SUM(pay.Amount) AS Total_Sales
FROM Orders o
JOIN Payments pay ON o.Order_ID = pay.Order_ID
GROUP BY Month
ORDER BY Month;


-- Most Popular Products (by Quantity Ordered)
SELECT p.Product_Name, SUM(od.Quantity) AS Total_Quantity
FROM Order_details od
JOIN Products p ON od.Product_ID = p.Product_ID
GROUP BY p.Product_ID
ORDER BY Total_Quantity DESC
LIMIT 5;


-- Revenue by Country
SELECT c.Country, SUM(pay.Amount) AS Revenue
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Payments pay ON o.Order_ID = pay.Order_ID
GROUP BY c.Country
ORDER BY Revenue DESC;


-- Cancelled Orders Impact
SELECT COUNT(*) AS Cancelled_Orders, SUM(pay.Amount) AS Lost_Revenue
FROM Orders o
LEFT JOIN Payments pay ON o.Order_ID = pay.Order_ID
WHERE o.Status = 'Cancelled';


-- Customer Lifetime value
SELECT c.Customer_ID, c.First_Name, c.Last_Name, SUM(pay.Amount) AS Lifetime_value
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN payments pay ON o.Order_ID = pay.Order_ID
GROUP BY c.Customer_ID
ORDER BY Lifetime_value DESC;


-- View for Sales by Category
CREATE VIEW Category_Sales AS
SELECT cat.Category_Name, SUM(od.Quantity * od.Price) AS Total_Sales
FROM Order_details od
JOIN Products p ON od.Product_ID = p.Product_ID
JOIN Categories cat ON p.Category_ID = cat.Category_ID
GROUP BY cat.Category_Name;

SELECT * FROM Category_Sales


-- Stored procedure for top customers(parameterized) 
DELIMITER //
CREATE PROCEDURE GetTopCustomers(IN limit_num INT)
BEGIN
  SELECT c.First_Name, c.Last_Name, SUM(pay.Amount) AS Total_Spent
  FROM Customers c
  JOIN Orders o ON c.Customer_ID = o.Customer_ID
  JOIN Payments pay ON o.Order_ID = pay.Order_ID
  GROUP BY c.Customer_ID
  ORDER BY Total_Spent DESC
  LIMIT limit_num;
END //
DELIMITER ;

CALL GetTopCustomers(5);


-- Payments Matching Order Details
UPDATE Payments p
JOIN (
  SELECT Order_ID, SUM(Quantity * Price) AS Total
  FROM Order_Details
  GROUP BY Order_ID
) od_total ON p.Order_ID = od_total.Order_ID
SET p.Amount = od_total.Total;