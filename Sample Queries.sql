--creating database
create database BikeStore
create database ProductDb
--Delete a database
DROP database ProductDb
drop database if Exists ProductDb;
--modify the databse Name from ProductDb to ProductAPP
alter database ProductDb Modify Name= ProductApp
--Navigate to userdefined database
use BikeStore
--Create a table Bikes
create table Bikes(
BikeId int primary key,
BikeName varchar(20) not null,
Price decimal not null)

--change the table name ProductTbl to Products
exec sp_rename 'ProductTbl','Products'
--deleting a table
drop table Products
--add a column CategoryId to bikes table 
alter table Bikes
add CategoryId int

--creating table with database Name
create table BikeStore.dbo.Categories(
Id int identity primary Key,
CategoryName varchar(20))
--command to check structure of the table
Exec sp_help Categories
--add foreign key constraint on categoryId of Bikes Table
alter table Bikes
add constraint FK_Bikes_CategoryId
foreign key (CategoryId) references Categories(Id)
Exec sp_help Bikes

--add stock column to Bikes Table
alter table Bikes
add  Stocks varchar(50) not null
--Delete the column Stock from Bikes table
alter table Bikes
drop column Stocks

--change the existing datatype of Stocks column to int
alter table Bikes
alter column Stocks int
--Renaming existing Column
Exec sp_rename 'Bikes.Stocks','Stock','COLUMN'

--Insert values into CategoriesTable
--Insert into Categories(Id,CategoryName) values (1,'Racing')
Insert into Categories(CategoryName) values ('Racing')
Insert into Categories(CategoryName) values ('RoadBikes')

--select columns of categories table
select * from Categories

--create table stores(storeId,StoreName, Phone, City)
create Table Stores(
storeId int identity(100,2) primary Key,
storeName varchar(50) not null,
phone varchar(50) not null,
City varchar(20) not null)

--Insert data into Stores Table
Insert into Stores values('RelianceRetail','123456','Chennai'),
						 ('D-Mart','987650','Bangalore')
Insert into Stores(storeName,phone) values('MyBikes','6789')
select * from Stores
-- difference between varchar,char and nvarchar
declare @value char(10)='vani'
print @value
print datalength(@value)
print len(@value)

declare @name varchar(10)='vani'
print @name
print datalength(@name)
print len(@name)

declare @name1 nvarchar(10)='vani'
print @name1
print datalength(@name1)
print len(@name1)
select * from Categories
Insert into Bikes values(1,'Duke',50000,2,100)
Insert into Bikes values(2,'Trek Bike',100000,1,50)

--Insert with Select Statement
Insert into BikesInfo
select BikeName,Price from Bikes
select * from BikesInfo
--Insert and Return Inserted Values
Insert into Categories(CategoryName) 
output inserted.Id
values('Accessories')
select * from Bikes
--update a data in a table
--update single column
update Bikes
set Price=90000
where BikeId=1
--update multiple columns
update Bikes
set Price=93000,Stock=100
where BikeName='Duke'
--Delete single record from table
delete from Bikes where BikeId=3 
select * from Categories

--Create UserTable
create Table Users(
userId int identity primary key,
userName varchar(30) not null,
Email varchar(20),
City varchar(20),
)
create  table Orders(
orderId int identity primary key,
userId int not null,
orderDate DateTime not null,
storeId int
foreign key(userId)references Users(userId),
foreign key (storeId) references Stores(storeId))

--drop a table not present in database
drop table if Exists OrderDetails
select * from Bikes
--select specific columns from table
select BikeName,Price
from Bikes

