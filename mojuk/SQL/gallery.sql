create table gallery(
ID int not null,
Title varchar(50) null,
FilePath varchar(500) null,
UserName varchar(50) null,
time datetime default current_timestamp null,
primary key(ID));