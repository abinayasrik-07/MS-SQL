
create database CarConnect

use CarConnect


-- 1. Customer Table


create table Customer
(
CustomerID int primary key not null,
FirstName varchar(25),
LastName varchar(25),
Email varchar(50),
PhoneNumber bigint,
[Address] varchar(50),
Username varchar(30) unique,
[Password] varchar(30),
RegistrationDate date
)

INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, [Address], Username, [Password], RegistrationDate)
VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'johndoe', 'hashedPassword1', '2023-01-01'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak St', 'janesmith', 'hashedPassword2', '2023-02-15'),
(103, 'Mike', 'Brown', 'mike.brown@example.com', '5556677889', '789 Maple St', 'mikebrown', 'hashedPassword3', '2023-03-12'),
(104, 'Emily', 'Davis', 'emily.davis@example.com', '4445566778', '321 Pine St', 'emilydavis', 'hashedPassword4', '2023-04-10'),
(105, 'Chris', 'Wilson', 'chris.wilson@example.com', '3334455667', '654 Birch St', 'chriswilson', 'hashedPassword5', '2023-05-20'),
(106, 'Emma', 'Taylor', 'emma.taylor@example.com', '2223344556', '987 Cedar St', 'emmataylor', 'hashedPassword6', '2023-06-05'),
(107, 'Daniel', 'Anderson', 'daniel.anderson@example.com', '1112233445', '159 Spruce St', 'danielanderson', 'hashedPassword7', '2023-07-18'),
(108, 'Sophia', 'Moore', 'sophia.moore@example.com', '9998877665', '753 Fir St', 'sophiamoore', 'hashedPassword8', '2023-08-09'),
(109, 'Liam', 'Thomas', 'liam.thomas@example.com', '8887766554', '357 Walnut St', 'liamthomas', 'hashedPassword9', '2023-09-15'),
(110, 'Olivia', 'Jackson', 'olivia.jackson@example.com', '7776655443', '951 Ash St', 'oliviajackson', 'hashedPassword10', '2023-10-01')
select * from Customer


--2. Vehicle Table


create table Vehicle
(
VehicleID int primary key not null,
Model varchar(25),
Make varchar(25),
[Year] int,
Color varchar(15),
RegistrationNo int unique,
[Availability] varchar(10),
DailyRate decimal(8, 2)
)


INSERT INTO Vehicle (VehicleID, Model, Make, [Year], Color, RegistrationNo, [Availability], DailyRate)
VALUES
(201, 'Civic', 'Honda', 2020, 'Red', '123', 1, 50.00),
(202, 'Accord', 'Honda', 2021, 'Blue', '456', 1, 55.00),
(203, 'Corolla', 'Toyota', 2019, 'White', '789', 1, 45.00),
(204, 'Camry', 'Toyota', 2022, 'Black', '012', 0, 60.00),
(205, 'Model 3', 'Tesla', 2021, 'Silver', '345', 1, 75.00),
(206, 'Model X', 'Tesla', 2020, 'Grey', '678', 0, 100.00),
(207, 'Mustang', 'Ford', 2018, 'Yellow', '901', 1, 80.00),
(208, 'F-150', 'Ford', 2021, 'Blue', '234', 1, 90.00),
(209, 'Elantra', 'Hyundai', 2019, 'Green', '567', 1, 40.00),
(210, 'Sonata', 'Hyundai', 2020, 'Orange', '890', 1, 50.00)
select * from Vehicle


--3. Reservation Table


create table Reservation
(
ReservationID int primary key not null,
CustomerID int,
VehicleID int,
StartDate date,
EndDate date,
TotalCost decimal(8, 2),
[Status] varchar(15),
constraint FK_Reservation
foreign key (CustomerID) references Customer(CustomerID)
on delete cascade,
foreign key (VehicleID) references Vehicle(VehicleID)
on delete cascade
)

INSERT INTO Reservation (ReservationID, CustomerID, VehicleID, StartDate, EndDate, TotalCost, [Status]) VALUES
(1, 101, 201, '2024-12-01', '2024-12-05', 5000.00, 'Confirmed'),
(2, 102, 202, '2024-12-03', '2024-12-07', 6500.00, 'Pending'),
(3, 103, 203, '2024-12-05', '2024-12-10', 7000.00, 'Cancelled'),
(4, 104, 204, '2024-12-08', '2024-12-12', 5200.00, 'Confirmed'),
(5, 105, 205, '2024-12-10', '2024-12-15', 8000.00, 'Pending'),
(6, 106, 206, '2024-12-12', '2024-12-17', 7500.00, 'Confirmed'),
(7, 107, 207, '2024-12-14', '2024-12-19', 6000.00, 'Pending'),
(8, 108, 208, '2024-12-16', '2024-12-20', 5500.00, 'Cancelled'),
(9, 109, 209, '2024-12-18', '2024-12-22', 9000.00, 'Confirmed'),
(10, 110, 210, '2024-12-20', '2024-12-25', 6700.00, 'Confirmed');

--drop table Reservation
select * from Reservation


-- 4. Admin Table


create table [Admin]
(
AdminID int primary key not null,
FirstName varchar(25),
LastName varchar(25),
Email varchar(50),
PhoneNumber bigint,
Username varchar(30) unique,
[Password] varchar(30),
[Role] varchar(30),
JoinDate date
)

INSERT INTO [Admin] (AdminID, FirstName, LastName, Email, PhoneNumber, Username, [Password], [Role], JoinDate) VALUES
(301, 'Alice', 'Johnson', 'alice.johnson@admin.com', 9123456780, 'alicejohnson', 'securePass1', 'SuperAdmin', '2023-02-01'),
(302, 'Robert', 'Martinez', 'robert.martinez@admin.com', 9234567891, 'robertmartinez', 'securePass2', 'Admin', '2023-03-15'),
(303, 'Sophia', 'Garcia', 'sophia.garcia@admin.com', 9345678902, 'sophiagarcia', 'securePass3', 'SupportAdmin', '2023-04-10'),
(304, 'James', 'Lopez', 'james.lopez@admin.com', 9456789013, 'jameslopez', 'securePass4', 'Moderator', '2023-05-20'),
(305, 'Isabella', 'Hernandez', 'isabella.hernandez@admin.com', 9567890124, 'isabellahernandez', 'securePass5', 'ContentAdmin', '2023-06-05'),
(306, 'William', 'Clark', 'william.clark@admin.com', 9678901235, 'williamclark', 'securePass6', 'Admin', '2023-07-18'),
(307, 'Emma', 'Rodriguez', 'emma.rodriguez@admin.com', 9789012346, 'emmarodriguez', 'securePass7', 'SuperAdmin', '2023-08-09'),
(308, 'Michael', 'Lewis', 'michael.lewis@admin.com', 9890123457, 'michaellewis', 'securePass8', 'SupportAdmin', '2023-09-15'),
(309, 'Olivia', 'Walker', 'olivia.walker@admin.com', 9901234568, 'oliviawalker', 'securePass9', 'Moderator', '2023-10-01'),
(310, 'Ethan', 'Hall', 'ethan.hall@admin.com', 9012345679, 'ethanhall', 'securePass10', 'Admin', '2023-11-01');

select * from [Admin]


--drop table [Admin]
--drop table Reservation
--drop table Vehicle
--drop table Customer