--Display all bikes whose stock value is 100
select * from Bikes
where stock=100
-->=comparison operator
select * from Bikes
where stock>=100
--get all bikes whose stock is not equal to 100
select * from Bikes
where stock!=100
select * from Bikes
where stock<>100
--display bikeName,price,stock, totalstockValue
select BikeName,Price,Stock,Price*Stock
from Bikes
--provide Column name for TotalStockvalue
--column aliasing
select BikeName,Price,Stock,Price*Stock  as TotalStockValue
from Bikes
--Table Aliasing
select b.BikeName,b.Price,b.Stock
from Bikes as b
--get all Bikes whose stock is null
select * from Bikes
where stock is null
--get all bikes whose stock is not null
select * from Bikes
where stock is not null
--Like Operator
--Get All Bikes whose name starts with r
select * from Bikes
where BikeName Like 'r%'
select * from Bikes 
--to check pattern in range of values
where BikeName like '[d-h]%'
select * from Bikes 
--to check pattern  not in range of values
where BikeName like '[^d-h]%'
-- underscore specifies exacty one character
select * from bikes
where BikeName like '_Bike'

select * from Bikes
where BikeName like 'Duke'

Insert into Users values('vani','vani@gmail.com','Bangalore'),
						('veena','veena@gmail.com','Chennai'),
						('Ram','Ram@gmail.com','Bangalore')
--get all the cities from Users Table
select city from Users
--get unique cities from Users Table
select distinct city from Users
--fetch only two records from bikes Table
select top 2 * from Bikes

--fetch top 50% of the records
select top 20 percent * from Bikes
select * from Bikes
--offset and Fetch
select BikeName,Price from Bikes
order by Price
offset 2 rows
fetch next 2 rows only

select * from BikesInfo
Delete from BikesInfo
Truncate  table BikesInfo 

--Get all bikes which belong to category 1 and price is greater than 90000
select *
from Bikes
where CategoryId=1 and Price>90000
--Or Operator
select *
from Bikes
where CategoryId=1 OR Price>90000
select * from Users

--select User who are not from Bangalore
select * from
Users
where not City='Bangalore'

--get all details where categoryId is 3 and stock is greater than 50
select * from Bikes
where CategoryId=3 and Stock>50 or Stock is null

--get all bikes whose price is in the range 50000-60000
select * from bikes
where Price between 50000 and 90000

select * from bikes
where Price In (50000,60000)

-- select
select * from users
where userName between 'a' and 'w'

--adding Default constraint
alter table Bikes
add constraint DF_Bikes_Stock
default 0 for stock
Insert into Bikes(BikeId,BikeName,Price,CategoryId)
values(9,'Road bike',80000,4)
delete from Bikes where BikeId=9
delete from Categories where Id=4
--check constraint
alter table Bikes
add constraint CK_Bikes_Price
check(price>0)

select * from Users
--Unique Key constraint
alter table Users
add constraint UK_Users_Email
Unique(Email)

insert into  Users values('shyam','veena@gmail.com','Delhi')

select * from Categories

/*alter table Bikes
constraint FK_Bikes_CategoryId 
foreign key (CategoryId)
references Categories(Id)
on update Cascade */

--order the bikes in ascending order
select * from Bikes
order by Price desc

--select top 2 highest valued bikes
select  top 2 * from Bikes
order by Price desc

select * from Bikes
--Total number of Bikes in table
select Count(*) as Total_Bikes
from Bikes

select * from Stores
Insert into Orders values(1,'2024-11-06',100,200000),
						 (2,'2023-10-05',102,350000)

truncate table Orders
--find total revenue generated from Orders
select Sum(TotalValue) as [Total Revenue]
from Orders

-- Find average Price of Bikes
select Avg(Price) as [Average Bike Price]
from Bikes
select * from Bikes
--Find out Highest Priced Bike
select Max(price) as MaxPrice,Min(price) as MinPrice
from Bikes
select * from Bikes
--  Categorywise  find the Total count of Bikes
select categoryId, Count(BikeId) as totalCount
from bikes
group by CategoryId

--Find the average value of bikes categorywise
select CategoryId ,Avg(Price)
from Bikes
Group by CategoryId

