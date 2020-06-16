create database RestaurantSystem;
use [RestaurantSystem];

create table customers(
CustomerID int not null,
first_name varchar(30),
last_name varchar(30),
phoneNO varchar (20),
Email varchar(100),
Primary key(CustomerID)
);

create table chefs(
chefID int not null,
first_name varchar(30),
last_name varchar(30),
phoneNO varchar (20),
salary int,
primary key(chefID)
);


create table waiters(
waiterID int not null,
first_name varchar(30),
last_name varchar(30),
phoneNO varchar (20),
salary int,
primary key(waiterID)
);


create table cashiers(
cashierID int not null,
first_name varchar(30),
last_name varchar(30),
phoneNO varchar (20),
salary int,
primary key(cashierID)
);


create table categories(
categoryID int not null,
category_name varchar(30),
price int,
primary key(categoryID)
);

create table orders(
orderID int not null,
catID int not null,
custID int not null,
waitID int not null,
cashID int not null,
cheID int not null,
primary key(orderID),
foreign key (catID) references categories(categoryID),
foreign key (custID) references customers(CustomerID),
foreign key (waitID) references waiters(waiterID),
foreign key (cashID) references cashiers(cashierID),
foreign key (cheID) references chefs(chefID),
);

/* Insert statements */
insert into customers values(13,'shreif','ashraf','0105464841','shreifashraf51@yahoo.com');

insert into chefs values(1,'shady','ashraf','0123454684',5500);

insert into waiters values(1,'sena','samr','010458742354',3500);

insert into cashiers values(1,'sharf','ezz','01248741547',4300);

insert into categories values(1,'salad',40);

insert into orders values(1,1,1,1,1,1);


/* 20 select statements */
select * from customers;

select * from chefs;

select * from waiters;

select * from categories;

select * from cashiers;

select phoneNO from customers;

select Email from customers;

select first_name from chefs;

select salary from waiters;

select salary from cashiers;

select phoneNO,first_name,last_name from Customers;

select Email,phoneNO from Customers;

select first_name,last_name,chefID from chefs;

select chefID,salary from chefs;

select first_name,last_name,salary from waiters;

select waiterID,salary from waiters;

select salary,first_name,last_name from cashiers;

select cashierID,salary from cashiers;

select category_name,price from categories;

select categoryID,price from categories;



/* Sub Query */

select * from chefs where chefID IN (SELECT cheID FROM orders WHERE cheID = 1) ;

select * from cashiers where cashierID IN (SELECT cashID FROM orders WHERE  cashID = 1);

select * from customers WHERE CustomerID IN(SELECT custID FROM orders WHERE custID = 1);



/* Count and Group */

select first_name,last_name from customers 
where last_name like 'X%'
group by last_name,Email; 


SELECT COUNT(first_name) FROM waiters
GROUP BY first_name


/* Joins */

select first_name , last_name, Email   from customers
left join orders on CustomerID = orderID;
 
select customers.first_name, customers.last_name,customers.Email from customers
inner join chefs on customerID = chefID;
 
select customers.first_name , customers.last_name,customers. Email from customers
full join orders on customers.CustomerID = orders.orderID;
 
select cashiers.cashierID , cashiers.first_name, cashiers.last_name from cashiers
join chefs on cashiers.cashierID = chefs.chefID;
 
select cashiers.cashierID , cashiers.first_name, cashiers.last_name from cashiers
right join chefs on cashiers.cashierID = chefs.chefID;


/* Update */

UPDATE chefs SET salary = 25000 WHERE chefID = 1;
UPDATE waiters SET phoneNO = '01025487854' WHERE first_name = 'ahmed';
UPDATE waiters SET salary = 3500 WHERE last_name = 'khaled';
UPDATE categories SET price = 30 WHERE categoryID = 1;
UPDATE categories SET price = 20 WHERE category_name = 'salad';

/* DELETE */

delete from cashiers where first_name='Ahmed';
delete from categories where price=200;
delete from waiters where waiterID=1;
delete from chefs where last_name='shreif';
delete from customers where first_name='salem' and last_name='mohamed';
