--1.Display the names and hire dates of  employees hired between 1991 - 1992.
SELECT fname,hire_date from employee where year(HIRE_DATE)between 1991 and 1992;

--2.Display the names of employees without middle (minit) name.
SELECT fname, lname FROM employee
select concat(fname , ' ' , minit , ' ' , lname) as Name from employee

--3.Display the names and hire dates of all employees with the column headers \Name" and \Start Date", in the order they were hired.
select fname AS 'Name', hire_date AS "Start Date" from employee;

--4.Retrieve the names of  employees whose designation is ‘Sales Representative’.
select *from employee
select*from jobs
select concat(fname , ' ' , minit , ' ' , lname)as name from employee where 
job_id=(select job_id from jobs where job_desc='Sales Representative')