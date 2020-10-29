#Usecase1
create database address_book;                                                   #Create a databse
use address_book;                                                               #Use database
select database();                                                              #Select databse

#Usecase2
create table addressbook_service
(
firstName varchar(150) not null,
lastName varchar(150) not null,
Address varchar(300),
city varchar(15),
state varchar(15),
zip int unsigned,
phoneNo int unsigned,
emailId varchar(30) not null,
primary key (emailId)
);