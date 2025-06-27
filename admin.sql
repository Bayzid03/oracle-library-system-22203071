-- Section 5

-- Part 1: Index Creation for Optimized Queries
CREATE INDEX books_idx_author ON BOOKS (author);
CREATE INDEX books_idx_title ON BOOKS (title);
CREATE INDEX transactions_idx_member_id ON TRANSACTIONS (member_id);
CREATE INDEX transactions_idx_book_id ON TRANSACTIONS (book_id);

-- Part 2: Execution Plan for Author-Based Book Search
EXPLAIN PLAN FOR
SELECT *
FROM BOOKS
WHERE author = 'John Smith';

