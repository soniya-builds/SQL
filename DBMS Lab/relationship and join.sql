create database if not exists retailstore;

use retailstore;

create table customers (
    customerid int primary key,
    customername varchar(100)
);

create table orders (
    orderid int primary key,
    product varchar(100),
    amount decimal(10,2),
    customerid int,
    foreign key (customerid) references customers(customerid)
);

insert into customers values
(1, 'Rahul Sharma'),
(2, 'Anjali Mehta'),
(3, 'Amit Verma');

insert into orders values
(101, 'Laptop', 50000, 2),
(102, 'Mouse', 500, 1),
(103, 'Keyboard', 700, 1);

select * from customers;
select * from orders;

select customers.customername, orders.product , orders.amount    -- ja ja dekhte chai
from customers
inner join orders on 
customers.customerid = orders.customerid;

-- left join(right table theke sudhu matched row jabe)
select customers.customername, orders.product , orders.amount    -- ja ja dekhte chai
from customers
left join orders on 
customers.customerid = orders.customerid;

-- right join(left table theke sudhu matched row jabe)
select customers.customername, orders.product , orders.amount 
from customers
right join orders on 
customers.customerid = orders.customerid;

-- full outer join
-- my sql e direct ei keyword nei but left union right kore kora jai
select customers.customername, orders.product , orders.amount  
from customers
left join orders on 
customers.customerid = orders.customerid
union
select customers.customername, orders.product , orders.amount 
from customers
right join orders on 
customers.customerid = orders.customerid;