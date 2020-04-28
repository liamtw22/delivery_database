/*Liam Walsh*/

/*Customer Registration*/
INSERT INTO CUSTOMER  VALUES(8947,'Robert','Jefferson','2156830180','410 Avonwood Rd.');
INSERT INTO PAYMENT VALUES(8947, 'Bank of America', '3659165927591158');

/*Driver Registration*/
INSERT INTO DRIVER VALUES(7036,'John','Wallace','4459476937','391746591');
INSERT INTO CAR VALUES (3856,7036,'GDI68G', 'Audi A4');

/*Restaurant Registration*/
INSERT INTO RESTAURANT VALUES(2057,'1125 Lancaster Ave.', 'Bryn Mawr', 'PA', 'American', 'Snap Pizza' );

/*Find RestaurantID Needed to Place Order*/
SELECT REST.RESTAURANTID, REST.NAME
from RESTAURANT REST
WHERE REST.NAME  = 'Snap Pizza';

/*Placing an Order*/
INSERT INTO FOODORDER VALUES (81, 8947, 2057, 7036, '5:10', 3, '$19.38');

/*Search and Retrieve Card Number for Payment*/
SELECT CUST.FNAME, CUST.LNAME, PAY.CARDNUM, PAY.BANK
from CUSTOMER CUST, PAYMENT PAY
WHERE PAY.PAYMENTCUSTOMERID  = 8947 and CUST.CUSTOMERID = 8947;

/*Enter the Delivery Information*/
INSERT INTO DELIVERS_TO VALUES(8947, 7036,'$3.50','10 min' );

/*Provide the Restaurant Address to the Driver*/
SELECT REST.STREET, REST.TOWN, REST.STATE
from RESTAURANT REST, FOODORDER O
WHERE O.ORDERID = 81 and 
o.orderrestaurantid = rest.restaurantid;

/*Provide Name of Driver and the Car they are Using to Customer*/
SELECT DRIVE.FNAME, DRIVE.LNAME, C.TYPE
from DRIVER DRIVE, CAR C, FOODORDER O
WHERE O.ORDERID = 81 and 
o.orderdriverid = drive.driverid and 
drive.driverid = c.cardriverid;

/*Provide the Customer Address to the Driver*/
SELECT CUST.ADDRESS, CUST.FNAME, CUST.LNAME
from CUSTOMER CUST, FOODORDER O
WHERE O.ORDERID = 81 and 
o.ordercustomerid = cust.customerid;

/*Provide the Time Estimate to the Customer*/
SELECT DELI.TIMEEST
from DELIVERS_TO DELI, FOODORDER O
WHERE O.ORDERID = 81 and 
o.ordercustomerid = deli.delivercustomerid;

/*Provide License Number of Car for Customer Pickup*/
SELECT C.PLATE
from DRIVER DRIVE, CAR C, FOODORDER O
WHERE O.ORDERID = 81 and 
o.orderdriverid = drive.driverid and 
drive.driverid = c.cardriverid;

