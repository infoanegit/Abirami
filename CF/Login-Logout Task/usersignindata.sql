use trainingdb;

create table [user](
user_id int identity(1,1)primary key,
user_name varchar(255),
user_password varchar(255),
user_mail varchar(255)
)

drop table [user]
