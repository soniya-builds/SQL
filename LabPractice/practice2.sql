INSERT INTO Worker (worker_id, first_name, last_name, salary, department, joining_date) VALUES
(1, 'Rana', 'Hamid', 100000, 'HR', '2014-02-20'),
(2, 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11'),
(3, 'Mahmudul', 'Hasan', 300000, 'HR', '2014-02-20'),
(4, 'Asad', 'Zaman', 500000, 'Admin', '2014-02-20'),
(5, 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11'),
(6, 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11'),
(7, 'Foridul', 'Islam', 75000, 'Account', '2014-01-20'),
(8, 'Keshob', 'Ray', 90000, 'Admin', '2014-04-11'),
(9, 'Nayeem', 'Rahman', 60000, 'HR', '2015-03-15'),
(10, 'Tanvir', 'Ahmed', 120000, 'Admin', '2016-07-10');

select * from worker;

select worker_id,
concat(first_name,' ',last_name) as full_name,
salary,
department,
joining_date
from worker limit 5;

select * from worker where department='Admin';

select concat(first_name,' ',last_name) as full_name from worker where salary>10000;

update worker set salary=95000 where worker_id = 8;

delete from worker where first_name='Asad'