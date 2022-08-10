create database ASSIGNMENT;

create table Dept(
deptno int primary key,
dname varchar(30),
loc varchar(30));


create table Emp(
empno int primary key,
 ename varchar(30), 
 job varchar(30),
 mgrid float,
 hiredate DATETIME,
 sal float,
 comm int, 
deptno int);

begin
INSERT INTO EMP VALUES
  (7369, 'SMITH', 'CLERK', 7902, '17-DEC-1980', 800, NULL, 20)
INSERT INTO EMP VALUES
  (7499, 'ALLEN', 'SALESMAN', 7698, '20-FEB-1981', 1600, 300, 30)
INSERT INTO EMP VALUES
  (7521, 'WARD', 'SALESMAN', 7698, '22-FEB-1981', 1250, 500, 30)
INSERT INTO EMP VALUES
  (7566, 'JONES', 'MANAGER', 7839, '2-APR-1981', 2975, NULL, 20)
INSERT INTO EMP VALUES
  (7654, 'MARTIN', 'SALESMAN', 7698, '28-SEP-1981', 1250, 1400, 30)
INSERT INTO EMP VALUES
  (7698, 'BLAKE', 'MANAGER', 7839, '1-MAY-1981', 2850, NULL, 30)
INSERT INTO EMP VALUES
  (7782, 'CLARK', 'MANAGER', 7839, '9-JUN-1981', 2450, NULL, 10)
INSERT INTO EMP VALUES
  (7788, 'SCOTT', 'ANALYST', 7566, '09-DEC-1982', 3000, NULL, 20)
INSERT INTO EMP VALUES
  (7839, 'KING', 'PRESIDENT', NULL, '17-NOV-1981', 5000, NULL, 10)
INSERT INTO EMP VALUES
  (7844, 'TURNER', 'SALESMAN', 7698, '8-SEP-1981', 1500, 0, 30)
INSERT INTO EMP VALUES
  (7876, 'ADAMS', 'CLERK', 7788, '12-JAN-1983', 1100, NULL, 20)
INSERT INTO EMP VALUES
  (7900, 'JAMES', 'CLERK', 7698, '3-DEC-1981', 950, NULL, 30)
INSERT INTO EMP VALUES
  (7902, 'FORD', 'ANALYST', 7566, '3-DEC-1981', 3000, NULL, 20)
INSERT INTO EMP VALUES
  (7934, 'MILLER', 'CLERK', 7782, '23-JAN-1982', 1300, NULL, 10)
end

SELECT * FROM EMP;

INSERT INTO Dept VALUES
(10 , ' ACCOUNTING' , ' NEW YORK ')
INSERT INTO Dept VALUES
(20  , '  RESEARCH ' , '  DALLAS') 

INSERT INTO Dept VALUES
(30,'SALES '  , '  CHICAGO ')

INSERT INTO Dept VALUES
(40    , 'OPERATIONS '   ,'BOSTON')

SELECT * FROM DEPT;


--1. List all employees whose name begins with 'A'. 

SELECT * FROM EMP 
WHERE ENAME LIKE 'A%';

--2. Select all those employees who don't have a manager. 

SELECT * FROM EMP WHERE mgrid IS NULL;

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 

SELECT ename, empno, sal FROM EMP WHERE  1200 < SAL  AND SAL > 1400;

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 

UPDATE EMP
SET SAL = sal + sal*.10 WHERE deptno=10;

SELECT * FROM EMP;

--5. Find the number of CLERKS employed. Give it a descriptive heading. 

SELECT COUNT(*) AS DESIGNATIONCLERK FROM EMP WHERE job='CLERK';

--6. Find the average salary for each job type and the number of people employed in each job. 

SELECT JOB,COUNT(*) AS NUMBER , AVG(SAL) AS AVERAGESAL 
FROM EMP GROUP BY job;

--7. List the employees with the lowest and highest salary. 

SELECT MAX(SAL),MIN(SAL)
FROM EMP;

--8. List full details of departments that don't have any employees. 
SELECT * FROM DEPT WHERE Deptno NOT IN (SELECT Deptno FROM EMP);

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
SELECT ENAME,SAL FROM EMP WHERE JOB='ANALYST' AND SAL>1200 AND deptno=20 ORDER BY ENAME;


--10. For each department, list its name and number together with the total salary paid to employees in that department. 

SELECT D.DNAME,E.DEPTNO,SUM(SAL) FROM EMP E, DEPT D WHERE E.deptno=D.deptno GROUP BY E.deptno,D.dname;


--11. Find out salary of both MILLER and SMITH.
SELECT ENAME,SAL FROM EMP WHERE ename IN('MILLER','SMITH')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 

SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'M%';

--13. Compute yearly salary of SMITH. 

select ename,sal*12 AS ANNUALSALARY FROM EMP WHERE ENAME='SMITH';

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 

SELECT ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 2850;