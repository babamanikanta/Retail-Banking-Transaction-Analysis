-- Creating DataBase
CREATE DATABASE bank_analysis;

USE bank_analysis;

-- FOR BRACHES :-

 CREATE TABLE branches(
	branch_id VARCHAR(10) PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(30) NOT NULL,
    region VARCHAR(30) NOT NULL,
    opening_date DATE,
    employee_count INT
 ); 

 DESC branches;

 -- CREATING CUSTOMERS 
CREATE TABLE  customers(
	customer_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(30),
    customer_since DATE,
    kyc_status VARCHAR(20),
    segment VARCHAR(30),
    annual_income DECIMAL(12,2),
    credit_score INT,
    is_active VARCHAR(3)
	
);
-- Creating Accounts

-- Here while creating the date column which has empty values
-- for that we have to use the data type of "varchar" in starting 
-- after that we have to update the empty values to NULL values 
-- after that we have to update the data type of varchar to date

CREATE TABLE accounts(
	account_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    branch_id VARCHAR(10) ,
    account_type VARCHAR(30) DEFAULT "savings",
    open_date DATE ,
    close_date DATE,
    current_balance DECIMAL(15,2),
    interest_rate DECIMAL (5,2),
    overdraft_limit DECIMAL(12,1) DEFAULT "0",
    account_status VARCHAR(20) NOT NULL DEFAULT "active",
    FOREIGN KEY(customer_id) 
		references customers(customer_id),
	FOREIGN KEY(branch_id)
		references branches(branch_id)
);
 alter table accounts
 modify close_date varchar(10);
 
set sql_safe_updates=0; 
update accounts 
	set close_date=NULL 
		where close_date="";
        
 
 update  accounts
	set close_date=NULL
		where close_date="";

alter table accounts 
	modify close_date date;

desc accounts;

-- CREATING CARDS
CREATE TABLE cards(
	card_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20) NOT NULL,
    card_type VARCHAR(20) NOT NULL,
    issue_date DATE,
    expiry_date DATE,
    credit_limit DECIMAL(12,2),
    outstanding_balance DECIMAL(12,2),
    reward_points INT DEFAULT 0,
    is_active VARCHAR(3) DEFAULT 'YES',
    network VARCHAR(20),
    FOREIGN KEY(account_id) 
		references accounts(account_id)
);
select count(*) from cards;

-- CREATING LOANS
CREATE TABLE loans(
	 loan_id VARCHAR(20) PRIMARY KEY,
     customer_id VARCHAR(20),
     branch_id VARCHAR(10),
     loan_type VARCHAR(30),
     principle_amount DECIMAL(15,2),
     interest_rate DECIMAL(5,2),
     tenure_months INT,
     disbursement_date DATE,
     maturity_date DATE,
     emi_amount DECIMAL(12,2),
     outstanding_balance DECIMAL(15,2),
     loan_status VARCHAR(30),
     purpose VARCHAR(50),
     FOREIGN KEY(customer_id) 
		references customers(customer_id),
	FOREIGN KEY(branch_id)
		references branches(branch_id)
);
truncate table cards;
-- alter table loans
-- modify priciple_amount decimal(15,2);

desc loans;
select* from cards;

-- CREATING LOAN_PAYMENTS
CREATE TABLE loan_payments(
	payment_id VARCHAR(20) PRIMARY KEY,
    loan_id VARCHAR(20),
    payment_date DATE,
    scheduled_amount DECIMAL(12,2),
    paid_amount  DECIMAL(12,2),
    principle_paid  DECIMAL(12,2),
    interest_paid  DECIMAL(12,2),
    penality  DECIMAL(12,2),
    days_late INT,
    payment_method VARCHAR(30),
    loan_status VARCHAR(20),
    FOREIGN KEY(loan_id)
		references loans(loan_id)
);

-- CREATING TRANSACTIONS
CREATE TABLE transactions(
	transaction_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20),
    transaction_date DATE,
    transaction_time TIME,
    transaction_type VARCHAR(30),
    amount DECIMAL(15,2),
    channels VARCHAR(30),
    descriptions VARCHAR(50),
    balance_after DECIMAL(15,2),
    transaction_status VARCHAR(20),
    FOREIGN KEY(account_id) 
		references accounts(account_id)
);

  -- sprint - 4.1
   select * from customers;
   -- 1. What are the different customer segments, and how many customers belong to each segment?
   SELECT Segment, COUNT(*) AS Customer_Count