-- findout number of orders per user
select userId ,Count(*) as UserOrders
from Orders
group by userId

--String Functions
select ASCII('A')
select CHAR(65)
select ('           sql Training')
select LTRIM('              sql Training')
select TRIM('              sql Training')
select Upper(userName) as [name]
from Users
select * from Users
select concat(userName,city)as UserCity
from Users
select CONCAT_WS('-',userName,city) as UserCity
from Users
select substring('vanishree@gmail.com',1,4)

select charIndex('@','vani@gmail.com')
select SUBSTRING(email,1,2)+replicate('*',5)+ SUBSTRING(email,CHARINDEX('@',email),len(email))
from users

select STUFF(Email,3,len(email),'****')as maskedEmail
from Users

--Mathematical Functions
select Ceiling(28.6)---returns closet interger value greater than the Given number
select Floor(28.4)--returns closet integer value smaller than the given number
select Round(166.445,2)--rounding off the value for the given precision
select Round(166.665,2,1)--truncate after precision
select Rand()--numbers between 0 and 1
--genrate random numbers between 1-10
select Floor(1+Rand()*10)
select Ceiling(1+Rand()*10)

--Date Functions
select GetDate()
select * from Orders
Insert into Orders values(3,Getdate(),104,20000)
select Year('2024-04-25') as [year]
select Month('2024-04-25') as [Month]
select day('2024-04-25') as [Day]


-- display userId and the respective year they have placed Order from orders
select  userId,year(OrderDate)
from Orders
Group by userId,year(OrderDate)
order by userId desc
--get the records for userId1 and userId2
select  userId,year(OrderDate)
from Orders
where userId in(1,2)
Group by userId,year(OrderDate)
select * FRoM Orders
--Get only the customers who have made minimum 2 orders or greater
select userId, count(userId)as TotalCount
from Orders
group by userId
having count(userId)>=2

order by userId desc

--Day 4--Thursday
--Date Functions
--DateName and DatePart
select DateName(day,'2024-11-08')
select DateName(month,'2024-11-08')
select DateName(weekDay,'2024-11-07')

select DatePart(weekDay,'2024-11-07')
select DatePart(month,'2024-11-07')

--Dateadd and DateDiff
select DateAdd(day,3,'2024-11-07')
select DateAdd(day,-7,Getdate())
select DATEDIFF(MONTH,'2024-11-07','2024-10-07')

select * from Orders
select sum(TotalValue) as TotalRevenue
from Orders
where orderDate>=DateAdd(day,-7,Getdate())

--calculate total revenue by year
select year(orderDate), sum(TotalValue)
from Orders
group by year(orderDate)
--DateFromParts
select DATEFROMPARTS(2024,11,07 )as [Date]
select TimeFromParts(03,02,00,1,2)

--Conversion functions
select Cast(Getdate() as varchar)
select CONVERT(varchar,getdate(),101)

--add Rs to price of the bikes(20000rs)
select BikeName,cast(Price as varchar)+'Rs'
from Bikes

select * from Orders
select userId,sum(TotalValue)
from orders
Group by userId
--Window Aggregate Function
select userId, TotalValue, sum(TotalValue)
over(partition by userId)as Total
from orders
--Group by userId
select * from Orders
--Wnidow Rank Functions without partition
select userId ,orderDate,
Rank() over(order by TotalValue) [Rank]
from Orders
--Dense Rank
select userId ,orderDate,
dense_Rank() over(order by TotalValue) [Rank]
from Orders
--Row Number
select userId ,orderDate,
Row_Number() over(order by TotalValue) [Row Number]
from Orders

--Rank the Bikes by category
select *,
rank() over(partition by categoryId order by price)as [Rank Result],
dense_rank() over(partition by categoryId order by price)as [Rank Result]
from Bikes

--
select *,
max(price) over (partition by CategoryId)as Maxprice_CategoryWise
from Bikes

