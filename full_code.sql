create database credit_risk;

use credit_risk;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    income DECIMAL(10,2)
);


CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_type VARCHAR(20),
    issue_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    due_date DATE,
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);


INSERT INTO Customers VALUES
(1, 'Ravi Kumar', 35, 'Male', 60000),
(2, 'Anita Sharma', 29, 'Female', 45000),
(3, 'Arjun Mehta', 42, 'Male', 80000);

INSERT INTO Loans VALUES
(101, 1, 200000, 12.5, 'Home Loan', '2022-01-15'),
(102, 2, 50000, 15.0, 'Personal Loan', '2022-02-10'),
(103, 3, 100000, 10.0, 'Car Loan', '2022-03-05');

INSERT INTO Payments VALUES
(1001, 101, '2022-02-15', '2022-02-15', 20000),
(1002, 101, '2022-03-20', '2022-03-15', 20000), -- late
(1003, 102, '2022-03-10', '2022-03-10', 10000),
(1004, 103, '2022-04-05', '2022-04-05', 15000);


SELECT c.name, l.loan_id, p.payment_date, p.due_date,
       CASE 
         WHEN p.payment_date > p.due_date THEN 'Late'
         ELSE 'On Time'
       END AS payment_status
FROM Payments p
JOIN Loans l ON p.loan_id = l.loan_id
JOIN Customers c ON l.customer_id = c.customer_id;

SELECT c.customer_id, c.name,
       COUNT(CASE WHEN p.payment_date > p.due_date THEN 1 END) * 100.0 / COUNT(*) AS late_payment_pct
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
JOIN Payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.name;

SELECT c.customer_id, c.name,
       CASE
         WHEN COUNT(CASE WHEN p.payment_date > p.due_date THEN 1 END) * 100.0 / COUNT(*) > 50 THEN 'High Risk'
         WHEN COUNT(CASE WHEN p.payment_date > p.due_date THEN 1 END) * 100.0 / COUNT(*) BETWEEN 20 AND 50 THEN 'Medium Risk'
         ELSE 'Low Risk'
       END AS risk_category
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
JOIN Payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.name;

