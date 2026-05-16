-- Question 1:
-- Write a query to create a view for those salesmen belongs to the city New York.

CREATE VIEW V_NewYorkSalesman
AS
SELECT *
FROM salesman
WHERE city = 'New York'


-- Question 2:
-- Write a query to create a view for all salesmen with columns salesman_id, name and city.

CREATE VIEW V_SalesmanInfo
AS
SELECT salesman_id, name, city
FROM salesman


-- Question 3:
-- Write a query to find the salesmen of the city New York who achieved
-- the commission more than 13%.

CREATE VIEW V_HighCommission
AS
SELECT *
FROM salesman
WHERE city = 'New York'
AND commission > 0.13


-- Question 4:
-- Write a query to create a view to getting a count of how many customers
-- we have at each level of a grade.

CREATE VIEW V_CustomerGrade
AS
SELECT grade, COUNT(customer_id) AS TotalCustomer
FROM customer
GROUP BY grade


-- Question 5:
-- Write a query to create a view to keeping track the number of customers ordering,
-- number of salesmen attached, average amount of orders and total amount of orders in a day.

CREATE VIEW V_OrderSummary
AS
SELECT 
    ord_date,
    COUNT(customer_id) AS TotalCustomer,
    COUNT(DISTINCT salesman_id) AS TotalSalesman,
    AVG(purch_amt) AS AverageOrder,
    SUM(purch_amt) AS TotalOrder
FROM orders
GROUP BY ord_date


-- Question 6:
-- Write a query to create a view that shows for each order
-- the salesman and customer by name.

CREATE VIEW V_OrderDetails
AS
SELECT 
    ord_no,
    cust_name,
    name
FROM orders
INNER JOIN customer
ON orders.customer_id = customer.customer_id
INNER JOIN salesman
ON orders.salesman_id = salesman.salesman_id


-- Question 7:
-- Write a query to create a view that finds the salesman who has
-- the customer with the highest order of a day.

CREATE VIEW V_HighestOrder
AS
SELECT 
    ord_date,
    name,
    MAX(purch_amt) AS HighestAmount
FROM orders
INNER JOIN salesman
ON orders.salesman_id = salesman.salesman_id
GROUP BY ord_date, name


-- Question 8:
-- Write a query to create a view that finds the salesman who has
-- the customer with the highest order at least 3 times on a day.

CREATE VIEW V_TopSalesman
AS
SELECT 
    salesman_id,
    COUNT(*) AS TotalHighest
FROM orders
GROUP BY salesman_id
HAVING COUNT(*) >= 3


-- Question 9:
-- Write a query to create a view that shows all customers
-- who have the highest grade.

CREATE VIEW V_HighestGrade
AS
SELECT *
FROM customer
WHERE grade = (SELECT MAX(grade) FROM customer)


-- Question 10:
-- Write a query to create a view that shows the number of salesman in each city.

CREATE VIEW V_SalesmanCity
AS
SELECT city, COUNT(salesman_id) AS TotalSalesman
FROM salesman
GROUP BY city


-- Question 11:
-- Write a query to create a view that shows the average and total orders
-- for each salesman after his or her name.

CREATE VIEW V_SalesmanOrder
AS
SELECT 
    name,
    AVG(purch_amt) AS AverageOrder,
    SUM(purch_amt) AS TotalOrder
FROM salesman
INNER JOIN orders
ON salesman.salesman_id = orders.salesman_id
GROUP BY name


-- Question 12:
-- Write a query to create a view that shows each salesman
-- with more than one customers.

CREATE VIEW V_MoreCustomer
AS
SELECT 
    name,
    COUNT(customer.customer_id) AS TotalCustomer
FROM salesman
INNER JOIN customer
ON salesman.salesman_id = customer.salesman_id
GROUP BY name
HAVING COUNT(customer.customer_id) > 1


-- Question 13:
-- Write a query to create a view that shows all matches of customers
-- with salesman from same city.

CREATE VIEW V_CityMatch
AS
SELECT 
    cust_name,
    name,
    customer.city
FROM customer
INNER JOIN salesman
ON customer.city = salesman.city


-- Question 14:
-- Write a query to create a view that shows the number of orders in each day.

CREATE VIEW V_DailyOrders
AS
SELECT 
    ord_date,
    COUNT(ord_no) AS TotalOrders
FROM orders
GROUP BY ord_date


-- Question 15:
-- Write a query to create a view that finds the salesmen
-- who issued orders on October 10th, 2012.

CREATE VIEW V_OrderOctober10
AS
SELECT DISTINCT name
FROM salesman
INNER JOIN orders
ON salesman.salesman_id = orders.salesman_id
WHERE ord_date = '2012-10-10'


-- Question 16:
-- Write a query to create a view that finds the salesmen who issued orders
-- on either August 17th, 2012 or October 10th, 2012.

CREATE VIEW V_OrderTwoDates
AS
SELECT DISTINCT name
FROM salesman
INNER JOIN orders
ON salesman.salesman_id = orders.salesman_id
WHERE ord_date = '2012-08-17'
OR ord_date = '2012-10-10'


-- Indexing Question 1:
-- Create a non-unique index named idx_worker_salary on SALARY column.

CREATE INDEX idx_worker_salary
ON Worker(SALARY)


-- Indexing Question 2:
-- Create a composite index named idx_name_dept.

CREATE INDEX idx_name_dept
ON Worker(FIRST_NAME, DEPARTMENT)


-- Indexing Question 3:
-- Create a unique index named idx_worker_id_unique.

CREATE UNIQUE INDEX idx_worker_id_unique
ON Worker(WORKER_ID)


-- Indexing Question 4:
-- Delete index named idx_worker_salary.

DROP INDEX idx_worker_salary ON Worker


-- Cascading Question 1:
-- Create Departments and Staff table with ON DELETE CASCADE.

CREATE TABLE Departments
(
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
)

CREATE TABLE Staff
(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID)
    REFERENCES Departments(DeptID)
    ON DELETE CASCADE
)


-- Cascading Question 2:
-- Add foreign key with ON UPDATE CASCADE.

ALTER TABLE Orders
ADD CONSTRAINT fk_cust_update
FOREIGN KEY (CustomerID)
REFERENCES Clients(CustomerID)
ON UPDATE CASCADE


-- Cascading Question 3:
-- Create Project_Tasks table with composite foreign key.

CREATE TABLE Projects
(
    ProjectID INT,
    DeptCode VARCHAR(10),
    PRIMARY KEY(ProjectID, DeptCode)
)

CREATE TABLE Project_Tasks
(
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    DeptCode VARCHAR(10),

    FOREIGN KEY(ProjectID, DeptCode)
    REFERENCES Projects(ProjectID, DeptCode)
    ON DELETE CASCADE
)


-- Cascading Question 4:
-- Create Shipments table with ON UPDATE CASCADE
-- and ON DELETE RESTRICT.

CREATE TABLE Warehouse
(
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(50)
)

CREATE TABLE Shipments
(
    ShipmentID INT PRIMARY KEY,
    WarehouseID INT,

    FOREIGN KEY(WarehouseID)
    REFERENCES Warehouse(WarehouseID)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
)