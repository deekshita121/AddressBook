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

#Usecase3
#Inserting records
insert into addressbook_service(firstName, lastName, Address, city, state, zip, phoneNo, emailId)values
('Diya', 'Prakash', '91/160', 'Kanchipuram', 'TamilNadu', '345123', '68246531', 'diya.prakash21@gmail.com'),
('Dhruv', 'Aaryan', '4-21', 'Banglore', 'Karnataka', '654231', '918288541', 'Dhruv_Aaryan@gmail.com');

#Usecase4
#Updating contact details with name
update addressbook_service set city = 'Calicut' where firstName = 'Dev' and lastName = 'Narayan';

#Usecase5
#Delete a person using persons name
delete from addressbook_service where firstName = 'Diya' and lastName = 'Prakash';

#Usecase6
#Ability to retrieve person belonging to a state or city
select * from addressbook_service where city = 'Calicut' or state = 'Kerala';

#usecase7
#Understand the size of address book by city or state
select city, count(*) from addressbook_service group by city;
select state, count(*) from addressbook_service group by state;

#usecase8
#Retrieve the records sorted alphabetically for a given city
select * from addressbook_service where city ='Calicut' order by firstName;

#usecase9
#Add name and type to addressbook
alter table addressbook_service add addressbook_name varchar(20);
alter table addressbook_service add addressbook_type varchar(20) after addressbook_name;
update addressbook_service set addressbook_name = 'Diya' where firstName = 'Diya';
update addressbook_service set addressbook_type = 'Friends' where firstName = 'Diya';
update addressbook_service set addressbook_name = 'Dev' where firstName = 'Dev';
update addressbook_service set addressbook_type = 'Relative' where firstName = 'Dev';
update addressbook_service set addressbook_name = 'Dhruv' where firstName = 'Dhruv';
update addressbook_service set addressbook_type = 'Family' where firstName = 'Dhruv';

#usecase10
#Count by type
select addressbook_type, count(*) from addressbook_service group by addressbook_type;

#usecase11
#insert a contact into both friends and family
insert into addressbook_service(firstName, lastName, Address, city, state, zip, phoneNo, emailId, addressbook_name, addressbook_type)values
('Divya', 'Sushrutha', '9/160', 'Banglore', 'Karnataka', '654231', '918288541', 'sushrutha.d@gmail.com', 'Divya', 'Family'),
('Divya', 'Sushrutha', '9/160', 'Banglore', 'Karnataka', '654231', '918288541', 'sushrutha.d1@gmail.com', 'Divya', 'Friends');