--1. Display the maximum and minimum price of the book. 
select min(price) as min_price, max(price) as max_price from titles;

--2. Display the total book price for each type. 
select type, sum(price) as total_amount
from titles
group by type;

--3. Find out the Publisher for the following books                         
--   ‘Cooking with Computers: Surreptitious Balance Sheets’, 
--   ‘Silicon Valley Gastronomic Treats’, 
--   ‘Is Anger the Enemy?’, 
--   ‘Fifty Years in Buckingham Palace Kitchens’.

-- select *from titles 
-- select*from publishers
 select  t.title as books, p.pub_name as Publishers from  publishers p join titles t 
  on p.pub_id = t.pub_id where title in 
  ('Cooking with Computers: Surreptitious Balance Sheets','Silicon Valley Gastronomic Treats','Is Anger the Enemy?',
  'Fifty Years in Buckingham Palace Kitchens')

  