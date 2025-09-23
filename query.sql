-- 1. Identify late vs on-time payments
SELECT c.name, l.loan_id, p.payment_date, p.due_date,
       CASE 
         WHEN p.payment_date > p.due_date THEN 'Late'
         ELSE 'On Time'
       END AS payment_status
FROM Payments p
JOIN Loans l ON p.loan_id = l.loan_id
JOIN Customers c ON l.customer_id = c.customer_id;

-- 2. Calculate % of late payments per customer
SELECT c.customer_id, c.name,
       COUNT(CASE WHEN p.payment_date > p.due_date THEN 1 END) * 100.0 / COUNT(*) AS late_payment_pct
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
JOIN Payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.name;

-- 3. Segment customers into risk categories
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

-- 4. Loan portfolio analysis (avg loan by type)
SELECT loan_type, AVG(loan_amount) AS avg_loan, COUNT(*) AS total_loans
FROM Loans
GROUP BY loan_type;

-- 5. Income vs Loan Amount check
SELECT c.name, c.income, SUM(l.loan_amount) AS total_loans
FROM Customers c
JOIN Loans l ON c.customer_id = l.customer_id
GROUP BY c.name, c.income
ORDER BY total_loans DESC;
