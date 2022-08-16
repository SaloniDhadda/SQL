CREATE DATABASE ASSIGNMENT3;


--Create a book table with id as primary key and provide the appropriate data type to other attributes .isbn no should be unique for each book

create table book(
BOOKID INT PRIMARY KEY,
TITLE VARCHAR(70),
AUTHOR VARCHAR(50),
ISBN BIGINT UNIQUE,
PUBLISHED_DATE DATETIME);
DROP TABLE BOOK;
INSERT INTO BOOK VALUES(1,'My First SQL book','Mary Parker',9813533,'2012-02-22 12:08:17'),(2,'My Second sql book','John Mayer',85790,'1972-07-03 09:22:45'),
(3,'My Third SQL book','Cary Fint',52312679,'2015-10-18 14:05:44');



--Write a query to fetch the details of the books written by author whose name ends with er.
SELECT * FROM BOOK WHERE AUTHOR LIKE '%ER';

--Display the Title ,Author and ReviewerName for all the books from the above table

DROP TABLE REVIEWS;
CREATE TABLE REVIEWS(
 id int primary key,
	book_id int references Book(BOOKId),
	reviewer_name varchar(30),
	content varchar(50),
	rating int,
	published_date datetime);
INSERT INTO REVIEWS values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),
(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12'),
(3,2,'Alice Walker','Author review',1,'2017-10-22 23:47:10')

SELECT TITLE,AUTHOR,REVIEWER_NAME FROM BOOK JOIN REVIEWS ON BOOKID=book_id; 

--Display the reviewer name who reviewed more than one book.
SELECT REVIEWER_NAME FROM REVIEWS GROUP BY reviewer_name
HAVING COUNT(reviewer_name)>1

--Display the Name for the customer from above customer table who live in same address which has character o anywhere in address
create table Customer(
    custId int primary key,
	custName varchar(30),
	age int,
	custAddress varchar(30),
	salary float
)
INSERT into Customer values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',4500.00),
(7,'Muffy',24,'Indore',10000.00);

SELECT CUSTNAME FROM Customer WHERE custAddress LIKE '%o%';

--Write a query to display the Date,Total no of customer placed order on same Date

CREATE TABLE ORDERTABLE(
     orderId int primary key,
	 ordDate datetime,
	 customer_Id int references Customer(custId),
	 amount int
);

INSERT INTO ORDERTABLE values(102,'2009-10-08',3,3000),(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060);

SELECT ORDDATE,COUNT(ORDERID) AS 'CUSTOMERTOTAL' FROM ORDERTABLE
GROUP BY ORDDATE;


--Display the Names of the Employee in lower case, whose salary is null


create table EMPLOYEETABLE(
    empId int primary key,
	empName varchar(30),
	age int,
	empAddress varchar(30),
	salary float
);


INSERT INTO EMPLOYEETABLE values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null);

SELECT LOWER(EMPNAME) FROM EMPLOYEETABLE WHERE SALARY IS NULL;

--Write a sql server query to display the Gender,Total no of male and female from the above relation .

create table STUDENTDETAILSTABLE(
       registerNo int primary key,
	   studName varchar(30),
	   age int,
	   qualification varchar(10),
	   mobileNo bigint,
	   mail_id varchar(50),
	   loc varchar(30),
	   gender varchar(2)
);

INSERT INTO STUDENTDETAILSTABLE values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M');

SELECT GENDER,COUNT(GENDER)AS 'MALEFEMALECOUNT' FROM STUDENTDETAILSTABLE group by gender;

--retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
create table COURSEDETAILSTABLE(
       cId varchar(20) primary key,
	   cName varchar(30),
	   startDate date,
	   endDate date,
	   fee float
);



INSERT INTO COURSEDETAILSTABLE values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000);

create table COURSEREGISTRATIONTABLE(
	registerNo int references STUDENTDETAILSTABLE(registerNo),
	cId varchar(20) references COURSEDETAILSTABLE(cId),
	batch varchar(5)
	primary key(registerNo,cId)
);

insert into COURSEREGISTRATIONTABLE values(2,'DN003','FN'),
(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')


   SELECT cs.cId, cName, count(registerNo) as 'TOTALSTUDENT' from COURSEDETAILSTABLE cs join COURSEREGISTRATIONTABLE cr
   on cs.cId = cr.cId
   group by cName, cs.cId
   order by cs.cId DESC;


-- display first name and last name of the customer who has placed exactly 2 order
create table CUST(
	cId int primary key,
	firstName varchar(30),
	lastName varchar(30)
)

insert into CUST values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')



create table ORD(
	orderId int primary key,
	orderDate date,
	amount float,
	customerId int
)

insert into ORD values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-08-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)



   select firstName, lastName from CUST c join ORD O
   on c.cId = o.customerId
   group by firstName, lastName
   having count(customerId) = 2

--   display all student names in reverse order and capitalise all character in location
   select studName, Upper(loc) from STUDENTDETAILSTABLE
   order by studName desc


-- create a view to display the product name, ordered quantity, ordername

create table ORDERTABLE1(
	ordId int primary key,
	orderDate date,
	orderNumber int,
	customerId int,
	totalAmount float
)

create table PRODUCTTABLE(
	prodId int primary key,
	productName varchar(50),
	supplierId int,
	unitPrice float,
	package float,
	isDiscontinued bit
)

create table ORDERTABLEItem1(
	id int primary key,
	orderId int references ORDERTABLE1(ordId),
	productId int references PRODUCTTABLE(prodId),
	unitPrice float,
	quantity int
)



   create view ORDERPRODUCTVIEW as
   select productName, quantity, orderNumber from PRODUCTTABLE PR
   join ORDERTABLEItem1 OO on PR.prodId = OO.productId join ORDERTABLE1 o on o.ordId = OO.orderId;

   SELECT * from ORDERPRODUCTVIEW;

-- display course name registered by Nisha

   select studName, cName from STUDENTDETAILSTABLE sd join COURSEREGISTRATIONTABLE cr on cr.registerNo = sd.registerNo join COURSEDETAILSTABLE cd
   on cd.cId = cr.cId
   where studName ='Nisha';