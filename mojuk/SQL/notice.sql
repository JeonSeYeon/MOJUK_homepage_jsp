create table notice(
id int auto_increment,
username varchar(50),
password varchar(50),
title varchar(50),
memo varchar(500),
time timestamp default current_timestamp,
hit int,
ref int,
indent int,
step int,
primary key(id));