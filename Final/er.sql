-- Create Database

CREATE DATABASE DBLab
USE DBLab


-- Create Customer Table

CREATE TABLE customer
(
    customer_id INT NOT NULL,
    Names VARCHAR(30),
    age INT,
    city VARCHAR(25),

    PRIMARY KEY(customer_id)
)


-- Insert Data into Customer Table

INSERT INTO customer(customer_id, Names, age, city)
VALUES
(9, 'Rahim', 25, 'Dhaka'),
(2, 'Karim', 30, 'Khulna'),
(5, 'Ayesha', 22, 'Chittagong')


-- Show Customer Table

SELECT * FROM customer


-- Create Orders Table

CREATE TABLE orders
(
    order_id INT NOT NULL,
    customer_id INT,
    product_id INT,
    Times DATETIME,

    PRIMARY KEY(order_id),

    FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
)


-- Non-Clustered Index

CREATE NONCLUSTERED INDEX customer_index
ON customer(Names)


-- Search Query

SELECT * FROM customer
WHERE Names = 'Rahim'


-- Create Products Table

CREATE TABLE products
(
    product_id INT,
    order_id INT,
    Quantity INT,
    price INT,

    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
)