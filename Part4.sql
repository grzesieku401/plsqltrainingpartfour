--1
create table pracdata(prac_id NUMBER(6) , data_zatr DATE, wynagrodzenie NUMBER(8,2));

desc pracdata;

--2
create table pracoddzialy(prac_id NUMBER(6), oddzial_id NUMBER(6), wynagrodzenie NUMBER(8,2));

desc pracoddzialy;

--3
create table pracstanowiska(prac_id NUMBER(6), stanowisko_id VARCHAR(10), wynagrodzenie NUMBER(8,2));

desc pracstanowiska;

--4
INSERT ALL
INTO pracoddzialy( prac_id, oddzial_id, wynagrodzenie) values (employee_id, department_id,salary)
INTO pracstanowiska(prac_id, stanowisko_id, wynagrodzenie) values(employee_id, job_id, salary)
INTO pracdata(prac_id, data_zatr, wynagrodzenie) values(employee_id,hire_date, salary)
select *
from employees;

--5
create table employees_canada as
select e.first_name, e.last_name, e.salary, d.department_id
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where d.country_id = 'CA' ;

drop table employees_canada;


select l.country_id, e.first_name, e.last_name
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id;



insert all
when country



