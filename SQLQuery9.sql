--1.Prepare script to create table1 and table2 with primary key
CREATE TABLE Companies (
  id int,
  name varchar(50),
  address text,
  email varchar(50),
  phone varchar(10)
);
INSERT INTO Companies(id,name,address,email,phone)
VALUES(2000,'Bosch','Koramangala','Bosch@abc',6656755667),
(2001,'Accenture','Jayangar','Accenture@abc',6757385667),
(2002,'Tricon','Kengeri','Tricon@abc',9953746325),
(2003,'Infotech','Jp','Infotech@abc',7353573567),
(2004,'Dgenx','Koramangala','Dgenx@abc',8753344578);

--2. Prepare script to add foreign key constraint on any one table

CREATE TABLE Employee (
  Empid int primary key,
  id int,
  Fname varchar(50),
  Lname varchar(50),
  address text,
  email varchar(50),
  phone varchar(10),
  constraint FK_Employee foreign key(id) references Companies (id)

);
INSERT into Employee(Empid,id,Fname,Lname,email,phone)
VALUES(1000,2000,'Hardy','Tom','Hardy@abc','9757546467'),
(1001,2000,'Strange','steven','Starnge@abc','8765656543'),
(1002,2001,'Holland','Tom','Holland@abc','9876765678'),
(1003,2002,'Lord','Star','Lord@abc','9876765443'),
(1004,2002,'Thanos','Euros','Thanos@abc','6677885654');

--3. Prepare script to add unique constraint to any one column
ALTER TABLE Employee
Add UNIQUE (Empid);

--4. Prepare script to add index to any column
CREATE INDEX serialNo on Companies ( id ,
  name,
  address ,
  email ,
  phone);

--5. Create insert queries to add around 4 to 8 rows in both the tables
INSERT into Employee(Empid,id,Fname,Lname,email,phone)
VALUES(1005,2003,'Sumith','Anshul','Sumith@abc','9757546468'),
(1006,2003,'Kedar','steven','Kedar@abc','8765656544'),
(1007,2001,'Kathir','Tom','Kathir@abc','9876765679');

--6. Prepare a select query using WHERE, 'NOT IN', LIKE and ORDER BY clause
select Fname, Lname from Employee where address = 'Bangalore' Order By id;
select Fname, Lname from Employee where NOT address = 'Bangalore';
select Fname from Employee where  Fname Like 'S%';


--7. Prepare a select query using GROUP BY and HAVING clause, with COUNT, SUM

select count(id),address from Employee group by address; 
select count(id),address from Employee group by address having count(id)>1; 
select sum(id),address from Employee group by address; 


--8. Prepare a INNER JOIN query between table1 and table2

select e.Fname as FirstName ,c.name as Companyname from Companies c Inner join Employee e on c.id=e.id;

--9. Prepare LEFT JOIN query between table1 and table2

select e.Fname as FirstName ,c.name as Companyname from Companies c Left join Employee e on c.id=e.id;