
--- PRACTICE 1 ----




-- Creating a database students --

create database students

use students

create table student(studentid int,fname varchar(56),lname varchar(34),location varchar(45),dep char(45))

insert into student(studentid,fname,lname,location,dep)
values
(1,'Aarsh','Vanjari','Vasai','IT'),
(2,'Jigar','Patel','Nalasopara','CS'),
(3,'Aditya','Parekar','Mira Road','IT'),
(4,'Raj','Sodhi','Vasai','CS'),
(5,'Joti','Kapoor','Vasai','CS'),
(6,'Swati','Sodhi','Mira Road','IT'),
(7,'Karan','Swami','Vasai','IT'),
(8,'Virat','Kohli','Vasai','IT');


select * from student

-- Finding Distinct Location --

select distinct location from student

select distinct lname from student

-- Order By Clause -- 

select * from student

select * from student
order by fname

select * from student
order by dep

-- Where Clause --

select * from student

select * from student 
where dep = 'IT'

select * from student
where dep = 'IT' and location ='Vasai'

-- Operators (And,Or,between,In) -- 

select * from student

select * from student
where location = 'Nalasopara' and dep = 'CS'

select * from student 
where location in ('Nalasopara','Mira Road')

-- Update the location of swati sodhi to nalasopara --

update student
set lname = 'Sodhi'
where studentid = 4

-- Update the dep of Aarsh to Data --

update student
set dep = 'Data'
where fname = 'Aarsh'

-- Single Line Comments --

/*
	Multi Line Comments
						 */


-- delete,drop,truncate--

delete from student
where fname = 'Virat'

select * from student

delete from student
where dep = 'Data'

truncate table student

drop table student

drop database students


-- creating data base again --


-- Creating a table with more columns, including a varchar column
CREATE TABLE Sales (
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    StoreID INT,
    SalespersonID INT,
    PaymentMethod VARCHAR(50)  -- New varchar column for payment method
);

-- Inserting more sample data (10 records), including NULL values
INSERT INTO Sales (ProductID, SaleDate, Quantity, TotalAmount, CustomerID, StoreID, SalespersonID, PaymentMethod)
VALUES 
(1, '2023-08-01', 10, 200.00, 101, 1, 201, 'Credit Card'),
(2, '2023-08-01', 5, 150.00, 102, 1, 202, 'Cash'),
(1, '2023-08-02', 8, 160.00, 103, 2, 203, 'Credit Card'),
(2, '2023-08-02', 7, 210.00, 104, 2, 204, 'Cash'),
(1, '2023-08-03', 6, 120.00, 105, 1, 201, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-04', 12, 300.00, 106, 3, 205, 'Credit Card'),
(1, '2023-08-04', 5, 100.00, 107, 3, 206, 'Debit Card'),
(2, '2023-08-05', 9, 270.00, 108, 1, 202, NULL),              -- NULL value in PaymentMethod
(3, '2023-08-05', 15, 375.00, 109, 3, 207, 'Cash'),
(1, '2023-08-06', 7, 140.00, 110, 2, 203, 'Credit Card');


-- viewing the sales table

select * from Sales

-- using Null Operator

select * from Sales
where PaymentMethod is null

-- For CustomerID 105 set the Payment Method = Cash and CustomerID 108 set the Payment Method = Online Instead of Null --

update Sales
set PaymentMethod = 'Cash' 
where CustomerID = 105 

update Sales
set PaymentMethod = 'Online' 
where CustomerID = 108

select * from Sales

-- View the top 5 rows --

select top 5 * from Sales

-- Aggregate funcation --

select * from Sales

-- Aggregate funcation Max --

select max(quantity) as Maximum_Quantity from Sales

select ProductID,max(quantity) as Quantity from Sales
group by ProductID

-- Aggregate funcation Min --

select min(quantity) as Maximum_Quantity from Sales

select ProductID,min(quantity) as Quantity from Sales
group by ProductID

-- Aggregate funcation Sum --

select ProductID,max(quantity) as Quantity ,  sum(TotalAmount) as TotalAmount from Sales
group by ProductID

-- Aggregate funcation Count --

select * from Sales

select ProductID,count(PaymentMethod) as CASH_COUNT from Sales
where PaymentMethod = 'Cash'
group by ProductID
having count(PaymentMethod) >= 2

drop table Sales

-- Joins --

--Creating Table1 & insertinting records in Table1
create table table1 (C1 int, C2 nvarchar(max))
insert into table1 values (1,'A'),
(1,'B'),
(2,'C'),
(NULL,'D'),
(3,'E'),
(7,'DA')

--Creating Table2 & insertinting records in Table2
create table table2 (C1 int, C3 nvarchar(max))
insert into table2 values (1,'XA'),
(2,'MB'),
(2,'NX'),
(NULL,'MO'),
(4,'XY'),
(5,'TF')

-- So i have created a table1 and table2

select * from table1;
select * from table2;

-- inner join -- 

select * from table1 a
inner join table2 b
on a.c1=b.C1

-- left join --

select * from table1 a
left join table2 b
on a.c1 = b.c1

-- right join --

select * from table1 a
right join table2 b
on a.c1 = b.c1

-- left anti / right anti -- 

select * from table1
select * from table2

select * from table1 a
left join table2 b
on a.c1 = b.c1
where b.C3 is null

select * from table1 a
right join table2 b
on a.c1 = b.c1
where a.C2 is null

-- self join -- 

select * from table1 a
inner join table1 b
on a.c1 = b.c1

-- full outer join --

select * from table1 a
full outer join table2 b
on a.c1 = b.c1

-- like operator -- 

select * from Sales

select * from Sales
where PaymentMethod like 'C%'

select * from Sales
where PaymentMethod like '%as%'

-- Copy the data into the another table --

select * into Sales2 from Sales

select * from Sales
select * from Sales2

drop table sales2

-- Copy Selected Parts from the Sales Table --

select * from Sales

select CustomerId,ProductId,saledate,paymentmethod into Customers from Sales


select * from Sales
select * from Customers

-- temporary tables -- 

select * into #temp1 from Sales

select * from #temp1


drop table Sales
drop table table1
drop table table2



-- Constraints --

-- TYPE1 :- Not NUll Constraints --

create table not_null(empid int not null,f_name varchar(34),l_name varchar(34),age int)

insert into not_null(empid,f_name,l_name,age)
values
(1,'Aarsh','Vanjari',33),
(2,'Rajesh','Vanjari',33),
(3,'Vaishali','Vanjari',33)

insert into not_null(empid,f_name,l_name,age)
values
(4,'Aarsh','Vanjari',55)

select * from not_null

insert into not_null(empid,f_name,l_name,age)
values
(0,'Aarsh','Vanjari',55)


-- TYPE2 :- UniqueConstraints --

create table uniques(empid int unique,fname varchar(34),lname varchar(43))

insert into uniques(empid,fname,lname)
values
(1,'Aarsh','Vanjari'),
(2,'Rajesh','Vanjari'),
(3,'Vaishali','Vanjari')

-- TYPE3 :- Check Constraints --

create table Checks(empid int unique,fname varchar(34),lname varchar(43),age int check(age>18))

insert into Checks(empid,fname,lname)
values
(1,'Aarsh','Vanjari'),
(2,'Rajesh','Vanjari'),
(3,'Vaishali','Vanjari')

-- TYPE 4  :- Default Constraints --

create table Defaults(empid int unique,fname varchar(34) default('Rohit'),lname varchar(43),age int)

insert into Defaults(empid,lname,age)
values
(4,'Vanjari',44)


select * from defaults

alter table defaults
add unique(fname)





