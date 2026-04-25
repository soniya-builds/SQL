-- Execute a single SQL query utilizing built-in functions to display the developer's name in entirely uppercase letters, the length of their email address, and the exact total number of months they have been employed since their JoinDate up to the current system date, filtering the results to only show developers who have worked for more than 24 months.
select 
upper(DevName) as uppername,
length(Email) as Length,
TIMESTAMPDIFF(MONTH, JoinDate, CURDATE()) AS MonthsWorked
from Developers
where TIMESTAMPDIFF(MONTH, JoinDate, CURDATE())>24;