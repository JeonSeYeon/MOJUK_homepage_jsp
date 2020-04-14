create table project(
id int auto_increment, 
username varChar(50), 
password varChar(50), 
title varChar(50), 
memo varChar(500), 
time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(),
hit int, 
ref int, 
indent int, 
step int,
step2 int,
PRIMARY KEY(id));