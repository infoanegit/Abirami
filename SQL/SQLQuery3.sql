--1. Display/find the total number of Publishers in publishers table. 
select count(pub_name)as 'total number of publishers' from publishers

--2. Display the employee name and job description of all employees with the same job as Howard. 
--select*from employee
--select*from jobs
SELECT concat(fname , ' ' , minit , ' ' , lname) as name , j.job_desc  from
employee e join jobs j on  e.job_id = j.job_id 
where j.job_id = (select job_id from employee where  fname='howard')

--3. Display the employee name and job description of all employees whose are not Managing Editor. 
select concat(e.fname , ' ' , e.minit , ' ' , e.lname) as name,j.job_desc
from employee e
join jobs j
on e.job_id=j.job_id
where j.job_desc!='Managing Editor'




