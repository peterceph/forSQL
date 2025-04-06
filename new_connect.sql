select * from departments 

select * from employees 

-- This query retrieves the sum of the salary from each department
-- The grouping is by department because we have more than one employee in a department

select department_id, sum(salary) as total_salary 
from employees
group by department_id
order by total_salary;

-- some of the aggregate functions we have; sum(), avg(), count(), min(), max() etc.

select department_id, count(*) as department
from employees
group by department_id;

select department_id, round(avg(salary), 2) as dept_avg_salary
from employees
group by department_id; 


--Now onto Having!!!

select department_id, count(*) as num_of_employee
from employees
group by department_id
having count(*) > 5;


-- This would not render good performance. First it groups then filters. 

SELECT department_id, COUNT(*) 
FROM employees
GROUP BY department_id
HAVING department_id = 90;

--This filters first and has less data to group 

SELECT department_id, COUNT(*) 
FROM employees
WHERE department_id = 90
GROUP BY department_id;



CREATE TABLE vl_employees (
    emp_id         NUMBER PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER,
    salary         NUMBER
);

-- Step 2: Fill it with dummy data
BEGIN
  FOR i IN 1..1000000 LOOP
    INSERT INTO vl_employees VALUES (
      i,
      'First_' || MOD(i, 1000),
      'Last_' || MOD(i, 500),
      MOD(i, 100),
      ROUND(DBMS_RANDOM.VALUE(2000, 20000))
    );
  END LOOP;
  COMMIT;
END;
/
explain plan for 
select * from vl_employees;

create index idx_vl_name ON vl_employees(last_name);

explain plan for

SELECT * FROM vl_employees WHERE last_name = 'Last_5';

select * from vl_employees.first_name
inner join vl_employees.last_name
on 

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

select department_id, count(*) as departments from vl_employees 
group by department_id;

select * from vl_employees;


select e.department_id,
e.first_name,
e.last_name,
e.salary, count(*)
from vl_employees e
where e.last_name = 'Last_150'
group by department_id, e.last_name, e.first_name, e.salary;

select * from departments
select * from employees

create index idx_emp_name ON employees(first_name, last_name);



-- BEFORE INDEXING 


EXPLAIN PLAN FOR 
SELECT DISTINCT
e.employee_id, d.department_id, e.first_name ||' ' || e.last_name as name
FROM employees e
INNER JOIN departments d
ON e.manager_id = d.manager_id
OR e.department_id = d.department_id;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- The next thing in order to optimize this query is to write an index for manager_id and department_id
select * from departments 

create index idx_employees_manager_id on employees(manager_id);
create index idx_departments_manger_id on departments(manager_id);
create index idx_employees_department_id on employees(department_id);
create index idx_department_department_id on departments(department_id);

DESCRIBE DEPARTMENTS

-- AFTER INDEXING


EXPLAIN PLAN FOR 
SELECT DISTINCT
e.employee_id, d.department_id, e.first_name ||' ' || e.last_name as name
FROM employees e
INNER JOIN departments d
ON e.manager_id = d.manager_id
OR e.department_id = d.department_id;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
