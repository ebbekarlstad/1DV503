SELECT e.fname, e.lname
FROM employee e
JOIN works_on w ON e.ssn = w.essn
JOIN project p ON w.pno = p.pnumber
WHERE p.pname = 'Middleware'
OR p.pname = 'DatabaseSystems';

select e.fname, e.lname
from employee e
join works_on w ON e.ssn = w.essn
join project p on w.pno = p.pnumber
where p.pname = 'DatabaseSystems' and w.hours > 40;

select p.pnumber, d.dnumber, p.plocation, e.lname, e.address, e.bdate
from project as p
join department as d on p.dnum = d.dnumber
join employee as e on d.mgrssn = e.ssn
where p.plocation = 'Houston';

select e.fname, e.lname, s.fname, s.lname
from employee as e
join employee as s on e.superssn = s.ssn;

select fname, lname, sex, address
from employee
where sex = 'F' and address like '%Houston%';

select fname, lname, bdate
from employee
where month(bdate) = 6;

select d.dname, avg(e.salary) as avg_salary
from department as d
join employee as e on d.dnumber = e.dno
group by d.dname;

select e.fname, e.lname, e.ssn, w.essn
from employee as e
left join works_on as w on e.ssn = w.essn
where w.essn is null;

select e.fname, e.lname, d.dnumber, p.pname, e.salary
from employee as e
join department as d on e.dno = d.dnumber
join project as p on p.dnum = d.dnumber
where p.pname = 'LaserPrinters' and d.dnumber = '7' and e.salary > '30000';

select e.fname, e.lname, e.address, d.mgrssn
from employee as e
join department as d on e.dno = d.dnumber
where e.address like '%Houston%' and d.mgrssn = '333445555';

select e.fname, e.lname, e.salary, d.dname
from employee e
join department d ON e.dno = d.dnumber
  where d.dnumber = (
  select d.dnumber
  from employee e
  join department d ON e.dno = d.dnumber
  group by d.dnumber
  order by avg(e.salary) desc
  limit 1 
);

select d.dnumber, d.dname, avg(e.salary) as avg_salary, count(e.ssn) as num_e
from department as d
join employee as e on d.dnumber = e.dno
group by d.dname
having avg_salary > '35000';

select e.fname, e.lname, e.address, d.mgrssn, dep.relationship
from employee as e
join department as d on e.dno = d.dnumber
left join dependent as dep on e.ssn = dep.essn
where d.mgrssn = '333445555'
order by e.fname asc;

select p.pname, sum(w.hours) as worked_hours, count(e.ssn) as num_employees
from project as p
join works_on as w on p.pnumber = w.pno
join employee as e on w.essn = e.ssn
group by p.pname;

select d.dname, count(distinct p.pnumber) as num_projects, count(distinct e.ssn) as num_employees
from department as d
left join project as p on d.dnumber = p.dnum
left join employee as e on d.dnumber = e.dno
group by d.dname

