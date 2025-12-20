------TRESOR'S 5 COMPLEX QUERIES
-- Update author of "The Stranger" to Albert Camus
UPDATE Book_Author
SET author_id = 5
WHERE book_id = 5;
-- Update author of "Notes from Underground" to Fyodor Dostoevsky
UPDATE Book_Author
SET author_id = 2
WHERE book_id = 7;
-- Show books with their genres
SELECT 
    b.title,
    g.genre_name
FROM Book b
JOIN Genre g ON b.genre_id = g.genre_id;
-- QUERY 1: Show books with their authors
SELECT 
    b.title AS book_title,
    a.first_name,
    a.last_name
FROM Book b
JOIN Book_Author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id;
-- QUERY 2: Show borrow records with member name and book title
SELECT 
    m.full_name AS member_name,
    b.title AS book_title,
    br.borrow_date,
    br.due_date,
    br.return_date
FROM Borrow br
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id;
--QUERY 3: Show books with available copies
SELECT title, copies_available
FROM Book
WHERE copies_available > 0
ORDER BY copies_available DESC;
--QUERY 4: Shows members who returned books after the due date
SELECT 
    m.full_name AS member_name,
    b.title AS book_title,
    br.return_date,
    br.due_date
FROM Borrow br
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id
WHERE br.return_date > br.due_date;
--QUERY 5:Counts how many books each member borrowed
SELECT 
    m.full_name,
    COUNT(br.borrow_id) AS total_borrows
FROM Member m
LEFT JOIN Borrow br ON m.member_id = br.member_id
GROUP BY m.full_name;

------------------------------------------------------------------------------------------------------------------------
------SULTAN'S 5 COMPLEX QUERIES
--TYPE HERE

----------------------------------------------------------------------------------------------------------------------------
------ZACH'S 5 COMPLEX QUERIES
-- QUERY 1: Show members who have borrowed more than 2 books
SELECT 
    m.full_name,
    COUNT(br.borrow_id) AS total_borrows
FROM Member m
JOIN Borrow br ON m.member_id = br.member_id
GROUP BY m.full_name
HAVING COUNT(br.borrow_id) > 2;

-- QUERY 2: List books along with their authors and genres
SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    g.genre_name
FROM Book b
JOIN Book_Author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id
JOIN Genre g ON b.genre_id = g.genre_id;

-- QUERY 3: Show staff members who handled at least one borrow transaction
SELECT 
    s.full_name AS staff_name,
    COUNT(br.borrow_id) AS transactions_handled
FROM Staff s
JOIN Borrow br ON s.staff_id = br.staff_id
GROUP BY s.full_name
HAVING COUNT(br.borrow_id) > 0;

-- QUERY 4: Find members with unpaid fines and the related book titles
SELECT 
    m.full_name,
    b.title,
    f.amount,
    f.paid_status
FROM Fine f
JOIN Borrow br ON f.borrow_id = br.borrow_id
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id
WHERE f.paid_status = 'UNPAID';

-- QUERY 5: Show the most popular genre based on number of borrows
SELECT 
    g.genre_name,
    COUNT(br.borrow_id) AS borrow_count
FROM Genre g
JOIN Book b ON g.genre_id = b.genre_id
JOIN Borrow br ON b.book_id = br.book_id
GROUP BY g.genre_name
ORDER BY borrow_count DESC
LIMIT 1;

----------------------------------------------------------------------------------------------------------------------------