--Lead function and Lag function wi
select *,
lag(orderDate) over(order by orderDate)as prev_OrderDate
from Orders

select *,
lead(orderDate) over(order by orderDate)as next_OrderDate
from Orders

--Lead and lag functions using partition
select *,
lag(price) over(partition by categoryId order by Price) as [Previous ProductPrice],
lead(price) over(partition by categoryId order by Price) as [next ProductPrice]
from Bikes
select * from Categories
--Joins
select b.BikeName,b.Price,c.categoryName
from Bikes b
inner join 
Categories c
on b.CategoryId=c.Id
select * from Users
select * from Orders
--outer  Join
select u.userId, orderId,Totalvalue
from Users u
left join
Orders o
on u.userId=o.userId
select * from Bikes
select * from Categories
select u.userId, orderId,Totalvalue
from Users u
right join
Orders o
on u.userId=o.userId
 
 --full outer join
 select u.userId, orderId,Totalvalue
from Users u
 full outer join
Orders o
on u.userId=o.userId


--Self join
-- create an employee table
create table Employee(
EmpId int identity primary key,
EmpName varchar(50),
ManagerId int)

--Insert Values 
Insert into Employee values ('Ram',2),
							('Bheem',null),
							('shyam',1),
							('Raj',1)

--self join
select e.EmpName,m.EmpName as ManagerName
from Employee as e
left join Employee m
on e.ManagerId=m.EmpId

--display NoManager instead of null value if employee has No manager
select e.EmpName,IsNull(m.EmpName,'No Manager')as Manager
from Employee e
left join 
Employee m
on e.ManagerId=m.EmpId

select e.EmpName,coalesce(m.EmpName,'No Manager')as Manager
from Employee e
left join 
Employee m
on e.ManagerId=m.EmpId

-- cross join
select *
from Bikes
cross join
Categories
select * from Bikes
select * from Categories

--get ordered Bike details(orderId,quantityOrdered,BikeName)
--create a Order Details Table
create table OrderDetails(
OrderDetailId int  identity primary key,
orderId int,
BikeId int,
quantity int,
foreign key(orderId) references Orders(orderId),
foreign key(BikeId) references Bikes(BikeId))

select * from Orders
Insert into OrderDetails values(1,1,1)
Insert into OrderDetails values(1,2,1)

select od.orderId,od.quantity,b.BikeName
from OrderDetails od
join
Bikes b
on od.BikeId=b.BikeId

-- get user Details and Bike details along with the quantity of the Bikes ordered
--(orderId,UserName,BikeName,Quantity)
select o.orderId,u.userName,b.BikeName,od.quantity
from Orders o
join
Users u
on o.userId=u.userId
join
OrderDetails od
on o.orderId=od.orderId
join
Bikes b
on od.BikeId=b.BikeId
--get the users who have not placed orders
select u.userName,o.orderId
from Users u
left join 
Orders o
on u.userId=o.userId
where o.orderId is null and year(o.orderDate)=2024

select * from Orders
--get all users who have not placed any order in 2024
select u.userName,o.orderId
from Users u
left join 
Orders o
on u.userId=o.userId
where year(o.orderDate)!=2024

--get all Bikes which are not sold
--get total revenue by each customer
select u.userName,sum(od.quantity*b.Price)as TotalRevenue
from users u
join Orders o
on u.userId=o.userId
join orderDetails od
on od.orderId=o.orderId
join Bikes b
on od.BikeId=b.BikeId
group by u.userName

select * from Orders

--day 8/11/2024
--List users who have placed more than three orders
select u.userName,Count(o.orderId)as OrdersCount
from users u
join Orders o
on u.userId=o.userId
group by u.userId,u.userName
having Count(o.orderId)>3
select * from Bikes
--Equi join
--bike name bike price, category name
select BikeName,Price,CategoryName
from Bikes,Categories
where Bikes.Id=Categories.Id
select * from Categories
select * from Bikes
SELECT b.BikeName
FROM Bikes b
JOIN Categories c ON b.ID = c.ID
WHERE c.CategoryName IN ('Racing', 'RoadBikes');

