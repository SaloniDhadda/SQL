CREATE DATABASE SQLASSIGNMENT;

CREATE TABLE CLIENTS(
Client_ID INT Primary Key,

Cname VARCHAR(40) Not Null,

Address VARCHAR(30),

Email VARCHAR(30) Unique,

Phone VARCHAR(10),

Business VARCHAR(20) Not Null );

INSERT INTO CLIENTS values (1001, 'ACME Utilities', 'Noida' ,'contact@acmeutil.com' ,9567880032 ,'Manufacturing'),

(1002, 'Trackon Consultants' ,'Mumbai' ,'consult@trackon.com' ,8734210090 ,'Consultant'),

(1003,'MoneySaver Distributors', 'Kolkata','save@moneysaver.com', 7799886655 ,'Reseller'),

(1004, 'Lawful Corp' ,'Chennai' ,'justice@lawful.com' ,9210342219 ,'Professional');
select * from CLIENTS;

CREATE TABLE EMPLOYEES(

Empno INT Primary Key,

Ename VARCHAR(20) Not Null,

Job VARCHAR(15),

Salary MONEY constraint CHECK_SALARY
CHECK(salary > 0),

Deptno INT Foreign Key REFERENCES DEPARTMENTS (DEPTNO));

insert into EMPLOYEES values (7001 ,'Sandeep', 'Analyst' ,25000 ,10),

(7002, 'Rajesh', 'Designer' ,30000, 10),

(7003 ,'Madhav',' Developer', 40000 ,20),

(7004, 'Manoj','Developer', 40000 ,20),

(7005 ,'Abhay' ,'Designer' ,35000, 10),

(7006 ,'Uma', 'Tester' ,30000,30),

(7007 ,'Gita' ,'Tech. Writer' ,30000 ,40),

(7008 ,'Priya','Tester' ,35000 ,30),

(7009 ,'Nutan' ,'Developer' ,45000 ,20),

(7010 ,'Smita', 'Analyst' ,20000 ,10),

(7011 ,'Anand', 'Project Mgr' ,65000, 10);

CREATE TABLE DEPARTMENTS(
Deptno INT Primary Key,

Dname VARCHAR(15) Not Null,

Loc VARCHAR(20));
insert into DEPARTMENTS values(10 ,'Design' ,'Pune'),

(20 ,'Development', 'Pune'),

(30, 'Testing','Mumbai'),

(40, 'Document' ,'Mumbai');

CREATE TABLE PROJECTS(
Project_ID INT Primary Key,
Descr VARCHAR(30) Not Null ,
Start_Date DATE,
Planned_End_Date DATE,
Actual_End_date DATE ,
Budget INT,
constraint checkbud CHECK(Budget> 0),
constraint checkactual CHECK(Actual_End_date > Planned_End_Date),
Client_ID int Foreign Key REFERENCES Clients (Client_ID)); 
insert into PROJECTS values (401, 'Inventory', '01-Apr-11' ,'01-Oct-11', '31-Oct-11' , 150000 ,1001),
(402 ,'Accounting','01-Aug-11' ,'01-Jan-12',null,500000, 1002),
(403,'Payroll', '01-Oct-11', '31-Dec-11',NULL,75000, 1003),
(404,'Contact Mgmt' ,'01-Nov-11', '31-Dec-11',NULL, 50000, 1004);

SELECT * FROM PROJECTS;

create table EmpProjectTasks(
Project_ID INT REFERENCES PROJECTS(PROJECT_ID),

Empno INT  REFERENCES EMPLOYEES(EMPNO),


Start_Date DATE  ,

End_Date DATE  ,

Task VARCHAR(25) Not Null,

Status VARCHAR(15) Not Null,
PRIMARY KEY(PROJECT_ID,EMPNO));

INSERT INTO EmpProjectTasks values (401, 7001,'01-Apr-11', '20-Apr-11', 'System Analysis' ,'Completed'),

(401, 7002,'21-Apr-11', '30-May-11', 'System Design', 'Completed'),
(401 ,7003 ,'01-Jun-11' ,'15-Jul-11' ,'Coding' ,'Completed'),
(401, 7004 ,'18-Jul-11', '01-Sep-11' ,'Coding' ,'Completed'),
(401, 7006, '03-Sep-11', '15-Sep-11' ,'Testing', 'Completed'),
(401, 7009, '18-Sep-11', '05-Oct-11' ,'Code Change', 'Completed'),
(401 ,7008 ,'06-Oct-11' ,'16-Oct-11' ,'Testing', 'Completed'),
(401 ,7007, '06-Oct-11' ,'22-Oct-11' ,'Documentation' ,'Completed'),
(401, 7011,'22-Oct-11', '31-Oct-11' ,'Sign off' ,'Completed'),
(402, 7010, '01-Aug-11', '20-Aug-11' ,'System Analysis' ,'Completed'),
(402 ,7002,'22-Aug-11', '30-Sep-11' ,'System Design' ,'Completed'),
(402 ,7004, '01-Oct-11' ,null,'Coding' ,'In Progress');

select * from EmpProjectTasks;