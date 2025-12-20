
-- QUERY 1: Display all authors

SELECT * 
FROM Author;

-- QUERY 2: Display all books

SELECT * 
FROM Book;

-- QUERY 3: Show books with their authors

SELECT 
    b.title AS book_title,
    a.first_name,
    a.last_name
FROM Book b
JOIN Book_Author ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id;

-- QUERY 4: Display all members

SELECT * 
FROM Member;

-- QUERY 5: Display all staff

SELECT * 
FROM Staff;

-- QUERY 6: Show borrow records with member name and book title

SELECT 
    m.full_name AS member_name,
    b.title AS book_title,
    br.borrow_date,
    br.due_date,
    br.return_date
FROM Borrow br
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id;

-- QUERY 7: Show borrow records handled by staff
-
SELECT 
    s.full_name AS staff_name,
    m.full_name AS member_name,
    b.title AS book_title
FROM Borrow br
JOIN Staff s ON br.staff_id = s.staff_id
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id;

-- QUERY 8: Find late returns

SELECT *
FROM Borrow
WHERE return_date > due_date;

-- QUERY 9: Count total number of books

SELECT COUNT(*) AS total_books
FROM Book;

-- QUERY 10: Count total number of members

SELECT COUNT(*) AS total_members
FROM Member;
-
-- QUERY 11: Show all fines

SELECT *
FROM Fine;

-- QUERY 12: Show unpaid fines

SELECT *
FROM Fine
WHERE paid_status = 'UNPAID';

-- QUERY 13: Calculate total fines amount

SELECT SUM(amount) AS total_fines
FROM Fine;

-- QUERY 14: Calculate average fine amount

SELECT AVG(amount) AS average_fine
FROM Fine;

--QUERY 15: Show books with available copies
SELECT title, copies_available
FROM Book
WHERE copies_available > 0
ORDER BY copies_available DESC;
------SULTAN'S 5 COMPLEX QUERIES
--TYPE HERE

------------------------------

------ZACH'S 5 COMPLEX QUERIES
--TYPE HERE

------------------------------