--subquery with Exists
select u.userName,o.orderId
from Users u
left join 
Orders o
on u.userId=o.userId
where year(o.orderDate)!=2024
select * from Orders
select username
from users u
where  not exists
(select userId
from Orders o
where o.userId=u.userId and  year(orderDate)=2024)

--subquery
--find the bike which is most expensive
select top 1  BikeName,Price
from Bikes
order by price desc

-- subquery
SELECT BikeName
FROM Bikes
WHERE Price = (select Max(Price) from Bikes)
select * from OrderDetails
--find total quantity ordered for specific bike given the bikeName
select sum(quantity)
from OrderDetails
where bikeId=
 (select  bikeId
 from Bikes
 where BikeName='Duke')
--How to use subquery with from clause
 --find highest quantity ordered for each bike
 select bikeId, MaximumQuantity
 from
 (select bikeId,Max(quantity) as MaximumQuantity
 from orderDetails
 group by BikeId)maxResult
select * from Orders
select * from OrderDetails
 select * from Orders
 --find recent order date for a specific BikeName
select Max(orderDate)as [Recent Order]
from Orders
where orderId in
(select orderId   --1,2
from orderDetails
where bikeId=
 (select bikeid--1
 from  bikes
 where BikeName='Duke'))
select * from Categories
 --find the names of bikes which belongs to category RoadBikes and Accessories
 select bikeName 
 from bikes
 where Id in
 (select Id from 
 categories
 where CategoryName='RoadBikes' or CategoryName= 'Accessories')
 --find the names of bikes which  doesnot belongs to category RoadBikes and Accessories
 select bikeName 
 from bikes
 where Id  not in
 (select Id from 
 categories
 where CategoryName='RoadBikes' or CategoryName= 'Accessories')

 --find all the bikes whose price are greater than the average bike price
 select bikeName,price
 from bikes 
 where price>=
 (select avg(price) from Bikes)

-- find all the bikes whose price is greater than average price of categories
select bikename,price,Id
from bikes
where price>=all
(select avg(price)
from bikes
group by Id)

--find all the category names that have atleast one bike
select * from categories
select * from Bikes
--correlated subqueries
select categoryName
from Categories
where  exists
(select Id from Bikes
 where categories.Id=bikes.Id)
 
 --
--find all the category names that  do not have atleast one bike
  select categoryName
from Categories
where not exists
(select Id from Bikes
 where categories.Id=bikes.Id)

 --find the bikes which are not sold atleast once
 --correlated subquery
 select bikeId,bikeName
 from bikes b
 where   not exists(
 select bikeId
 from OrderDetails od
 where od.BikeId=b.BikeId)

 --non -correleated subquery
 select bikeId, bikeName
 from bikes
 where bikeId not in
 (select distinct bikeId--1,2
 from OrderDetails)

 --find the users who have made atleast two orders with username
 select userID, username 
 from users u
 where  
 (select count(*) from Orders od
 where od.userId =u.userId
 )
 >=2
select userId,userName
from users
where userId in
 (select userId
 from orders
 group by userId
 having count(orderId)>=2)
 
--get highest priced bike in each category
select b.bikeName,c.categoryName, b.price
from bikes b,
(select Id,max(price)as maxPrice
from bikes
group by Id) submax ,categories c 
where b.Id=submax.Id
and b.Price=submax.maxPrice
and c.Id=b.Id

--subquery with delete
select * from Bikes
delete from bikes
where price<=(select min(price) from bikes)

--union
select bikeName,price
from Bikes
union 
select price,  [name]
from BikesInfo
--union all
select bikeName,price
from Bikes
union all 
select [name],price
from BikesInfo

