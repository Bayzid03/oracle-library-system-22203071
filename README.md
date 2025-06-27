# 📚 University Library Management System

**🎓 Final Assignment — Database (MySQL/Oracle/SQL Server) Course**

A complete database solution for managing a university library, built using **Oracle Database**, integrating advanced SQL and PL/SQL programming concepts.

---

## 📌 Project Overview

This system demonstrates the design and implementation of a fully functional **University Library Management System**, focusing on data modeling, querying, procedural logic, and database administration.

---

## 🎯 Objectives

* ✅ Design normalized relational databases for real-world systems
* ✅ Implement efficient and secure SQL-based solutions
* ✅ Develop PL/SQL-based procedures, functions, and triggers
* ✅ Apply administrative techniques for performance and user management

---

## 🧠 Learning Outcomes

| Area                | Skills Demonstrated                                |
| ------------------- | -------------------------------------------------- |
| **Database Design** | ER modeling, normalization (1NF to 3NF)            |
| **SQL Mastery**     | DDL, DML, DCL, TCL operations                      |
| **PL/SQL Logic**    | Business logic via procedures, functions, triggers |
| **Administration**  | Roles, privileges, indexing, performance tuning    |

---

## ✅ Completed Assignment Parts

| Part       | Description                              | Status      |
| ---------- | ---------------------------------------- | ----------- |
| **Part 1** | Database Design & Sample Data (15 marks) | ✅ Completed |
| **Part 2** | Basic SQL Operations (20 marks)          | ✅ Completed |
| **Part 3** | Advanced SQL Queries (25 marks)          | ✅ Completed |
| **Part 4** | PL/SQL Programming (25 marks)            | ✅ Completed |
| **Part 5** | User Management & Performance (15 marks) | ✅ Completed |

---

## 🛠️ Technologies Used

| Component       | Tool                            |
| --------------- | ------------------------------- |
| **Database**    | Oracle DB                       |
| **Languages**   | SQL, PL/SQL                     |
| **Admin Tools** | Oracle SQL Developer, SQL\*Plus |

---

## 🌟 Key Features

### 📖 Book Management

* Track books by title, author, category, and ISBN
* Monitor available vs. total copies
* Inventory and category-based classification

### 👥 Member Management

* Multi-type support: students, faculty, staff
* Membership status & contact management

### 🔄 Transaction Handling

* Borrow/return tracking with date validation
* Fine calculation based on overdue duration
* Real-time status updates

### 📊 Advanced SQL Analytics

* Available books check
* Overdue and top-borrowed analysis
* Join operations, subqueries, window functions

### ⚙️ Automation with PL/SQL

* **ISSUE\_BOOK** procedure with validation
* **CALCULATE\_FINE** function for delayed returns
* **UPDATE\_AVAILABLE\_COPIES** trigger on returns

### 🔐 Role-Based Access & Performance

* **librarian**: full access
* **student\_user**: limited read access
* Indexing and query optimization for speed

---

## 📂 Project Structure

```
oracle-library-system-[student-id]/
│
├── README.md            # 📄 Project documentation
└── sql/
    ├── setup.sql        # 🏗️ Schema + Sample Data
    ├── queries.sql      # 🔍 SQL Queries (Basic + Advanced)
    ├── plsql.sql        # ⚙️ Procedures, Functions, Triggers
    └── admin.sql        # 🛡️ Roles & Indexing
```

---

## 📄 File Descriptions

### `setup.sql`

* Table definitions (BOOKS, MEMBERS, TRANSACTIONS)
* Constraints (PK, FK, checks)
* Sample data (20 books, 15 members, 25 transactions)

### `queries.sql`

* Retrievals: available books, overdue members, etc.
* Joins: INNER, LEFT, SELF, CROSS
* Subqueries, aggregates, window functions

### `plsql.sql`

* `ISSUE_BOOK` procedure
* `CALCULATE_FINE` function
* `UPDATE_AVAILABLE_COPIES` trigger

### `admin.sql`

* User and role creation
* Privileges and security setup
* Indexes for performance tuning

---

## 🚀 How to Execute

1. **Connect to Oracle**

   ```
   sqlplus username/password@database
   ```

2. **Run the SQL files in order:**

   ```sql
   @sql/setup.sql      -- Create schema and insert sample data  
   @sql/queries.sql    -- Run basic and advanced queries  
   @sql/plsql.sql      -- Create procedures, triggers, functions  
   @sql/admin.sql      -- Set roles, privileges, indexes  
   ```

---

## 🧬 Database Schema

### Tables:

* **BOOKS**: Book details (book\_id, title, author, ISBN, copies, etc.)
* **MEMBERS**: Member info (member\_id, name, contact, type, etc.)
* **TRANSACTIONS**: Borrow/return logs with fine status

---

## ✅ Requirements Covered

| Requirement            | Implemented |
| ---------------------- | ----------- |
| 📚 20 Books            | ✅           |
| 👨‍🎓 15 Members       | ✅           |
| 🔁 25 Transactions     | ✅           |
| 📥 Overdue Queries     | ✅           |
| 📈 Top Borrowed Stats  | ✅           |
| ⚙️ PL/SQL Procedures   | ✅           |
| 🧾 Fine Calculation    | ✅           |
| 🔐 User Access Control | ✅           |
| ⚡ Performance Indexing | ✅           |

---

## 📌 PL/SQL Components

* `ISSUE_BOOK (member_id, book_id)`
  → Validates and processes a new borrowing request

* `CALCULATE_FINE (transaction_id)`
  → Returns fine based on overdue days (₹5/day)

* `UPDATE_AVAILABLE_COPIES` trigger
  → Updates `available_copies` automatically on returns

---

## 👥 User Roles

| Role              | Access Level                    |
| ----------------- | ------------------------------- |
| **librarian**     | Full access to all operations   |
| **student\_user** | Read-only access to BOOKS table |

---

## 📬 Final Notes

This project represents a real-world simulation of managing a university library system, using Oracle DB tools and best practices in SQL and PL/SQL. It covers the full lifecycle from schema design to analytics and automation.

---
