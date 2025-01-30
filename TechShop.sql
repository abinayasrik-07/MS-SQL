
create database TechShop
use TechShop

--Table Customer
create table Customer
(
CustomerID int primary key not null,
FirstName varchar(25),
LastName varchar(25),
Email varchar(50) not null,
Phone bigint,
[Address] varchar(50)
)
alter table Customer
add constraint PK_Customer
primary key (Email)

select * from Customer
insert into Customer
values (111, 'Abi', 'Sri', 'abisri@gmail.com', 1234567899, 'Coimbatore'),
	   (112, 'Karishma', 'Carolin', 'karishmacarolin@gmail.com', 1345678901, 'Chennai'),
	   (113, 'Nivetha', 'Angel', 'nivethangel@gmail.com', 1456789012, 'Erode'),
	   (114, 'Sri', 'Mathi', 'srimathi@gmail.com', 1567890123, 'Pondicherry'),
	   (115, 'Oveya', 'Thean', 'oveyathean@gmail.com', 1678901234, 'Banglore'),
	   (116, 'Kavya', 'Dharsh', 'kavyadharsh@gmail.com', 1789012345, 'Hyderabad'),
	   (117, 'Brindha', 'Sri', 'brindhasri@gmail.com', 1890123456, 'Jammu&Kashmir'),
	   (118, 'Cathrine', 'Therasa', 'cathrinetherasa@gmail.com', 1901234567, 'UttarPradesh'),
	   (119, 'Bhakya', 'Lakshmi', 'bhakyalakshmi@gmail.com', 11012345678, 'Delhi'),
	   (120, 'Siva', 'Priya', 'sivapriya@gmail.com', 1123456789, 'Mumbai')


--Table Products
create table Products
(
ProductID int primary key,
ProductName varchar(30),
[Description] varchar(60),
Price decimal (10,2)
)

select * from Products
insert into Products (ProductID, ProductName, [Description], Price)
values (101, 'Laptop', 'Portable Computers, Carried in backpacks', 75000),
	   (102, 'Speakers', 'Standard output devices, Enables the listener to listen', 1900),
	   (103, 'PowerBank', 'Portable Charger, Recharge various electronic gadgets', 1500),
	   (104, 'SmartWatch', 'Fitness enthusiasts, Tracking the activities', 2000),
	   (105, 'Cameras', 'Captures light and Processes it into images', 5000),
	   (106, 'iPad', 'Apple- ipad', 82000),
	   (107, 'SmartPhone', 'Advanced Computing Capabilities', 35000),
       (108, 'Tablet', 'Great alternative for laptops', 23000),
	   (109, 'CoffeeMachine', 'Brew and Drip coffee', 9000),
	   (110, 'ElectricKettle', 'Made for boiling water', 700)


--Table Orders
create table Orders
(
OrderID int primary key,
CustomerID int 
constraint FK_Orders
foreign key references Customer(CustomerID),
OrderDate date,
TotalAmount int default 0
)

select * from Orders
insert into Orders (OrderID, CustomerID, OrderDate)
values (211, 111, '2024-01-07'),
	   (212, 112, '2024-01-20'),
	   (213, 113, '2023-02-15'),
	   (214, 114, '2024-03-07'),
	   (215, 115, '2024-03-22'),
	   (216, 116, '2023-03-31'),
	   (217, 117, '2024-04-23'),
	   (218, 118, '2024-05-05'),
	   (219, 119, '2023-05-28'),
	   (220, 120, '2023-07-17')


--Table OrderDetails
create table OrderDetails
(
OrderDetailsID int,
OrderID int
constraint FK_OrderDetails
foreign key references Orders(OrderID),
ProductID int
foreign key references Products(ProductID),
Quantity int
)

select * from OrderDetails
insert into OrderDetails(OrderDetailsID, OrderID, ProductID, Quantity)
values (301, 211, 101, 1),
       (302, 212, 102, 2),
	   (303, 213, 103, 6),
	   (303, 214, 104, 2),
	   (305, 215, 105, 1),
	   (306, 216, 106, 1),
	   (307, 217, 107, 3),
	   (308, 218, 108, 4),
	   (307, 219, 109, 2),
	   (310, 220, 110, 4)


--Table Inventory
create table Inventory
(
InventoryID int primary key,
ProductID int
constraint FK_Inventory
foreign key references Products(ProductID)
on delete cascade,
QuantityInStock int,
LastStockUpdate varchar(15)
)

