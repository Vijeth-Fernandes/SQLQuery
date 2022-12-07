--1.Prepare script to create table1 and table2 with primary key
CREATE TABLE Company (
  com_id int,
  com_name varchar(50),
  com_address varchar(50),
  com_Email varchar(50),
  com_Phone varchar(10)
);
INSERT INTO Company(com_id,com_name,com_address,com_Email,com_Phone)
VALUES(2000,'Bosch','Koramangala','Bosch@abc',6656755667),
(2001,'Accenture','Jayangar','Accenture@abc',6757385667),
(2002,'Tricon','Kengeri','Tricon@abc',9953746325),
(2003,'Infotech','Jp','Infotech@abc',7353573567),
(2004,'Dgenx','Koramangala','Dgenx@abc',8753344578);

--2. Prepare script to add foreign key constraint on any one table

CREATE TABLE Employee (
  emp_id int primary key,
  id int,
  emp_Fname varchar(50),
  emp_Lname varchar(50),
  emp_Email varchar(50),
  emp_Phone varchar(10),
  constraint FK_Employee foreign key(id) references Company (com_id)
);


INSERT into Employee(emp_id,id,emp_Fname,emp_Lname,emp_Email,emp_Phone)
VALUES(1000,2000,'Hardy','Tom','Hardy@abc','9757546467'),
(1001,2000,'Strange','steven','Starnge@abc','8765656543'),
(1002,2001,'Holland','Tom','Holland@abc','9876765678'),
(1003,2002,'Lord','Star','Lord@abc','9876765443'),
(1004,2002,'Thanos','Euros','Thanos@abc','6677885654');

--3. Prepare script to add unique constraint to any one column
ALTER TABLE Employee
Add UNIQUE (emp_id);

--4. Prepare script to add index to any column
CREATE INDEX serialNo on Company ( com_id);

--5. Create insert queries to add around 4 to 8 rows in both the tables
INSERT into Employee(Empid,id,Fname,Lname,email,phone)
VALUES(1005,2003,'Sumith','Anshul','Sumith@abc','9757546468'),
(1006,2003,'Kedar','steven','Kedar@abc','8765656544'),
(1007,2001,'Kathir','Tom','Kathir@abc','9876765679');

--6. Prepare a select query using WHERE, 'NOT IN', LIKE and ORDER BY clause
select com_name from Company where com_address = 'Jp' Order By com_id;
select com_name from Company where NOT com_address = 'Jp';
select emp_Fname from Employee where  emp_Fname Like 'S%';

--output
com_name
Infotech

com_name
Bosch
Accenture
Tricon
Dgenx

emp_Fname
Strange
Sumith


--7. Prepare a select query using GROUP BY and HAVING clause, with COUNT, SUM

select count(com_id) as noOfEmp from Company group by com_address; 
select count(com_id) as noOfEmp from Company group by com_address having COUNT(com_id) > 1;  
select sum(emp_id) from Employee;

--output
noOfEmp
1
1
1
2

noOfEmp
2

sum
8028


--8. Prepare a INNER JOIN query between table1 and table2

select e.emp_Fname as FirstName ,c.com_name as Companyname from Company c inner join Employee e on c.com_id=e.emp_id;

--output
FirstName	CompanyName
Hardy		Bosch
Strange		Bosch
Holland		Accenture
Lord		Tricon
Thanos		Tricon
Sumith		Infotech
Kedar		Infotech
Kathir		Accenture


--9. Prepare LEFT JOIN query between table1 and table2

select e.emp_Fname as FirstName ,c.com_name as Companyname from Company c left join Employee e on c.com_id=e.emp_id;

--output
FirstName	CompanyName
Hardy		Bosch
Strange		Bosch
Holland		Accenture
Kathir		Accenture
Lord		Tricon
Thanos		Tricon
Sumith		Infotech
Kedar		Infotech
NULL		Dgenx
