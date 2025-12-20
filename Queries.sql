------TRESOR'S 5 COMPLEX QUERIES
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

-- QUERY 3: Show borrow records handled by staff
SELECT 
    s.full_name AS staff_name,
    m.full_name AS member_name,
    b.title AS book_title
FROM Borrow br
JOIN Staff s ON br.staff_id = s.staff_id
JOIN Member m ON br.member_id = m.member_id
JOIN Book b ON br.book_id = b.book_id;
--QUERY 4: Show books with available copies
SELECT title, copies_available
FROM Book
WHERE copies_available > 0
ORDER BY copies_available DESC;
------------------------------------------------------------------------------------------------------------------------
------SULTAN'S 5 COMPLEX QUERIES
--TYPE HERE

----------------------------------------------------------------------------------------------------------------------------
------ZACH'S 5 COMPLEX QUERIES
--TYPE HERE

----------------------------------------------------------------------------------------------------------------------------