select * from Inventory
insert into Inventory
values (401, 101, 50, '2024-04-25'),
	   (402, 102, 25, '2024-05-21'),
	   (403, 103, 100, '2024-06-04'),
	   (404, 104, 150, '2024-07-06'),
	   (405, 105, 30, '2024-08-18'),
	   (406, 106, 40, '2023-09-01'),
	   (407, 107, 55, '2024-09-22'),
	   (408, 108, 120, '2024-10-15'),
	   (409, 109, 26, '2024-10-28'),
	   (410, 110, 19, '2023-11-02')



--Task 2

--1. Retrieve the names and emails of all customers.
select FirstName, LastName, Email from Customer

--2. List all orders with their order dates and corresponding customer names.
select O.OrderDate, O.CustomerID, C.FirstName, C.LastName 
from Orders as O, Customer as C
where O.CustomerID = C.CustomerID

--3. Insert a new customer record into the customer table(name, email, address).
insert into Customer values (121, 'Anushka', 'Shree', 'anushkashree@gmail.com', '2468013579', 'Andhra')
select * from Customer

--4. Update the price of all electronic gadgets in the products table by increasing them by 10%.
update Products
set Price = Price*1.10
select * from Products

--5. Delete a specific order and its associated order details from that 2 tables. Allow users to i/p the order id as a parameter.
alter table OrderDetails
drop constraint FK_OrderDetails
alter table OrderDetails
add constraint FK_OrderDetails foreign key (OrderID) references Orders(OrderID) 
on delete cascade
delete from Orders where OrderID = 216
select * from Orders
select * from OrderDetails

--6. Insert a new order into the orders table (customerid, orderdate,...).
insert into Orders values (222, 119, '2024-01-20', 10000)
select * from Orders

--7. Update the contact info (email and address) of a specific customer. Allow users to i/p the customerid & new contact info.
update Customer
set email = 'nivethapersonal@gmail.com', address = 'Pune'
where CustomerID = 113 and Phone = 1456789012
select * from Customer

--8. Recalculate & update the total cost of each order in the Order table based on prices and quantities in the OrderDetails table.
-- Update the total amount in the Orders table based on prices and quantities
update Orders
set TotalAmount = (
select sum(OD.Quantity * P.Price)
from OrderDetails OD
join Products P on OD.ProductID =P.ProductID
where OD.OrderID = Orders.OrderID
)
select * from Orders


--9. Delete all orders and their associative order details for a specific customer from the Order & OrderDetails Table.
--Allow users to i/p the customerid as a parameter.
alter table OrderDetails
drop constraint FK_OrderDetails

alter table OrderDetails
add constraint FK_OrderDetails foreign key (OrderID) references Orders(OrderID) 
on delete cascade

alter table Orders
drop constraint FK_Orders

alter table Orders
add constraint FK_Orders foreign key (CustomerID) references Customer(CustomerID) 
on delete cascade

delete from Customer where CustomerID = 118
select * from Customer

--10. Insert a new product into the Products table (productname,  category, price)
insert into Products values(111, 'WirelessHeadPhone', 'Bluetooth earbuds with noise cancellation', 60000)
select * from Products

--11. Update the status of a specific order in the Orders table (Pending to Shipped). i/p the orderID and the new status.
alter table Orders
add OrderStatus varchar(20)
Update Orders
set OrderStatus = 'Shipped'
where OrderID in (211, 215, 220, 217)
Update Orders
set OrderStatus = 'Pending'
where OrderID in (219, 212)
Update Orders
set OrderStatus = 'Pending'
where OrderID in (213, 214)

Update Orders 
set OrderStatus = 'Pending' 
where OrderID = 213
select * from Orders

--12.Calculate and Update the no of orders placed by each customer in the Customer table based on the data in Order table.
alter table Customer
add OrderCount int default 0

update Customer
set OrderCount = 
(
select count(*)
from Orders O
where O.CustomerID = Customer.CustomerID
)
select * from Customer


--Task 3

--1. Retrieve a list of all orders along with customer information for each order.
select O.OrderID, O.OrderDate, O.TotalAmount, C.FirstName, C.LastName
from Orders as O
join Customer as C on O.CustomerID = C.CustomerID

--2. Find the total revenue generated by each electronic gadget product. Include productName and totalRevenue.
select P.ProductName, sum(OD.Quantity * P.Price) as TotalRevenue
from OrderDetails as OD
join Products as P on OD.ProductID = P.ProductID
Group By P.ProductName

