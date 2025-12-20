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
-- QUERY 6: Show books with the number of times each book was borrowed
SELECT 
    b.title AS book_title,
    COUNT(br.borrow_id) AS borrow_count
FROM Book b
LEFT JOIN Borrow br ON b.book_id = br.book_id
GROUP BY b.title;

-- QUERY 7: Show members and the titles of books they borrowed along with borrow dates
SELECT 
    m.full_name AS member_name,
    b.title AS book_title,
    br.borrow_date
FROM Borrow br
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id;

-- QUERY 8: Show staff members and the total number of borrows they handled
SELECT 
    s.full_name AS staff_name,
    COUNT(br.borrow_id) AS total_borrows
FROM Staff s
LEFT JOIN Borrow br ON s.staff_id = br.staff_id
GROUP BY s.full_name;

-- QUERY 9: Show books that were returned late
SELECT 
    b.title AS book_title,
    br.return_date,
    br.due_date
FROM Borrow br
JOIN Book b ON br.book_id = b.book_id
WHERE br.return_date > br.due_date;

-- QUERY 10: Show members and the total number of fines they received
SELECT 
    m.full_name AS member_name,
    COUNT(f.fine_id) AS total_fines
FROM Member m
JOIN Borrow br ON m.member_id = br.member_id
JOIN Fine f ON br.borrow_id = f.borrow_id
GROUP BY m.full_name;

----------------------------------------------------------------------------------------------------------------------------
------ZACH'S 5 COMPLEX QUERIES
--TYPE HERE
SELECT 
    m.full_name,
    COUNT(br.borrow_id) AS total_borrows
FROM Member m
JOIN Borrow br ON m.member_id = br.member_id
GROUP BY m.full_name
HAVING COUNT(br.borrow_id) > 2;

-- QUERY 12: List books along with their authors and genres
SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    g.genre_name
FROM Book b
JOIN Book_Author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id
JOIN Genre g ON b.genre_id = g.genre_id;

-- QUERY 13: Show staff members who handled at least one borrow transaction
SELECT 
    s.full_name AS staff_name,
    COUNT(br.borrow_id) AS transactions_handled
FROM Staff s
JOIN Borrow br ON s.staff_id = br.staff_id
GROUP BY s.full_name
HAVING COUNT(br.borrow_id) > 0;

-- QUERY 14: Find members with unpaid fines and the related book titles
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

-- QUERY 15: Show the most popular genre based on number of borrows
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

