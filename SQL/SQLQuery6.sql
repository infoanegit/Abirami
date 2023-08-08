--1. Find the total number of books in ‘Business’ type.
 select count(type) as [Total business book counts] from titles where type='Business'

--2. Display the published date for this book ‘Life Without Fear’. 
select pubdate as[Published date book-Life without fear]from titles where title='Life Without Fear'

--3. Display all the books title published by ‘Binnet & Hardley’. 
select t.title as[books published by Binnet & Hardley] from publishers p join titles t on p.pub_id=t.pub_id where pub_name='Binnet & Hardley'

--4. Find the authors first name and last name for this book ‘Straight Talk About Computers’.
-- select*from titles
-- select*from authors
-- select*from titleauthor
 select au_lname as[Frist Name],au_fname as[Last Name] from authors where au_id=(select au_id from titleauthor where title_id=(select title_id from titles  
 where title='Straight Talk About Computers'))