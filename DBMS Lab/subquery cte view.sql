use shopdb;

select product , amount
from sales
where amount> (select avg(amount) from sales);

-- cte(Temporary)
with categorytotals as (
    select category, sum(amount) as totalsales
    from sales
    group by category
)

select category, totalsales
from categorytotals
where totalsales > 1000;

-- view(virtual table)
create view categorysales as
select category, sum(amount) as totalsales
from sales
group by category;

select * from categorysales;
select * from categorysales where totalsales>500;