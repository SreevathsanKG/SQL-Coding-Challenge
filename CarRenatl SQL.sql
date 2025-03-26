create database carRental;
use carRental;

create table Vehicle(
	vehicleID int primary key,
    make varchar(100),
    model varchar(100),
    year int,
    dailyRate decimal(5, 2),
    status enum('0', '1'),
    passengerCapacity int,
    engineCapacity int
);

create table Customer(
    customerID int primary key,
    firstName varchar(100),
    lastName varchar(100),
    email varchar(100),
    phonenumber varchar(20)
);

create table Lease(
    leaseID int primary key,
    vehicleID int,
    customerID int,
    startdate date,
    enddate date,
    type enum('Daily', 'Monthly'),
    foreign key (vehicleID) references Vehicle(vehicleID),
    foreign key (customerID) references Customer(customerID)
);

create table Payment(
    paymentID int primary key,
    leaseID int,
    paymentdate date,
    amount decimal(10, 2),
    foreign key (leaseID) references Lease(leaseID)
);

insert into Vehicle(vehicleID, make, model, Year, dailyRate, status, passengerCapacity, engineCapacity) values
    (1, 'Toyota', 'Camry', 2022, 50.00, '1', 4, 1450),
    (2, 'Honda', 'Civic', 2023, 45.00, '1', 7, 1500),
    (3, 'Ford', 'Focus', 2022, 48.00, '0', 4, 1400),
    (4, 'Nissan', 'Altima', 2023, 52.00, '1', 7, 1200),
    (5, 'Chevrolet', 'Malibu', 2022, 47.00, '1', 4, 1800),
    (6, 'Hyundai', 'Sonata', 2023, 49.00, '0', 7, 1400),
    (7, 'BMW', '3 Series', 2023, 60.00, '1', 7, 2499),
    (8, 'Mercedes', 'C-Class', 2022, 58.00, '1', 8, 2599),
    (9, 'Audi', 'A4', 2022, 55.00, '0', 4, 2500),
    (10, 'Lexus', 'ES', 2023, 54.00, '1', 4, 2500);
    
insert into Customer(customerID, firstName, lastName, email, phoneNumber) values
    (1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
    (2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
    (3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
    (4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
    (5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
    (6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
    (7, 'Michael', 'Davis', 'michael@example.com', '555-876-5432'),
    (8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
    (9, 'William', 'Taylor', 'william@example.com', '555-321-6547'),
    (10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');
    
insert into Lease (leaseID, vehicleID, customerID, startdate, enddate, type) values
    (1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
    (2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
    (3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
    (4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
    (5, 5, 5, '2023-05-05', '2023-05-10', 'Daily'),
    (6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
    (7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
    (8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
    (9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
    (10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');

insert into Payment (paymentID, leaseID, paymentdate, amount) values
    (1, 1, '2023-01-03', 200.00),
    (2, 2, '2023-02-20', 1000.00),
    (3, 3, '2023-03-12', 75.00),
    (4, 4, '2023-04-25', 900.00),
    (5, 5, '2023-05-07', 60.00),
    (6, 6, '2023-06-18', 1200.00),
    (7, 7, '2023-07-03', 40.00),
    (8, 8, '2023-08-14', 1100.00),
    (9, 9, '2023-09-09', 80.00),
    (10, 10, '2023-10-25', 1500.00);
    
-- 1. update the daily rate for a Mercedes car to 68.
update Vehicle set dailyRate = 68.00 where make = 'Mercedes';

-- 2. delete a specific customer and all associated leases and payments.
delete from Payment where leaseID IN (select leaseID from Lease where customerID = 10);
delete from Lease where customerID = 10;
delete from Customer where customerID = 10;

-- 3. Rename the "paymentdate" column in the Payment table to "transactiondate".
alter table Payment change paymentdate transactiondate date;

-- 4. Find a specific customer by email.
select * from Customer where email = 'sarah@example.com';

-- 5. Get active leases for a specific customer.
select * from Lease where customerID = 3 and enddate >= curdate();

-- 6. Find all payments made by a customer with a specific phone number.
select p.* from Payment p join Lease l on p.leaseID = l.leaseID join Customer c on l.customerID = c.customerID
where c.phoneNumber = '555-789-1234';

-- 7. Calculate the average daily rate of all available cars.
select p.* from Payment p join Lease l on p.leaseID = l.leaseID join Customer c on l.customerID = c.customerID
where c.phoneNumber = '555-789-1234';

-- 8. Find the car with the highest daily rate.
select * from Vehicle order by dailyRate desc limit 1;

-- 9. Retrieve all cars leased by a specific customer.
select v.* from Vehicle v join Lease l on v.vehicleID = l.vehicleID where l.customerID = 2;

-- 10. Find the details of the most recent lease.
select * from Lease order by enddate desc limit 1;

-- 11. List all payments made in the year 2023.
select * from Payment where YEAR(transactiondate) = 2023;

-- 12. Retrieve customers who have not made any payments.
select c.* from Customer c left join Lease l on c.customerID = l.customerID
left join Payment p on l.leaseID = p.leaseID where p.paymentID is null;

-- 13. Retrieve Car Details and Their Total Payments.
select v.*, SUM(p.amount) AS totalPayments from Vehicle v join Lease l on v.vehicleID = l.vehicleID
join Payment p on l.leaseID = p.leaseID group by v.vehicleID;

-- 14. Calculate Total Payments for Each Customer.
select c.*, SUM(p.amount) AS totalPayments from Customer c join Lease l on c.customerID = l.customerID
join Payment p on l.leaseID = p.leaseID group by c.customerID;

-- 15. List Car Details for Each Lease.
select l.*, v.* from Lease l join Vehicle v on l.vehicleID = v.vehicleID;

-- 16. Retrieve Details of Active Leases with Customer and Car Information.
select l.*, c.*, v.* from Lease l join Customer c on l.customerID = c.customerID
join Vehicle v on l.vehicleID = v.vehicleID where l.enddate >= curdate();

-- 17. Find the Customer Who Has Spent the Most on Leases.
select c.*, SUM(p.amount) AS totalSpent from Customer c join Lease l on c.customerID = l.customerID
join Payment p on l.leaseID = p.leaseID group by c.customerID order by totalSpent desc limit 1;

-- 18. List All Cars with Their Current Lease Information.
select v.*, l.* from Vehicle v left join Lease l on v.vehicleID = l.vehicleID;
