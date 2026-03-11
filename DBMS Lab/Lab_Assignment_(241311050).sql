create database LabAssignment;
use LabAssignment;

-- creating worker table with required constraints
CREATE TABLE worker (
    worker_id INT PRIMARY KEY,
    first_name VARCHAR(50) UNIQUE,
    last_name VARCHAR(50),
    salary INT CHECK (salary > 100),
    dept_name VARCHAR(50),
    joining_date DATETIME
);

insert into worker values
(1, 'Rana', 'Hamid', 100000, 'HR', '2014-02-20 09:00:00'),
(2, 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11 09:00:00'),
(3, 'mahmudul', 'Hasan', 300000, 'HR', '2014-02-20 09:00:00'),
(4, 'Asad', 'zaman', 500000, 'Admin', '2014-02-20 09:00:00'),
(5, 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11 09:00:00'),
(6, 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11 09:00:00'),
(7, 'Fordiul', 'Islam', 75000, 'Account', '2014-01-20 09:00:00'),
(8, 'Keshob', 'Ray', 90000, 'Admin', '2014-04-11 09:00:00');

-- Query 1
SELECT 
    *
FROM
    worker;

-- Query 2 & 3
SELECT 
    worker_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    dept_name,
    joining_date
FROM
    worker
LIMIT 5;

-- Query 4
SELECT 
    *
FROM
    worker
WHERE
    dept_name = 'Admin';

-- Query 5
SELECT 
    first_name, last_name
FROM
    worker
WHERE
    salary > 10000;

-- Query 6
-- select * from worker where salary > 80000;
SELECT 
    *
FROM
    worker
WHERE
    salary > (SELECT 
            salary
        FROM
            worker
        WHERE
            first_name = 'Sanjoy');

-- Query 7
UPDATE worker 
SET 
    salary = 95000
WHERE
    worker_id = 8;

-- Query 8
DELETE FROM worker 
WHERE
    first_name = 'Asad';