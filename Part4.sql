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

--pierwsze rozwiazanie
create table employees_canada as
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'CA' ;

create table employees_uk as
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'UK' ;

create table employees_us as
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'US' ;

create table employees_de as
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id
where l.country_id = 'DE' ;

--drugie rozwiazanie
create table prac_ca(imie VARCHAR2(20), nazwisko VARCHAR2(25) NOT NULL, pensja NUMBER(8,2), nazwa_departamentu VARCHAR2(30) NOT NULL  );
create table prac_us(imie VARCHAR2(20), nazwisko VARCHAR2(25) NOT NULL, pensja NUMBER(8,2), nazwa_departamentu VARCHAR2(30) NOT NULL  );
create table prac_uk(imie VARCHAR2(20), nazwisko VARCHAR2(25) NOT NULL, pensja NUMBER(8,2), nazwa_departamentu VARCHAR2(30) NOT NULL  );
create table prac_de(imie VARCHAR2(20), nazwisko VARCHAR2(25) NOT NULL, pensja NUMBER(8,2), nazwa_departamentu VARCHAR2(30) NOT NULL  );


INSERT ALL
WHEN country_id = 'CA' THEN
INTO prac_ca(imie, nazwisko, pensja, nazwa_departamentu) VALUES( first_name, last_name, salary, department_name)
WHEN country_id = 'DE' THEN
INTO prac_de(imie, nazwisko, pensja, nazwa_departamentu) VALUES( first_name, last_name, salary, department_name)
WHEN country_id = 'US' THEN
INTO prac_us(imie, nazwisko, pensja, nazwa_departamentu) VALUES( first_name, last_name, salary, department_name)
WHEN country_id = 'UK' THEN
INTO prac_uk(imie, nazwisko, pensja, nazwa_departamentu) VALUES( first_name, last_name, salary, department_name)
select e.first_name, e.last_name, e.salary, d.department_name, country_id
from employees e
join departments d on e.department_id= d.department_id
join locations l on d.location_id = l.location_id;

--6
--pierssze rozwiazanie
create table prog(imie VARCHAR2(20), nazwisko VARCHAR2(25));

insert into prog
select first_name, last_name
from employees
where job_id = 'IT_PROG';

--drugie rozwiazanie
create table prog as
select first_name imie, last_name nazwisko
from employees
where job_id = 'IT_PROG';

--7
create table pracownicybezpremii as
select *
from employees e
where e.job_id = 'IT_PROG'
and e.commission_pct is null;

--8
create table departments_avg_salaries as
select d.department_name, avg(salary) averge_salary
from employees e
join departments d using (department_id)
group by d.department_name;

--9
create table prac5000(prac_id NUMBER(6), wynagrodzenie NUMBER(8,2));
create table prac20000(prac_id NUMBER(6), wynagrodzenie NUMBER(8,2));
create table pracw20000(prac_id NUMBER(6), wynagrodzenie NUMBER(8,2));

--10
INSERT FIRST 
WHEN salary + bonus < 5000 THEN
INTO prac5000 VALUES (employee_id, salary + bonus)
WHEN (salary + bonus) >= 5000 and (salary + bonus) < 20000 THEN
INTO prac20000 VALUES (employee_id, salary + bonus)
ELSE 
INTO pracw20000 VALUES (employee_id, salary + bonus)
select employee_id,salary, decode(commission_pct, null,0,salary*commission_pct) bonus
from employees;

--11
CREATE TABLE WYDATKI(id_os NUMBER, rok NUMBER(4), styczen NUMBER(10,2), luty NUMBER(10,2), marzec NUMBER(10,2), kwiecien NUMBER(10,2), maj NUMBER(10,2), czerwiec NUMBER(10,2), lipiec NUMBER(10,2), sierpien NUMBER(10,2), wrzesien NUMBER(10,2), pazdziernik NUMBER(10,2), listopad NUMBER(10,2), grudzien NUMBER(10,2));

INSERT INTO WYDATKI 
select 1, 2020, 10, 14, 21, 25, 35, 11, 22, 11, 13, 18, 28, 44
from dual
UNION 
select 2, 2020, 15, 17, 21, 23, 39, 16, 29, 21, 16, 28, 8, 36
from dual;

--12
create table WydatkiM(id_os NUMBER, rok NUMBER(4), miesiac NUMBER(2) , kwota NUMBER(10,2));
alter table WydatkiM add constraint sprawdz_miesiac CHECK (miesiac >=1 and miesiac <=12);

INSERT ALL
INTO WYDATKIM 
select id_os, rok, 1 miesiac, styczen wyd
from wydatki 
UNION ALL
select id_os, rok, 2 miesiac, luty wyd
from wydatki
UNION ALL
select id_os, rok, 3 miesiac, marzec wyd
from wydatki
UNION ALL
select id_os, rok, 4 miesiac, kwiecien wyd
from wydatki
UNION ALL
select id_os, rok, 5 miesiac, maj wyd
from wydatki
UNION ALL
select id_os, rok, 6 miesiac, czerwiec wyd
from wydatki
UNION ALL
select id_os, rok, 7 miesiac, lipiec wyd
from wydatki
UNION ALL
select id_os, rok, 8 miesiac, sierpien wyd
from wydatki
UNION ALL
select id_os, rok, 9 miesiac, wrzesien wyd
from wydatki
UNION ALL
select id_os, rok, 10 miesiac, pazdziernik wyd
from wydatki
UNION ALL
select id_os, rok, 11 miesiac, listopad wyd
from wydatki
UNION ALL
select id_os, rok, 12 miesiac, grudzien wyd
from wydatki;

select *
from wydatkim;






