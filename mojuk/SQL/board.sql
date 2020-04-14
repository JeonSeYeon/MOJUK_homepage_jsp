create table board(
num int auto_increment,
username varchar(50),
title varchar(50),
memo varchar(500),
time datetime default current_timestamp,
hit int,
indent int,
ref int,
step int,
primary key(num));