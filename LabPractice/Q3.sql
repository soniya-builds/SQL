-- Execute an SQL query to retrieve the DevName, Department, and BaseSalary of the developers from the database, strictly skipping the top 3 highest-paid developers in the company and fetching only the data of the subsequent 4 highest-paid developers.
select DevName, Department,BaseSalary from Developers
order by BaseSalary desc
limit 4 offset 3;