--InterSect
select BikeName,price
from Bikes
intersect
select name,price
from BikesInfo


select BikeName,price--Duke.....
from Bikes
except
select name,price--abc,Duke
from BikesInfo

select userId
from Users
Except
select userId
from Orders

--Grouping sets
create table Payments(
paymentId int identity primary key,
amount decimal,
paymentDate dateTime,
storeId int)

Insert Into Payments Values(1500.32,'2022-03-19',100),
						(1600.32,'2022-03-19',101),
						(1800.32,'2023-03-19',100),
						(1900.32,'2024-03-19',103),
						(2000.32,'2024-03-19',100),
						(2500.32,'2023-03-19',101)
select * from Payments

select sum(amount),
       year(paymentDate), storeId
	   from payments
group by year(paymentDate), storeId
order by year(paymentDate), storeId

select sum(amount),
       year(paymentDate), storeId
	   from payments
group by year(paymentDate), storeId

union all
select sum(amount),
       year(paymentDate), null
	   from payments
group by year(paymentDate)

union all
select sum(amount),
       null, storeId
	   from payments
group by storeId

-- above query using grouping sets
select sum(amount),
       year(paymentDate), storeId
	   from payments
group by Grouping sets(year(PaymentDate),storeId)
order by year(PaymentDate),storeId
--
select sum(amount),
       year(paymentDate), storeId
	   from payments
group by Grouping sets(year(PaymentDate),storeId,
						(Year(PaymentDate)),
						(storeId)
						)
order by year(PaymentDate),storeId

--RollUp function
select sum(amount),
       year(paymentDate), storeId
	   from payments
group by Rollup (year(PaymentDate),storeId )
order by year(PaymentDate),storeId

-- cube
select sum(amount),
       year(paymentDate), storeId
	   from payments
group by Cube (year(PaymentDate),storeId )
order by year(PaymentDate),storeId

--get sales by category and orderdate
select 
o.orderdate,c.CategoryName,
sum(od.quantity*price)as [Total sales]
from orders o
join OrderDetails od  on  o.orderId=od.orderId
join bikes b on od.BikeId=b.BikeId
join Categories c on b.Id=c.Id
group by grouping sets(
 (c.CategoryName),---sales by category 
 (o.orderDate),----sales by order date
 (c.CategoryName,o.orderDate))---sales by category and OrderDate

 select * from Orders
 select * from Bikes
 select * from OrderDetails
drop table SourceTbl
create Table SourceTbl
( productId int,
ProductName varchar(50),
Price int)

Insert into SourceTbl values(1,'TV',50000)
Insert into SourceTbl values(2,'Headphone',1000)
Insert into SourceTbl values(3,'Mouse',500)
Insert into SourceTbl values(4,'pendrive',2000)

create Table TargetTbl
( productId int,
ProductName varchar(50),
Price int)
Insert into TargetTbl values(1,'TV',50000)
Insert into TargetTbl values(2,'Headphone',100)
Insert into TargetTbl values(5,'Digipad',5000)
Insert into TargetTbl values(6,'Keyboard',2500)

select * from SourceTbl
select * from TargetTbl

Merge TargetTbl as [target]
using sourceTbl as [source]
on source.ProductId=target.ProductId
--Insert
when not matched by target then
Insert (productId,ProductName,Price) values(source.ProductId,source.productName,source.Price)
--update
when matched then
update 
set target.productName=source.productName,
	target.price=source.price
--deletion
when not matched by source then

delete;

--Transactions
begin try
begin transaction
insert into Bikes values(9,'xyzBike',60000,1,20)
insert into Bikes values(10,'Activa',60000,1,20)
commit transaction
print 'transaction success'
end try
 begin catch 
 rollback transaction
 print 'transaction unsuccessful'
 --select ERROR_MESSAGE() as [Error Msg]
 end catch

select * from Bikes

begin transaction
update bikes set Stock=100 where BikeId=9
