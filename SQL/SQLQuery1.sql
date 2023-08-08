--1.Write an SQL Query to display all information in the authors table.
select* from authors
      	
--2.Display all authors first name and last name who lived in the state ‘UT’.
select au_lname,au_fname from authors where state = 'UT'
      	                    	
--3.Display the last names of all authors with an `A' in their last name.
select au_lname from authors where au_lname like '%a%' 

--4.Display all information of an author with phone number is ‘707 448-4982’.  
select * from authors where phone = '707 448-4982'
