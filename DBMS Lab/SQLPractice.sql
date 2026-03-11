create database if not exists CollegeDB;
use CollegeDB;

create table student(
 StudentID int auto_increment primary key,
 name varchar (100),
 age tinyint,
 Email varchar(100),
 JoinDate date
);

select * from student;

INSERT INTO student (name, age, Email, JoinDate) VALUES
('Tania Tasnim',22,'tania@gmail.com','2025-02-20'),
('Aditi Maitra',20,'aditi@gmail.com','2025-07-10'),
('Tithi Tabassum',22,'tithi@gmail.com','2025-01-29'),
('Supriya Mojumdar',22,'mojumdar12@gmail.com','2025-08-17'),
('Esrat Eva',22,'eva20@gmail.com','2025-12-19'),
('Bornita Ghosh',22,'bornita77@gmail.com','2025-10-24');

-- to add column
alter table student add column city varchar (50);
update student
set city = case studentid
    when 1 then 'Dhaka'
    when 2 then 'Chittagong'
    when 3 then 'Khulna'
    when 4 then 'Rajshahi'
    when 5 then 'Sylhet'
    when 6 then 'Barisal'
end
where studentid in (1,2,3,4,5,6);

-- to change type
alter table student modify age smallint;
alter table student rename column Email to StudentEmail;
alter table student rename column name to Name;
alter table student rename column Eage to Age;

-- DML(CRUD)

