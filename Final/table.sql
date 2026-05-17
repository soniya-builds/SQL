-- =========================================================
-- DATABASE CREATE
-- =========================================================

-- Question:
-- Create a database named DBLab and use it.

CREATE DATABASE DBLab

USE DBLab


-- =========================================================
-- CUSTOMER TABLE (PARENT TABLE)
-- =========================================================

-- Question:
-- Create Customer table.

CREATE TABLE customer
(
    customer_id INT NOT NULL,
    Names VARCHAR(30),
    age INT,
    city VARCHAR(25),

    PRIMARY KEY(customer_id)
)


-- =========================================================
-- INSERT INTO CUSTOMER
-- =========================================================

-- Question:
-- Insert values into customer table.

INSERT INTO customer(customer_id, Names, age, city)
VALUES
(1, 'Rahim', 25, 'Dhaka'),
(2, 'Karim', 30, 'Khulna'),
(3, 'Ayesha', 22, 'Chittagong'),
(4, 'Nusrat', 28, 'Rajshahi')


-- =========================================================
-- SHOW CUSTOMER TABLE
-- =========================================================

-- Question:
-- Show all customer information.

SELECT * FROM customer


-- =========================================================
-- ORDERS TABLE (CHILD TABLE)
-- =========================================================

-- Question:
-- Create Orders table with foreign key.

CREATE TABLE orders
(
    order_id INT NOT NULL,
    customer_id INT,
    product_id INT,
    Times DATETIME,

    PRIMARY KEY(order_id),

    FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)


-- =========================================================
-- INSERT INTO ORDERS
-- =========================================================

-- Question:
-- Insert values into orders table.

INSERT INTO orders
VALUES
(101, 1, 201, GETDATE()),
(102, 2, 202, GETDATE()),
(103, 1, 203, GETDATE()),
(104, 3, 204, GETDATE())


-- =========================================================
-- SHOW ORDERS TABLE
-- =========================================================

-- Question:
-- Show all orders.

SELECT * FROM orders


-- =========================================================
-- PRODUCTS TABLE
-- =========================================================

-- Question:
-- Create Products table with foreign key.

CREATE TABLE products
(
    product_id INT,
    order_id INT,
    Quantity INT,
    price INT,

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)


-- =========================================================
-- INSERT INTO PRODUCTS
-- =========================================================

-- Question:
-- Insert values into products table.

INSERT INTO products
VALUES
(201, 101, 2, 500),
(202, 102, 1, 700),
(203, 103, 5, 300),
(204, 104, 3, 1000)


-- =========================================================
-- SHOW PRODUCTS TABLE
-- =========================================================

-- Question:
-- Show all products.

SELECT * FROM products


-- =========================================================
-- INDEXING
-- =========================================================

-- Question:
-- Create clustered index on customer_id.

CREATE CLUSTERED INDEX customer_clustered_index
ON customer(customer_id)


-- Question:
-- Create nonclustered index on customer name.

CREATE NONCLUSTERED INDEX customer_index
ON customer(Names)


-- Question:
-- Create unique nonclustered index on city.

CREATE UNIQUE NONCLUSTERED INDEX city_index
ON customer(city)


-- Question:
-- Search customer using index.

SELECT *
FROM customer
WHERE Names = 'Rahim'


-- Question:
-- Delete index.

DROP INDEX customer_index
ON customer


-- =========================================================
-- STORED PROCEDURE
-- =========================================================

-- Question:
-- Create stored procedure to show all customers.

CREATE PROCEDURE SP_AllCustomer
AS
BEGIN
    SELECT *
    FROM customer
END


-- Question:
-- Execute stored procedure.

EXEC SP_AllCustomer


-- =========================================================

-- Question:
-- Create stored procedure to find customer by ID.

CREATE PROCEDURE SP_FindCustomer
    @CustomerID INT
AS
BEGIN
    SELECT *
    FROM customer
    WHERE customer_id = @CustomerID
END


-- Question:
-- Execute stored procedure with parameter.

EXEC SP_FindCustomer 1


-- =========================================================

-- Question:
-- Create stored procedure to show customers from specific city.

CREATE PROCEDURE SP_CityCustomer
    @City VARCHAR(30)
AS
BEGIN
    SELECT *
    FROM customer
    WHERE city = @City
END


-- =========================================================

-- Question:
-- Create stored procedure using output parameter.

CREATE PROCEDURE SP_TotalCustomer
    @Total INT OUTPUT
AS
BEGIN
    SELECT @Total = COUNT(customer_id)
    FROM customer