FROM customers
GROUP BY Segment;
   
   -- 2. Which cities have the highest number of customers?
   SELECT 
    City,
    COUNT(*) AS Customer_Count
FROM customers
GROUP BY City
ORDER BY Customer_Count DESC;

-- 3.Which customers have an annual income greater than ₹50,000 and a credit score above 700?
SELECT *
FROM customers
WHERE Annual_Income > 50000
  AND Credit_Score > 700;
  
  -- 4.Which cities have an average credit score greater than 700?
  SELECT 
    City,
    AVG(Credit_Score) AS Average_Credit_Score
FROM customers
GROUP BY City
HAVING AVG(Credit_Score) > 700;

-- 5.Which customers have names starting with the letter A? 
SELECT *
FROM customers
WHERE first_name LIKE 'A%';
   
   
   -- sprint -- 4.2
   
   select * from accounts;
  -- 1.What are the different account types and how many accounts exist for each type? 
  SELECT 
    Account_Type,
    COUNT(*) AS Account_Count
FROM accounts
GROUP BY Account_Type;

-- 2.Which account types have the highest total balance? 
SELECT 
    Account_Type,
    SUM(current_Balance) AS Total_Balance
FROM accounts
GROUP BY Account_Type
ORDER BY Total_Balance DESC;
   
   -- 3.Which customers have more than one bank account? 
   SELECT 
    c.Customer_ID,
    COUNT(a.Account_ID) AS Account_Count
FROM customers c
INNER JOIN accounts a
    ON c.Customer_ID = a.Customer_ID
GROUP BY c.Customer_ID
HAVING COUNT(a.Account_ID) > 1;
   
   -- 4.Which branches have the highest average account balance? 
   SELECT 
    b.Branch_Name,
    AVG(a.current_Balance) AS Average_Balance
FROM branches b
INNER JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
GROUP BY b.Branch_ID, b.Branch_Name
ORDER BY Average_Balance DESC;
   
   -- 5.ind accounts opened between two specific dates ?
   SELECT *
FROM accounts
WHERE Open_Date 
BETWEEN '2025-01-01' AND '2025-12-31';
 
 
-- sprint -- 4.3

-- 1.Display the following information for all customers:
-- customer_id,first_name,last_name,city,state,segment

select customer_id,first_name,last_name,city,state,segment from customers;

-- 2.Find all the different customer segments available in the customers table.

select distinct segment from customers;

-- 3.Find all customers whose credit score is greater than 750.
-- customer_id,first_name,last_name,credit_score

 select customer_id,first_name,last_name,credit_score from customers 
 where credit_score>750;

 
 -- 4.Find customers who satisfy both conditions:
-- Annual income is greater than ₹500,000
-- Credit score is greater than 700
-- customer_id,first_name,last_name,annual_income,credit_score

select customer_id,first_name,last_name,annual_income,credit_score from customers 
where annual_income>200000 and credit_score>700;

-- 5.Find customers whose annual income is between 100000 and 200000.
-- customer_id,first_name,last_name,annual_income

select customer_id,first_name,last_name,annual_income from customers 
where annual_income between 100000 and 200000;

-- 6.Find customers whose first name starts with the letter A.
-- customer_id,first_name,last_name

select customer_id,first_name,last_name from customers
where first_name like 'A%';



-- 7.Find customers who belong to either Premium, Gold, or Silver segment.
-- customer_id, first_name, last_name, segment

select customer_id,first_name,last_name,segment from customers
where segment in ('	Retail','Student','Business','Premium');
 
 
-- 8.Display the first 10 customers from the customers table. 
-- customer_id, first_name, last_name

select customer_id,first_name,last_name from customers limit 10;

-- 9.Display 10 customers starting from the 21st record 
-- customer_id, first_name, last_name

select customer_id, first_name, last_name from customers limit 10 offset 20;

