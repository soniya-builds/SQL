-- DATABASE CREATE

-- Question:
-- Create database for cascading update and delete.

CREATE DATABASE CascadeDB

USE CascadeDB


-- PARENT TABLE

-- Question:
-- Create parent table customer.

CREATE TABLE customer
(
    customer_id INT NOT NULL,
    Names VARCHAR(30),
    age INT,
    city VARCHAR(25),

    PRIMARY KEY(customer_id)
)


-- INSERT INTO CUSTOMER

-- Question:
-- Insert data into customer table.

INSERT INTO customer
VALUES
(1, 'Rahim', 25, 'Dhaka'),
(2, 'Karim', 30, 'Khulna'),
(3, 'Ayesha', 22, 'Chittagong')


-- SHOW CUSTOMER TABLE

-- Question:
-- Show customer table.

SELECT * FROM customer


-- CHILD TABLE

-- Question:
-- Create child table orders with
-- ON DELETE CASCADE and ON UPDATE CASCADE.

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


-- INSERT INTO ORDERS

-- Question:
-- Insert data into orders table.

INSERT INTO orders
VALUES
(101, 1, 201, GETDATE()),
(102, 2, 202, GETDATE()),
(103, 1, 203, GETDATE()),
(104, 3, 204, GETDATE())


-- SHOW ORDERS TABLE

-- Question:
-- Show orders table.

SELECT * FROM orders


-- CASCADING UPDATE

-- Question:
-- Update parent table primary key and
-- automatically update child table foreign key.

UPDATE customer
SET customer_id = 10
WHERE customer_id = 1


-- SHOW RESULT AFTER UPDATE

-- Question:
-- Show customer table after update.

SELECT * FROM customer


-- Question:
-- Show orders table after update.

SELECT * FROM orders


-- Result:
-- customer_id = 1 becomes 10 in customer table
-- orders table customer_id also automatically becomes 10


-- CASCADING DELETE

-- Question:
-- Delete parent table data and automatically
-- delete child table related data.

DELETE FROM customer
WHERE customer_id = 2


-- SHOW RESULT AFTER DELETE

-- Question:
-- Show customer table after delete.

SELECT * FROM customer


-- Question:
-- Show orders table after delete.

SELECT * FROM orders


-- Result:
-- customer_id = 2 deleted from customer table
-- related rows also deleted automatically from orders table


-- ER DIAGRAM STRUCTURE

-- Question:
-- Understand ER relationship.

-- One customer can have many orders.

-- customer (Parent Table)
--        1
--        |
--        |
--        M
-- orders (Child Table)


-- INDEXING

-- Question:
-- Create clustered index.

CREATE CLUSTERED INDEX customer_clustered_index
ON customer(customer_id)



-- Question:
-- Create nonclustered index.

CREATE NONCLUSTERED INDEX customer_name_index
ON customer(Names)



-- Question:
-- Search using index.

SELECT *
FROM customer
WHERE Names = 'Rahim'


-- VIEW

-- Question:
-- Create view for all customers.

CREATE VIEW V_AllCustomer
AS
SELECT *
FROM customer



-- Question:
-- Create view using join.

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


-- STORED PROCEDURE

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



-- Question:
-- Create stored procedure with parameter.

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

EXEC SP_FindCustomer 10


-- AGGREGATE FUNCTIONS

-- Question:
-- Find maximum age.

SELECT MAX(age) AS MaximumAge
FROM customer



-- Question:
-- Find average age.

SELECT AVG(age) AS AverageAge
FROM customer



-- Question:
-- Count total customers.

SELECT COUNT(customer_id) AS TotalCustomer
FROM customer


-- GROUP BY

-- Question:
-- Count customers by city.

SELECT
    city,
    COUNT(customer_id) AS TotalCustomer
FROM customer
GROUP BY city


-- HAVING

-- Question:
-- Show cities having more than one customer.

SELECT
    city,
    COUNT(customer_id) AS TotalCustomer
FROM customer
GROUP BY city
HAVING COUNT(customer_id) > 1


-- SUBQUERY

-- Question:
-- Find customer having maximum age.

SELECT *
FROM customer
WHERE age =
(
    SELECT MAX(age)
    FROM customer
)


-- DROP TABLE

-- Question:
-- Drop child table first.

DROP TABLE orders



-- Question:
-- Drop parent table.

DROP TABLE customer