END


-- =========================================================

-- Question:
-- Create stored procedure using return value.

CREATE PROCEDURE SP_MaxAge
AS
BEGIN
    DECLARE @MaxAge INT

    SELECT @MaxAge = MAX(age)
    FROM customer

    RETURN @MaxAge
END


-- =========================================================
-- VIEW
-- =========================================================

-- Question:
-- Create view for all customers.

CREATE VIEW V_AllCustomer
AS
SELECT *
FROM customer


-- =========================================================

-- Question:
-- Create view for customers from Dhaka.

CREATE VIEW V_DhakaCustomer
AS
SELECT *
FROM customer
WHERE city = 'Dhaka'


-- =========================================================

-- Question:
-- Create view using INNER JOIN.

CREATE VIEW V_CustomerOrders
AS
SELECT
    customer.customer_id,
    Names,
    city,
    order_id,
    product_id
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id


-- =========================================================

-- Question:
-- Create view for product details.

CREATE VIEW V_ProductDetails
AS
SELECT
    products.product_id,
    Quantity,
    price,
    order_id
FROM products


-- =========================================================

-- Question:
-- Create view for total products price.

CREATE VIEW V_TotalPrice
AS
SELECT
    SUM(price) AS TotalPrice
FROM products


-- =========================================================
-- JOINS
-- =========================================================

-- Question:
-- Show customer and order information using INNER JOIN.

SELECT
    customer.customer_id,
    Names,
    order_id
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id


-- =========================================================

-- Question:
-- Show all customers even if no orders exist using LEFT JOIN.

SELECT
    customer.customer_id,
    Names,
    order_id
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id


-- =========================================================

-- Question:
-- Show all orders even if customer does not exist using RIGHT JOIN.

SELECT
    customer.customer_id,
    Names,
    order_id
FROM customer
RIGHT JOIN orders
ON customer.customer_id = orders.customer_id


-- =========================================================

-- Question:
-- Show matching data using FULL JOIN.

SELECT
    customer.customer_id,
    Names,
    order_id
FROM customer
FULL JOIN orders
ON customer.customer_id = orders.customer_id


-- =========================================================
-- AGGREGATE FUNCTIONS
-- =========================================================

-- Question:
-- Find maximum age.

SELECT MAX(age) AS MaximumAge
FROM customer


-- =========================================================

-- Question:
-- Find minimum age.

SELECT MIN(age) AS MinimumAge
FROM customer


-- =========================================================

-- Question:
-- Find average age.

SELECT AVG(age) AS AverageAge
FROM customer


-- =========================================================

-- Question:
-- Count total customers.

SELECT COUNT(customer_id) AS TotalCustomer
FROM customer


-- =========================================================

-- Question:
-- Find total product price.

SELECT SUM(price) AS TotalPrice
FROM products


-- =========================================================
-- GROUP BY
-- =========================================================

-- Question:
-- Count customers based on city.

SELECT
    city,
    COUNT(customer_id) AS TotalCustomer
FROM customer
GROUP BY city


-- =========================================================
-- HAVING
-- =========================================================

-- Question:
-- Show cities having more than one customer.

SELECT
    city,
    COUNT(customer_id) AS TotalCustomer
FROM customer
GROUP BY city
HAVING COUNT(customer_id) > 1


-- =========================================================
-- SUBQUERY
-- =========================================================

-- Question:
-- Find customer having maximum age.

SELECT *
FROM customer
WHERE age =
(
    SELECT MAX(age)
    FROM customer
)


-- =========================================================

-- Question:
-- Find product having highest price.

SELECT *
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
)


-- =========================================================
-- UPDATE CASCADE
-- =========================================================

-- Question:
-- Update customer ID and automatically update child table.

UPDATE customer
SET customer_id = 10
WHERE customer_id = 1


-- =========================================================
-- DELETE CASCADE
-- =========================================================

-- Question:
-- Delete customer and automatically delete related orders.

DELETE FROM customer
WHERE customer_id = 2


-- =========================================================
-- ALTER TABLE
-- =========================================================

-- Question:
-- Add email column.

ALTER TABLE customer
ADD email VARCHAR(50)


-- =========================================================

-- Question:
-- Delete email column.

ALTER TABLE customer
DROP COLUMN email


-- =========================================================
-- DROP TABLE
-- =========================================================

-- Question:
-- Drop products table.

DROP TABLE products


-- =========================================================

-- Question:
-- Drop orders table.

DROP TABLE orders


-- =========================================================

-- Question:
-- Drop customer table.

DROP TABLE customer