--3. List all customers who have made at least one purchase. Include their names and contact info.
select distinct C.FirstName, C.LastName, C.Email, C.Phone, C.[Address]
from Customer as C
join Orders as O on C.CustomerID = O.CustomerID

--4. Find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the productName and totalQuantity ordered.
select P.ProductName, sum(OD.Quantity) as TotalQuantityOrdered
from OrderDetails as OD
join Products as P on OD.ProductID = P.ProductID
Group By P.ProductName
Order By TotalQuantityOrdered desc

--5. Retrieve a list of electronic gadgets along with their corresponding categories.
alter table Products
add Category varchar(20)

update Products set Category = 'Home Application' where ProductID in (102, 109, 110)
update Products set Category = 'Personal Gadgets' where ProductID in (104, 106, 108, 105)

select ProductName, Category
from Products

--6. Calculate the avg order value for each customer. Include the customerName and their avg order value.
select C.FirstName, C.LastName, avg(O.TotalAmount) as AvgOrderValue
from Orders O
join Customer C on O.CustomerID = C.CustomerID
Group By C.CustomerID, C.FirstName, C.LastName

--7. Find the order with the highest total revenue. Include the orderID, customer info, and total revenue.
select O.OrderID, C.FirstName, C.LastName, O.TotalAmount
from Orders O
join Customer C on O.CustomerID = C.CustomerID
Order By O.TotalAmount desc

--8. List electronic gadgets and the no of times each product has been ordered.
select P.ProductName, count(OD.OrderDetailsID) as NoOfTimesOrdered
from OrderDetails OD
join Products P on OD.ProductID = P.ProductID
Group By P.ProductName

---9. Find customers who have purchased a specific electronic gadget product. i/p the productName as a parameter.
Select distinct C.FirstName, C.LastName, C.Email
from Customer as C
join Orders as O on C.CustomerID = O.CustomerID
join OrderDetails as OD on O.OrderID = OD.OrderID
join Products as P on OD.ProductID = P.ProductID
where P.ProductName = 'Laptop'

--10. Calculate the total revenue generated by all orders placed within a specific time period.
--Allow users to input the start and end dates as parameters.
Select sum(TotalAmount) as TotalRevenue
from Orders
where OrderDate between '2024-01-01' and '2024-02-27'


--Task 4

--1. Find out which customers have not placed any orders.
Select FirstName, LastName, Email, Phone from Customer
where CustomerID not in (Select CustomerID from Orders)

--2. Find the total no of products available for sale.
Select count(ProductID) as TotalProducts
from Products

--3. Calculate the total revenue generated by TechShop.
Select sum(TotalAmount) as TotalRevenue
from Orders

--4.Calculate the avg quantity ordered for products in a specific category. i/p the category name as a parameter.
select avg(Quantity) as AverageQuantity
from OrderDetails
where ProductID in (select ProductID from Products where Category = 'Home Application')

--5. Calculate the total revenue generated by a specific customer. i/p the customerID as a parameter.
Select sum(TotalAmount) as TotalRevenue
from Orders
where CustomerID = 116

--6. Find the customers who have placed the most orders. List their names and the no of orders they have placed.
Select FirstName, LastName, OrderCount from Customer
where CustomerID = 
(select top 1 CustomerID from Orders
Group By CustomerID
Order By Count(OrderID) desc)

--7. Find the most popular product category, which is the one with the highest total quantity ordered across all orders.
select Category from Products
where ProductID = 
(select top 1 ProductID from OrderDetails
Group By ProductID
Order By sum(Quantity) desc)

--8. Find the customer who has spend the most money (highest total revenue) on electronic gadgets. List their name and total spending.
select top 1 FirstName+ ' ' +LastName as CustomerName, (select sum(OD.Quantity * P.Price) from OrderDetails OD, Products P
where OD.OrderID in (select O.OrderID from Orders O where O.CustomerID = C.CustomerID)
and OD.ProductID in (select P.ProductID from Products P where P.ProductName in 
('Laptop', 'SmartPhone', 'Tablet', 'SmartWatch', 'iPad', 'Cameras'))) as TotalSpending
from Customer c
order by TotalSpending desc


--9. Calculate the avg order value for all customers.
Select avg(TotalAmount) as AvgOrderValue
from Orders

--10. Find the total no of orders placed by each customer and list their names along with the order count.
Select C.FirstName+ ' ' +C.LastName,
(select count(O.OrderID) as OrderCount
from Orders O
where C.CustomerID = O.CustomerID) as OrderCount
from Customer C



