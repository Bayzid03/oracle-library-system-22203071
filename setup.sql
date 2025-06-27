-- 📚 Database Initialization
CREATE DATABASE IF NOT EXISTS library_management;
USE library_management;

-- 📘 Table: Books
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(50),
    publisher VARCHAR(50),
    publication_year DATE NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    category VARCHAR(30),
    total_copies INT,
    available_copies INT,
    price DECIMAL(6,2)
);

-- 📘 Table: Members
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100),
    membership_date DATE,
    membership_type VARCHAR(15)
);

-- 📘 Table: Transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    fine_amount DECIMAL(6,2),
    status VARCHAR(15),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


-- 📘 Seed Data: Books
INSERT INTO books (
    book_id, title, author, publisher, publication_year, isbn, category,
    total_copies, available_copies, price
) VALUES
(1, 'Data Science 101', 'John Smith', 'TechPub', '2020-01-01', 'ISBN001', 'Technology', 5, 3, 49.99),
(2, 'The Great Gatsby', 'F. Scott', 'Scribner', '1925-04-10', 'ISBN002', 'Fiction', 3, 2, 19.99),
(3, 'Python Basics', 'Guido Rossum', 'CodeHouse', '2018-03-15', 'ISBN003', 'Programming', 6, 5, 29.99),
(4, 'Calculus Made Easy', 'Silvanus P.', 'MathBooks', '2005-06-12', 'ISBN004', 'Mathematics', 4, 2, 39.99),
(5, 'Artificial Intelligence', 'Peter Norvig', 'AIWorld', '2010-11-01', 'ISBN005', 'Technology', 5, 4, 59.99),
(6, 'Database Systems', 'Hector Garcia', 'DBBooks', '2012-09-20', 'ISBN006', 'Technology', 6, 5, 54.99),
(7, 'Digital Logic', 'Morris Mano', 'Pearson', '2001-08-10', 'ISBN007', 'Engineering', 4, 2, 34.99),
(8, 'Networking Concepts', 'Andrew Tanenbaum', 'NetPress', '2004-05-23', 'ISBN008', 'Technology', 5, 3, 44.99),
(9, 'English Grammar', 'Raymond Murphy', 'CUP', '2000-01-01', 'ISBN009', 'Language', 6, 4, 24.99),
(10, 'Shakespeare Plays', 'William S.', 'LitWorld', '1999-07-15', 'ISBN010', 'Literature', 3, 1, 29.99),
(11, 'Physics for Beginners', 'Isaac Newton', 'SciHouse', '2010-05-10', 'ISBN011', 'Science', 5, 3, 39.00),
(12, 'Organic Chemistry', 'Morrison & Boyd', 'ChemPress', '2003-03-12', 'ISBN012', 'Science', 4, 2, 49.99),
(13, 'Modern Politics', 'John Locke', 'PoliPub', '2015-10-20', 'ISBN013', 'Politics', 4, 3, 32.00),
(14, 'Intro to Philosophy', 'Plato', 'ThinkHouse', '2009-01-01', 'ISBN014', 'Philosophy', 3, 2, 22.00),
(15, 'Machine Learning', 'Tom Mitchell', 'MLBooks', '2011-02-14', 'ISBN015', 'Technology', 6, 5, 55.55),
(16, 'C Programming', 'Dennis Ritchie', 'TechPress', '1995-06-30', 'ISBN016', 'Programming', 5, 3, 27.99),
(17, 'Java in Depth', 'James Gosling', 'CodeWorld', '2007-04-18', 'ISBN017', 'Programming', 6, 4, 45.99),
(18, 'Statistical Methods', 'R.A. Fisher', 'MathsToday', '2002-11-20', 'ISBN018', 'Mathematics', 5, 3, 40.00),
(19, 'Business Ethics', 'Linda Trevino', 'BizBooks', '2016-09-01', 'ISBN019', 'Business', 4, 2, 38.99),
(20, 'World History', 'Howard Zinn', 'HistPress', '1998-03-05', 'ISBN020', 'History', 5, 3, 35.00);

-- 📘 Seed Data: Members
INSERT INTO members (
    member_id, first_name, last_name, email, phone, address, membership_date, membership_type
) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '01234567891', 'Dhaka, BD', '2022-01-01', 'Student'),
(2, 'Bob', 'Smith', 'bob@example.com', '01234567892', 'Chittagong, BD', '2022-02-01', 'Faculty'),
(3, 'Charlie', 'Brown', 'charlie@example.com', '01234567893', 'Rajshahi, BD', '2022-03-01', 'Student'),
(4, 'David', 'Lee', 'david@example.com', '01234567894', 'Khulna, BD', '2022-04-01', 'Staff'),
(5, 'Eve', 'Taylor', 'eve@example.com', '01234567895', 'Barishal, BD', '2022-05-01', 'Student'),
(6, 'Frank', 'Wright', 'frank@example.com', '01234567896', 'Sylhet, BD', '2022-06-01', 'Faculty'),
(7, 'Grace', 'Kim', 'grace@example.com', '01234567897', 'Dhaka, BD', '2022-07-01', 'Student'),
(8, 'Hannah', 'Adams', 'hannah@example.com', '01234567898', 'Dinajpur, BD', '2022-08-01', 'Staff'),
(9, 'Ian', 'Carter', 'ian@example.com', '01234567899', 'Cox’s Bazar, BD', '2022-09-01', 'Faculty'),
(10, 'Jane', 'Doe', 'jane@example.com', '01234567900', 'Rangpur, BD', '2022-10-01', 'Student'),
(11, 'Kyle', 'Bennett', 'kyle@example.com', '01234567901', 'Gazipur, BD', '2022-11-01', 'Staff'),
(12, 'Laura', 'Scott', 'laura@example.com', '01234567902', 'Dhaka, BD', '2022-12-01', 'Faculty'),
(13, 'Mike', 'Turner', 'mike@example.com', '01234567903', 'Bogura, BD', '2023-01-01', 'Student'),
(14, 'Nina', 'Parker', 'nina@example.com', '01234567904', 'Jessore, BD', '2023-02-01', 'Student'),
(15, 'Omar', 'Ali', 'omar@example.com', '01234567905', 'Dhaka, BD', '2023-03-01', 'Staff');

-- 📘 Seed Data: Transactions
INSERT INTO transactions (
    transaction_id, member_id, book_id, issue_date, due_date, return_date, fine_amount, status
) VALUES
(1, 1, 1, '2025-06-01', '2025-06-10', '2025-06-09', 0.00, 'Returned'),
(2, 2, 2, '2025-06-03', '2025-06-13', NULL, 0.00, 'Pending'),
(3, 3, 3, '2025-05-25', '2025-06-05', '2025-06-08', 5.00, 'Returned'),
(4, 4, 4, '2025-06-01', '2025-06-10', NULL, 0.00, 'Overdue'),
(5, 5, 5, '2025-06-02', '2025-06-12', '2025-06-11', 0.00, 'Returned'),
(6, 6, 6, '2025-06-04', '2025-06-14', NULL, 0.00, 'Pending'),
(7, 7, 7, '2025-05-20', '2025-06-01', '2025-06-03', 4.00, 'Returned'),
(8, 8, 8, '2025-06-06', '2025-06-16', NULL, 0.00, 'Pending'),
(9, 9, 9, '2025-06-01', '2025-06-10', NULL, 0.00, 'Overdue'),
(10, 10, 10, '2025-06-02', '2025-06-12', '2025-06-12', 0.00, 'Returned'),
(11, 11, 11, '2025-06-03', '2025-06-13', NULL, 0.00, 'Pending'),
(12, 
