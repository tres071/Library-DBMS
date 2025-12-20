-- TABLE 1: AUTHOR : Stores book authors
CREATE TABLE Author (
author_id INT PRIMARY KEY, -------------------Unique author ID
first_name VARCHAR(50) NOT NULL, -------------------Author first name
last_name VARCHAR(50) NOT NULL -------------------Author last name
);
-----------------------------------
-- TABLE 2: BOOK: Stores books in the library
CREATE TABLE Book (
book_id INT PRIMARY KEY, -------------------Unique book ID
title VARCHAR(100) NOT NULL, -------------------Book title
isbn VARCHAR(20) UNIQUE, -------------------ISBN number (unique)
publish_year INT, -------------------Year of publication
copies_available INT DEFAULT 1 -------------------Available copies
CHECK (copies_available >= 0) -------------------Cannot be negative
);
------------------------------
-- TABLE 3: MEMBER: Stores library members
CREATE TABLE Member (
member_id INT PRIMARY KEY, -------------------Unique member ID
full_name VARCHAR(100) NOT NULL, -------------------Member name
email VARCHAR(100) UNIQUE, -------------------Email (unique)
phone VARCHAR(20), -------------------Phone number
join_date DATE DEFAULT CURRENT_DATE -------------------Date joined
);
----------------------------
--TABLE 4: STAFF: Stores library staff
CREATE TABLE Staff (
staff_id INT PRIMARY KEY, -------------------Unique staff ID
full_name VARCHAR(100) NOT NULL, -------------------Staff name
position VARCHAR(50) -- Job position
);
---------------------------
-- TABLE 5: BOOK_AUTHOR : Connects books and authors (many-to-many)
CREATE TABLE Book_Author (
book_id INT, -------------------Book ID
author_id INT, -------------------Author ID
PRIMARY KEY (book_id, author_id), -------------------Composite primary key
FOREIGN KEY (book_id) REFERENCES Book(book_id),
FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
------------------------------
--TABLE 6: BORROW: Stores borrow transactions
CREATE TABLE Borrow (
borrow_id INT PRIMARY KEY, -------------------Borrow ID
member_id INT, -------------------Member borrowing
book_id INT, -------------------Borrowed book
staff_id INT, -------------------Staff handling
borrow_date DATE NOT NULL, -------------------Borrow date
due_date DATE NOT NULL, -------------------Due date
return_date DATE, -------------------Return date
FOREIGN KEY (member_id) REFERENCES Member(member_id),
FOREIGN KEY (book_id) REFERENCES Book(book_id),
FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
-----------------------------------
--TABLE 7: FINE : Stores fines for late returns
CREATE TABLE Fine (
fine_id INT PRIMARY KEY, -------------------Fine ID
borrow_id INT UNIQUE, -------------------Related borrow
amount DECIMAL(6,2), -------------------Fine amount
paid_status VARCHAR(10) DEFAULT 'UNPAID',
FOREIGN KEY (borrow_id) REFERENCES Borrow(borrow_id)
);
----------------------------------------
-- TABLE 8: GENRE : Stores book genres
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,          -- Unique genre ID
    genre_name VARCHAR(50) NOT NULL    -- Genre name
);

