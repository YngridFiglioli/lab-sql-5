#Drop column picture from staff.
#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.
#Delete non-active users, but first, create a backup table dele ted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer
use sakila;

alter table staff drop picture;
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
values (3,'Tammy', 'Sanders','4','Tammy.Sanders@sakilastaff.com','2',1,'Tammy');
insert into rental (rental_date, inventory_id, customer_id, staff_id, last_update) values (now(), 1, 130, 1, now());
select * from customer where active = 0; 
create table deleted_users (
    customer_id int unique not null primary key,
    store_id int not null,
    first_name varchar(45) default null,
    last_name varchar(45) default null,
    email varchar(50) default null,
    address_id int default null,
    active tinyint(1) default null,
    create_date datetime default null,
    last_update timestamp default null
);
drop table delet_users;
set FOREIGN_KEY_CHECKS=0; delete from customer where active = 0;
SET FOREIGN_KEY_CHECKS=1;
select * from customer where active = 0;

