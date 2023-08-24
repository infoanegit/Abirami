Create table todos(
id  int identity(1,1) primary key,
notes varchar(50),
isactive bit,
created_date datetime,
updated_date datetime 
)

select*from todos
use[trainingdb]