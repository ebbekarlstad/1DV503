use company;
select e.fname, e.lname, d.dnumber, p.pname, e.salary
from employee as e
join department as d on e.dno = d.dnumber
join project as p on p.dnum = d.dnumber
where p.pname = 'LaserPrinters' and d.dnumber = '7' and e.salary > '50000';
