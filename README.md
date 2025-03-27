# Car Rental System - SQL

## Overview
This project outlines the database schema and SQL queries for a Car Rental System. It includes tables for managing vehicles, customers, leases, and payments. The provided SQL questions can be used to interact with and retrieve information from this database.

## Database Schema
The system contains the following tables:

1.  **Vehicle Table**
    * `vehicleID` (Primary Key, INT): Unique identifier for each vehicle.
    * `make` (VARCHAR): Make of the vehicle (e.g., Toyota, Mercedes).
    * `model` (VARCHAR): Model of the vehicle (e.g., Camry, C-Class).
    * `year` (INT): Year the vehicle was manufactured.
    * `dailyRate` (DECIMAL): The daily rental rate for the vehicle.
    * `status` (VARCHAR): Current status of the vehicle ('available', 'notAvailable').
    * `passengerCapacity` (INT): Number of passengers the vehicle can accommodate.
    * `engineCapacity` (VARCHAR): Engine capacity of the vehicle.

2.  **Customer Table**
    * `customerID` (Primary Key, INT): Unique identifier for each customer.
    * `firstName` (VARCHAR): First name of the customer.
    * `lastName` (VARCHAR): Last name of the customer.
    * `email` (VARCHAR): Email address of the customer.
    * `phoneNumber` (VARCHAR): Phone number of the customer.

3.  **Lease Table**
    * `leaseID` (Primary Key, INT): Unique identifier for each lease.
    * `vehicleID` (Foreign Key, INT): References `vehicleID` from the Vehicle Table.
    * `customerID` (Foreign Key, INT): References `customerID` from the Customer Table.
    * `startDate` (DATE): Date when the lease period begins.
    * `endDate` (DATE): Date when the lease period ends.
    * `type` (VARCHAR): Type of lease ('DailyLease', 'MonthlyLease').

4.  **Payment Table**
    * `paymentID` (Primary Key, INT): Unique identifier for each payment.
    * `leaseID` (Foreign Key, INT): References `leaseID` from the Lease Table.
    * `paymentDate` (DATE): Date when the payment was made.
    * `amount` (DECIMAL): Amount of the payment.

## Tasks Implemented
The following SQL questions are provided to demonstrate interactions with the Car Rental System database:

1.  Update the daily rate for a Mercedes car to 68.
2.  Delete a specific customer and all associated leases and payments.
3.  Rename the "paymentDate" column in the Payment table to "transactionDate".
4.  Find a specific customer by email.
5.  Get active leases for a specific customer.
6.  Find all payments made by a customer with a specific phone number.
7.  Calculate the average daily rate of all available cars.
8.  Find the car with the highest daily rate.
9.  Retrieve all cars leased by a specific customer.
10. Find the details of the most recent lease.
11. List all payments made in the year 2023.
12. Retrieve customers who have not made any payments.
13. Retrieve Car Details and Their Total Payments.
14. Calculate Total Payments for Each Customer.
15. List Car Details for Each Lease.
16. Retrieve Details of Active Leases with Customer and Car Information.
17. Find the Customer Who Has Spent the Most on Leases.
18. List All Cars with Their Current Lease Information.

## Usage
1.  Create the tables in your SQL database environment using the provided schema.
2.  Populate the tables with sample data to test the queries.
3.  Execute the SQL questions listed under "Tasks Implemented" to retrieve and manipulate the data.
4.  You can use any SQL client or tool to run these queries against your database.

## How to Run
1.  Load the `CarRental SQL.sql` file into your MySQL server.
2.  Execute the stored procedures and queries as needed to explore the database.
