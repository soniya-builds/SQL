-- Execute the necessary SQL statements to alter the structure of the existing Developers table to enforce data integrity by adding a unique constraint to the Email column and a check constraint to ensure that the BaseSalary can never be inserted or updated to a value lower than 45,000.
alter table Developers add constraint uni_email unique(Email);
select * from Developers;
ALTER TABLE Developers
ADD CONSTRAINT check_salary CHECK (BaseSalary >= 45000);