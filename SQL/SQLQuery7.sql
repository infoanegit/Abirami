--1. Select the average price in the table titles for  pub _id is 1389.
--select*from employee
--select*from titles
--select*from stores
select avg(price)as[Average price] from titles where pub_id=1389

--2. What are the total numbers of rows in the titles table
select count(title_id) as [Total numbers of rows]from titles

--3. List the address of all stores  in the state WA or CA in the table stores
select concat(Stor_address,',',city,',',state,',',zip)as[Address in stores]from stores where state in ('WA' ,'CA','OR')

--4. List the date between  the year 1989 to 1992 in the table employee
select format(hire_date,'dd-mm-yyy') as[dates between the year 1989-1992]from employee where year(hire_date)between '1989' and '1992'


--5. List the first name and last name of the employee in the employee table where the jobs_id  is 6
select concat(fname,'',minit,'',lname)as Name from employee where job_id='6'



