create database if not exists shopdb;
use shopdb;

create table customers(
    customerid int auto_increment primary key,
    name varchar(100),
    email varchar(100) unique,
    address varchar(200)
);
insert into customers (name, email, address)
values
('Rahim Ahmed', 'rahim@gmail.com', 'Dhaka'),
('Karim Hasan', 'karim@gmail.com', 'Chittagong'),
('Nusrat Jahan', 'nusrat@gmail.com', 'Sylhet'),
('Tanvir Hossain', 'tanvir@gmail.com', 'Khulna'),
('Ayaan Ahmed', 'ayaan@gmail.com', 'Khulna'),
('Ayesha Akter', 'ayesha@gmail.com', 'Rajshahi');

select * from customers;
select name,address from customers;
select distinct address from customers;

select * from customers where name='Karim Hasan' and address='Chittagong';
select * from customers where address != 'Khulna';

select * from customers order by name asc;
select * from customers order by customerid desc;

use shopdb;

update customers
set address='Rajshahi'
where name='Rahim Ahmed';

delete from customers
where name= 'Rahim Ahmed'

