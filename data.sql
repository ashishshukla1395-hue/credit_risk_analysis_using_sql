-- Sample Data for Customers
INSERT INTO Customers VALUES
(1, 'Ravi Kumar', 35, 'Male', 60000),
(2, 'Anita Sharma', 29, 'Female', 45000),
(3, 'Arjun Mehta', 42, 'Male', 80000),
(4, 'Priya Singh', 31, 'Female', 30000),
(5, 'Vikram Joshi', 50, 'Male', 90000);

-- Sample Data for Loans
INSERT INTO Loans VALUES
(101, 1, 200000, 12.5, 'Home Loan', '2022-01-15'),
(102, 2, 50000, 15.0, 'Personal Loan', '2022-02-10'),
(103, 3, 100000, 10.0, 'Car Loan', '2022-03-05'),
(104, 4, 40000, 18.0, 'Personal Loan', '2022-03-20'),
(105, 5, 300000, 9.5, 'Home Loan', '2022-04-01');

-- Sample Data for Payments
INSERT INTO Payments VALUES
(1001, 101, '2022-02-15', '2022-02-15', 20000),
(1002, 101, '2022-03-20', '2022-03-15', 20000), -- late
(1003, 102, '2022-03-10', '2022-03-10', 10000),
(1004, 103, '2022-04-05', '2022-04-05', 15000),
(1005, 104, '2022-04-25', '2022-04-15', 8000), -- late
(1006, 105, '2022-05-01', '2022-05-01', 25000);
