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

#Usecase13
create table contact (
    contact_id int unsigned not null,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    address varchar(50) not null,
    city varchar(20) not null,
    state varchar(20) not null,
    zip int unsigned not null,
    phone_number varchar(10) not null,
    email_id varchar(30) not null,
    primary key (contact_id)
);

create table address_book_name (
    book_id int unsigned not null,
    book_name varchar(20) not null,
    primary key (book_id)
);

create table address_book_type (
    type_id int unsigned not null,
    type_name varchar(20) not null,
    primary key (type_id)
);

create table dictonary(
    contact_id int unsigned not null,
    book_id int unsigned not null,
    type_id int unsigned not null,
    foreign key (contact_id) references contact (contact_id),
    foreign key (book_id) references address_book_name (book_id),
    foreign key (type_id) references address_book_type (type_id)
);

insert into contact values
(1, 'Divya','Prakash','M.G.Road','Bangalore','Karnataka',123456,9876543210,'divya_prakash@gmail.com'),
(2, 'Arjun','Roy','S.R.Nagar','Chennai','Tamil Nadu',234567,7890654345,'roy1.arjun@gmail.com'),
(3, 'Samyuktha','Hegde','Begumpet','Hyderabad','Telangana',345678,7896592346,'samyuktha_samyu@gmail.com'),
(4, 'Anjana','Jaweri','Thane','Mumbai','Maharashtra',456789,8978765645,'Anjana.anju@gmail.com'),
(5, 'Dev','Aswanth','Agra','Delhi','Delhi',343423,9934569023,'Aswanth_dev@gmail.com');

insert into address_book_name values
(101, 'myContacts'),
(102, 'officeContacts');

insert into address_book_type values
(50, 'Family'),
(51, 'Friend'),
(52, 'Professional');

insert into dictionary values
(1,101,50),
(2,101,51),
(3,101,50),
(4,101,50),
(5,102,52);

select * from contact where city = 'Bangalore' or state = 'Karnataka';

select city, count(contact_id) from contact group by city;
select state, count(contact_id) from contact group by state;

select * from contact where city = 'Mumbai'order by first_name;

select address_book_type.type_name, count(dictionary.contact_id) from dictionary
join address_book_type on address_book_type.type_id = dictionary.type_id
group by dictionary.type_id;