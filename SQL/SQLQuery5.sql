--1. Display/find the given authors complete address information. [Panteley Sylvia]
select concat(address,' ,',city,', ',state,', ',zip)as [Complete Address]from authors where concat(au_lname,' ',au_fname)='panteley sylvia'
 
--2. Display only the hire date and employee name for each employee.
select concat(fname,' ',minit,' ',lname)as Name,hire_date as Hire_Date from employee

--3. Display all the books which come under ‘Psychology’ type.
--select*from titles
--select*from authors
--select*from employee
select title as [Books name] from titles where type='Psychology'