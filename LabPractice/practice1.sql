create database practice;
use practice;
create table worker(
worker_id int primary key,
first_name varchar(50),
last_name varchar (50),
salary int,
dept varchar(50)
);

alter table worker add Joining_date date;

alter table worker modify column salary decimal(8,2);

alter table worker rename column dept to department;

alter table worker add constraint chk_salary check (salary>100) ;

alter table worker add constraint uq_name unique(first_name);

alter table worker add constraint pk primary key(worker_id);
