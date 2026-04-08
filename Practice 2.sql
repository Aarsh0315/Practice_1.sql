create database practice
use practice




CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);


select * from Students


-- WINDOW FUNCTIONS ---

-- ROW FUNCATION --

select *,ROW_NUMBER() over(order by marks desc) as Row
from Students

-- RANK FUNCATION --

select *,RANK() over(order by marks desc) as RANK
from Students

-- DENSE RANK FUNCATION --

select *,DENSE_RANK() over(order by marks desc) as DENSE_RANK
from Students

-- Using partion with RANK,ROW,DENSE RANK --

select *,ROW_NUMBER() over(partition by subject order by marks desc) as Row_num
from Students

-- Lead FUNCTION --

-- NEW TABLE CREATE --

-- Create a table to store monthly profit data for different products
CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);

-- LEAD FUNCTION --

select * from ProfitData

select *, LEAD(Profit) over(partition by Product order by MonthNumber) as Nextmonth
from ProfitData

select MonthNumber,MonthName,sum(Profit) as Profit,
LEAD(sum(Profit)) over(order by MonthNumber asc) as Next_Profit
from ProfitData
group by MonthName,MonthNumber
order by MonthNumber


-- LAG FUNCTION --

select * from ProfitData

select *,
LAG(Profit) over(partition by Product order by MonthNumber) as Previous_Profit
from ProfitData

select MonthNumber,MonthName,sum(Profit) as Profit,
LAG(sum(Profit)) over(order by MonthNumber) as Previous_Profit
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber



-- NEW DATABASE --

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);



-- isnull , coalesce function --

select * from Customers

select CustomerID,isnull(Email,'No Email'),isnull(PhoneNumber,'No Phone Number')from Customers

select CustomerID,coalesce(Email,PhoneNumber,'NA') from Customers

-- NEW TABLE --

CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

select *,
FIRST_VALUE(EmployeeName) over(order by Salary) as Minimum_Salary
from EmployeeSalaries

select *,
LAST_VALUE(EmployeeName) over(order by Salary) as Minimum_Salary
from EmployeeSalaries


