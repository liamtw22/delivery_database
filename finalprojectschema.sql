/*Liam Walsh*/

DROP TABLE customer CASCADE CONSTRAINTS;
CREATE TABLE customer (
customerid number(4),
fname    varchar2(15) not null, 
lname    varchar2(15) not null,
phone    varchar2(10),
address  varchar2(50) not null,
constraint customer_pk primary key(customerid)
);

DROP TABLE driver CASCADE CONSTRAINTS;
CREATE TABLE driver (
driverid number(4),
fname    varchar2(15) not null, 
lname    varchar2(15) not null,
phone    varchar2(10) not null,
licensenum  varchar2(9) not null,
constraint driver_pk primary key(driverid)
);

DROP TABLE restaurant CASCADE CONSTRAINTS;
CREATE TABLE restaurant (
restaurantid number(4),
street   varchar2(25) not null, 
town   varchar2(20) not null, 
state   varchar2(2) not null, 
foodtype    varchar2(50) not null,
name  varchar2(50) not null,
constraint restaurant_pk primary key(restaurantid)
);

DROP TABLE car CASCADE CONSTRAINTS;
CREATE TABLE car (
carid number(4),
cardriverid number(4),
plate    varchar2(6) not null, 
type    varchar2(15) not null,
constraint car_pk primary key (cardriverid,carid),
constraint cardriver_fk foreign key(cardriverid) references driver(driverid)
);

DROP TABLE foodorder CASCADE CONSTRAINTS;
CREATE TABLE foodorder (
orderid    number(4),
ordercustomerid number(4),
orderrestaurantid number(4),
orderdriverid number(4),
ordertime varchar2(5),
items varchar2(100),
price varchar2(10),
constraint foodorder_pk primary key (ordercustomerid, orderrestaurantid, orderdriverid, orderid),
constraint ordercustomer_fk foreign key(ordercustomerid) references customer(customerid),
constraint orderrestaurant_fk foreign key(orderrestaurantid) references restaurant(restaurantid),
constraint orderdriver_fk foreign key(orderdriverid) references driver(driverid)
);

DROP TABLE payment CASCADE CONSTRAINTS;
CREATE TABLE payment (
paymentcustomerid     number(4),
bank varchar2(30) not null,
cardnum varchar2(16) not null,
constraint payment_pk primary key (paymentcustomerid),
constraint paymentcustomer_fk foreign key(paymentcustomerid) references customer(customerid)
);

DROP TABLE delivers_to CASCADE CONSTRAINTS;
CREATE TABLE delivers_to (
delivercustomerid     number(4),
deliverdriverid     number(4),
tip  varchar2(7),
timeest varchar2(7) not null,
constraint deliver_pk primary key (delivercustomerid, deliverdriverid),
constraint delivercustomer_fk foreign key(delivercustomerid) references customer(customerid),
constraint deliverdriver_fk foreign key(deliverdriverid) references driver(driverid)
);
