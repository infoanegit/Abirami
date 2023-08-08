--1. How many stores are in each unique state in the stores table? Select the state and
--   display the number of store  in each. Hint: count is used to count rows in a column,
--   sum works on numeric data only.
--   select *from stores
   select state ,count(state)as [number of stores]from stores group by state
   

--2. Select the title and price in the table title that the price is
--   greater than 10.00. Display the results in Ascending order based on the price
--   select*from titles
   select title,price from titles where price > 10.00 order by price asc
