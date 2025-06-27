University Library Management System
Database Final Assignment – MySQL/Oracle Edition

📋 Project Overview
This project delivers a fully functional University Library Management System, built for the final assignment of a database course. It includes database design, SQL queries, PL/SQL programming, and administrative tasks, all deployed on Oracle Database (MySQL-compatible queries included).

🎯 Core Objectives
Design and normalize a relational schema for a university library

Implement sample data and ensure referential integrity

Develop a range of SQL queries from basic to analytical

Automate logic using stored procedures, functions, and triggers

Apply indexing, performance optimization, and user-level access control

🎓 Completed Deliverables
📦 Part 1: Database Design & Seeding
Defined relational schema: BOOKS, MEMBERS, TRANSACTIONS

Enforced constraints: primary keys, unique keys, foreign keys

Populated with:

20 books from diverse categories

15 verified member records

25+ transactions with various statuses and fines

🔎 Part 2: Querying & Manipulation
Book availability lookup using comparison conditions

Fines calculated dynamically using DATEDIFF()

Insert-new-member logic with duplication prevention

Archiving logic for old transactions using date filtering

Category assignments based on publication year ranges

🔁 Part 3: Joins & Advanced Queries
INNER JOIN → All overdue transaction details

LEFT JOIN → Books with and without borrow history

SELF JOIN → Members borrowing from same category as others

CROSS JOIN → Member-book pairs for recommendation engine

Subqueries →

Above-average borrowing analysis

Fine totals by membership type

Books in most borrowed category

Second most active borrower detection

📊 Part 4: Analytical Insights
Running monthly fines using SUM() OVER (...)

RANK() analysis by membership type

Category-level borrowing contribution using percentage ratios

🛠️ Part 5: PL/SQL Logic & Automation
✅ ISSUE_BOOK() stored procedure with locking and validations

✅ CALCULATE_FINE() function returning fine by delay in days

✅ AFTER UPDATE trigger to maintain book inventory after return

🔐 Part 6: Security & Performance
Created users: librarian, student_user

Privileges:

librarian: ALL PRIVILEGES

student_user: SELECT on BOOKS only

Indexed author, title, member_id, and book_id columns

Verified query plans using EXPLAIN statements
