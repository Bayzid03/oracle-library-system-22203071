-- Task 4: Member Borrowing Trends with Previous Issue Date

SELECT 
    member_id,
    transaction_id,
    issue_date,
    LAG(issue_date) OVER (
        PARTITION BY member_id 
        ORDER BY issue_date
    ) AS prev_issue_date
FROM TRANSACTIONS
ORDER BY member_id, issue_date;

-- Task 4.1: Stored Procedure for Book Issuing

DELIMITER $$

CREATE PROCEDURE IssueBook (
    IN in_member_id INT,
    IN in_book_id INT
)
book_issue_block: BEGIN
    DECLARE book_stock INT DEFAULT 0;
    DECLARE next_txn_id INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT '❌ Book issue failed due to a database error.' AS message;
    END;

    START TRANSACTION;

    -- Lock and check availability
    SELECT available_copies INTO book_stock
    FROM BOOKS
    WHERE book_id = in_book_id
    FOR UPDATE;

    IF book_stock IS NULL THEN
        ROLLBACK;
        SELECT '⚠️ Book not found.' AS message;
        LEAVE book_issue_block;
    END IF;

    IF book_stock <= 0 THEN
        ROLLBACK;
        SELECT '⚠️ No copies available.' AS message;
        LEAVE book_issue_block;
    END IF;

    -- Generate next transaction ID
    SELECT IFNULL(MAX(transaction_id), 0)
    INTO next_txn_id
    FROM TRANSACTIONS;

    -- Insert transaction
    INSERT INTO TRANSACTIONS (
        transaction_id, member_id, book_id,
        issue_date, due_date, return_date,
        fine_amount, status
    )
    VALUES (
        next_txn_id + 1,
        in_member_id,
        in_book_id,
        CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 14 DAY),
        NULL,
        0.00,
        'Pending'
    );

    -- Update book inventory
    UPDATE BOOKS
    SET available_copies = available_copies - 1
    WHERE book_id = in_book_id;

    COMMIT;

    SELECT CONCAT('✅ Book successfully issued. Transaction ID: ', next_txn_id + 1) AS message;
END book_issue_block $$

DELIMITER ;

-- Task 4.2: Function to Calculate Fine

DELIMITER $$

CREATE FUNCTION ComputeFine (txn_id INT)
RETURNS DECIMAL(6,2)
DETERMINISTIC
BEGIN
    DECLARE d_due DATE;
    DECLARE d_return DATE;
    DECLARE d_today DATE;
    DECLARE overdue INT DEFAULT 0;
    DECLARE fine_amt DECIMAL(6,2) DEFAULT 0.00;

    SET d_today = CURDATE();

    SELECT due_date, return_date INTO d_due, d_return
    FROM TRANSACTIONS
    WHERE transaction_id = txn_id;

    IF d_return IS NOT NULL THEN
        SET overdue = DATEDIFF(d_return, d_due);
    ELSE
        SET overdue = DATEDIFF(d_today, d_due);
    END IF;

    IF overdue > 0 THEN
        SET fine_amt = overdue * 5;
    END IF;

    RETURN fine_amt;
END $$

DELIMITER ;

SELECT ComputeFine(1) AS fine_amount;

-- Task 4.3: Trigger to Restore Copies on Return

DELIMITER $$

CREATE TRIGGER RestoreCopiesAfterReturn
AFTER UPDATE ON TRANSACTIONS
FOR EACH ROW
BEGIN
    IF OLD.status <> 'Returned' AND NEW.status = 'Returned' THEN
        UPDATE BOOKS
        SET available_copies = available_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END $$

DELIMITER ;

-- Task 5: User Management and Privileges

-- User Creation
CREATE USER 'librarian'@'localhost' IDENTIFIED BY 'lib_password123';
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_password123';

-- Privilege Assignment
GRANT ALL PRIVILEGES ON Library_Management_System.* TO 'librarian'@'localhost';
GRANT SELECT ON Library_Management_System.BOOKS TO 'student_user'@'localhost';

-- Apply Privileges
FLUSH PRIVILEGES;

-- Optional Cleanup
DROP USER IF EXISTS 'librarian'@'localhost';
DROP USER IF EXISTS 'student_user'@'localhost';

-- Re-create Users Again (if needed)
CREATE USER 'librarian'@'localhost' IDENTIFIED BY 'lib_password123';
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_password123';
GRANT ALL PRIVILEGES ON Library_Management_System.* TO 'librarian'@'localhost';
GRANT SELECT ON Library_Management_System.BOOKS TO 'student_user'@'localhost';
FLUSH PRIVILEGES;
