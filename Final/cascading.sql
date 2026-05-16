Create Database indx
Use indx

Create Table Student 
( student_id INT, 
Name varchar(30),
dept_id int,
Foreign key (dept_id ) References Department (dept_id)
on delete cascade 
on update cascade 
);
insert into Student Values (1, 'Rahim', 1)
Create Table Department 
( dept_id int Primary key Not Null, 
 dept_name Varchar(30));
 Insert into Department values (1, 'CSE');

 Update Department
 set dept_id = 5
 where dept_id = 1

 select * from Department
 select * from Student

 Delete from Department 
 where dept_id = 5
 --Clustered index 
 Create Clustered index Stu_indx
 on Student(student_id)
 Create Clustered index stu
 on Student(Name) -- can not create as one already exists.

 --Non-clustered/Normal index 

 Create nonclustered index stu_name_indx 
 on Student(Name)

 select * from Student
 where Name ='Rahim';

 Create unique nonclustered index dept_indx 
 on Department (dept_name)



 drop table Student