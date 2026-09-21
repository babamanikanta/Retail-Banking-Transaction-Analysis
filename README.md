# Retail Banking Transaction Analysis

##  Project Overview

**Retail Banking Transaction Analysis** is a MySQL-based database project focused on managing and analyzing retail banking data.

The project includes customer, account, transaction, branch, loan, loan payment, and card information. SQL queries are used to analyze the data and generate meaningful business insights.

The project follows the flow:

**Database Design → SQL Queries → Data Analysis → Business Insights**

##  Objectives

* Design a relational database for retail banking data.
* Create relationships between banking entities using Primary Keys and Foreign Keys.
* Store and manage customer, account, transaction, loan, and card data.
* Analyze banking data using SQL.
* Identify customer and transaction patterns.
* Analyze account balances and loan information.
* Generate meaningful business insights from the data.

##  Technologies Used

* **MySQL**
* **SQL**
* **MySQL Workbench**
* **ER Diagram**

##  Database Tables

The database contains the following major entities:

* Customers
* Accounts
* Branches
* Transactions
* Loans
* Loan Payments
* Cards

These tables are connected using **Primary Key (PK)** and **Foreign Key (FK)** relationships.

##  SQL Analysis

The project includes SQL analysis for:

### Customer Analysis

* Customer segmentation
* Customers without active accounts
* Customers having multiple accounts

### Account Analysis

* Account types
* Number of accounts by type
* Total account balances

### Transaction Analysis

* Transaction channels
* Transaction counts
* Total transaction values
* Transaction status analysis

### Branch Analysis

* Loan activity by branch
* Number of loans by branch
* Loan amounts by branch

### Loan Analysis

* Loan types
* Number of loans by type
* Outstanding loan amounts

##  Key Insights

Some of the insights obtained from the analysis include:

* Online banking was the most frequently used transaction channel.
* IRA accounts had the highest total balance among the analyzed account types.
* Education loans had the highest outstanding loan amount.
* Customers with multiple accounts showed higher engagement with banking products.
* Branch-level loan analysis helps understand loan distribution across locations.
* Customer segmentation can help understand different customer groups.

##  SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* Aggregate Functions
* JOINs
* Subqueries
* CASE statements
* Primary Keys
* Foreign Keys
* Window Functions

## Project Files

```text
Retail-Banking-Transaction-Analysis/
│
├── Datasets/
│
├── complete_schema.mwb
├── complete_schema.mwb.bak
├── ER-Diagram.png
├── Retail_Banking_Transaction_Analysis_Reference_Format.pptx
└── sql-project(bank).sql
```

### File Description

| File                                                        | Description                                 |
| ----------------------------------------------------------- | ------------------------------------------- |
| `Datasets/`                                                 | Contains the project dataset files          |
| `complete_schema.mwb`                                       | MySQL Workbench database schema             |
| `complete_schema.mwb.bak`                                   | Backup of the MySQL Workbench schema        |
| `ER-Diagram.png`                                            | Entity Relationship Diagram of the database |
| `Retail_Banking_Transaction_Analysis_Reference_Format.pptx` | Project presentation                        |
| `sql-project(bank).sql`                                     | SQL database, data, and analysis queries    |

##  How to Use

### 1. Open the SQL File

Open:

```text
sql-project(bank).sql
```

in **MySQL Workbench**.

### 2. Execute the SQL Script

Run the script to create the database, tables, insert data, and execute the required SQL queries.

### 3. Explore the Database

The database schema can be viewed using:

```text
complete_schema.mwb
```

The visual database structure is also available in:

```text
ER-Diagram.png
```

##  Project Outcome

This project provided practical experience in:

* Relational database design
* SQL query writing
* Database relationships
* Data aggregation
* JOIN operations
* Financial data analysis
* Business-oriented data interpretation

It helped demonstrate how **SQL can be used to collect, analyze, and bring meaningful insights from banking data.**

##  Team

* **K. Baba Manikanta**
* **P. V. S. Rithvik**
* **K. Mahesh Babu**

##  Conclusion

The **Retail Banking Transaction Analysis** project demonstrates the use of MySQL and SQL to manage and analyze real-world banking data.

The project covers the complete process from **database design and data management to SQL analysis and business insights**.