-- 10.Find customers whose first name starts with either A or S.
-- customer_id, first_name, last_name

select customer_id, first_name, last_name from customers
where first_name like 'A%' or first_name like 'S%';

 select distinct segment from customers;
 select * from customers;
 
 
 
-- sprint - 4.4

-- 1. What are the different loan types, and how many loans are there for each loan type?

select  loan_type,count(*)  as count from loans 
group by loan_type;

-- 2. Find all loans where the outstanding balance is greater than ₹100,000. 
-- Display loan_id,loan_type,priciple_amount,outstanding_balance,loan_status

select loan_id,loan_type,priciple_amount,outstanding_balance,loan_status from loans
where outstanding_balance>100000;

-- 3.Find all loans where the interest rate is between 5% and 10%.
-- Display: loan_id,loan_type,interest_rate,outstanding_balance

select loan_id,loan_type,interest_rate,outstanding_balance from loans
where interest_rate between 5 and 10;

-- 4. For each loan type, calculate:
-- Number of loans
-- Total principal amount
-- Total outstanding balance
-- Sort the result by total outstanding balance from highest to lowest.

SELECT 
	loan_type,
    count(*) as Count,
    sum(principal_amount) as Total_Principal_Amount,
    sum(outstanding_balance) as Total_Outstanding_Balance
from loans
GROUP BY loan_type
order by Total_Outstanding_Balance DESC;

-- 5.Identify customers who have more than one loan.
-- customer_id
-- Number of loans

select 
	customer_id,
    count(*) as Total_loans_count
from loans 
group by customer_id
having Total_loans_count>1;

-- 6. Which branches have more than 10 loans?
-- branch_id
-- branch_name
-- Number of loans

select 
	l.branch_id,
    b.branch_name,
    count(*) as loans_per_branch
from loans l
join branches b on l.branch_id=b.branch_id
group by b.branch_name,l.branch_id
having loans_per_branch>=10;

select * from loans;

 -- Sprint-4.5
 
 -- 1. What is the average credit limit for each card type?
 
 select card_type,count(*) as conunt, avg(credit_limit) as Average_Credit_Limit from cards 
 group by card_type;

-- 2. Find all cards where the outstanding_balance is greater than ₹2,000. Display card_id, card_type, and outstanding_balance.
select card_id,card_type,outstanding_balance from cards
where
	outstanding_balance>2000;
    
-- 3. Find all cards that have reward_points between 5,000 and 15,000. Display card_id, card_type, and reward_points.
select card_id,card_type,reward_points from cards
where reward_points BETWEEN 5000 and 15000;

-- 4. Which card networks have the highest number of cards? Display the network and number of cards, from highest to lowest.
select network,count(card_id) as count from cards
group by network
ORDER BY count(card_id) desc;
 
 
-- 5.Which card networks have more than 100 cards?
select network,count(card_id) as count from cards
group by network
having count(card_id) > 150; 

-- 6.Find the customers who have cards. Display: customer_id,first_name,last_name,card_id,card_type,network
select 
	c.customer_id,
	c.first_name,
    c.last_name,
    cards.card_id,
    cards.card_type,
    cards.network
from customers c 
join accounts a on c.customer_id=a.customer_id
join cards on a.account_id=cards.account_id;
 
 
 select * from cards;
 
 
 -- 1 — Total transaction amount for every transaction

-- transaction_id
-- account_id
-- amount

select transaction_id,account_id,amount,sum(amount) over() from transactions;

-- 2. — Total transaction amount per account

-- transaction_id
-- account_id
-- amount
-- total_account_transaction_amount

select transaction_id,account_id,amount,sum(amount) over(partition by account_id) as Total_account_transaction_amount from transactions;

-- 3 — Number of transactions per account

-- transaction_id
-- account_id
-- amount
-- transaction_count

select transaction_id,account_id,amount,count(*) over(PARTITION BY account_id) as transaction_count from transactions;

-- 4.Running transaction total for each account

-- transaction_id
-- account_id
-- transaction_date
-- amount
-- running_total

select transaction_id,account_id,transaction_date,amount,sum(amount) over(partition by account_id order by transaction_date) from transactions