-- Schema for Credit Risk Analysis Project

-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    income DECIMAL(10,2)
);

-- Loans table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    loan_type VARCHAR(20),
    issue_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    due_date DATE,
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);
