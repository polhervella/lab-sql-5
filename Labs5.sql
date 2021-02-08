-- 1. Drop column picture from staff.

alter table sakila.staff
drop column picture;

-- checking it... 

select *
from sakila.staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select *
from sakila.staff;

select *
from sakila.customer
where first_name = 'TAMMY';

insert into sakila.staff
values (3,'Tammy','Sanders',79,'Tammy.sanders@sakilacustomer.org',2,1,'Tammy',NULL,'2021-02-08 11:00:00');

-- should we also do a drop from the customer table?

-- checking it... 

select *
from sakila.staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 

select *
from sakila.rental;

select count(rental_id)
from sakila.rental
where rental_id BETWEEN 10000 AND 16000;

select COUNT(*)
from sakila.rental;

insert into sakila.rental
values (16050,'2021-02-08 11:00:00',1,130,'2021-02-10 17:00:00',1,'2021-02-08 11:00:00');

-- checking it... 

select *
from sakila.rental
where rental_id = 16050;

-- 4. creating backup table and deleting non-active users

CREATE TABLE sakila.deleted_users (
`customer_id` smallint(11) UNIQUE NOT NULL,
`email` varchar(50) DEFAULT NULL,
`date` datetime(6) DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (customer_id)
  );


INSERT INTO sakila.deleted_users(customer_id,email)
SELECT customer_id,email FROM sakila.customer
WHERE active =0;

delete from sakila.customer where active = 0;

-- safe mode..




