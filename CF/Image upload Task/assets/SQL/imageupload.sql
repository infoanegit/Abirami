use [trainingdb]

create table imagefile (
id  int identity(1,1) primary key,
imagename varchar(30),
description varchar(150),
image varchar(100)
)

select * FROM IMAGEFILE