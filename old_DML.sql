                       ----------------------------------------------------
                               -------POPULATE TABLES-----------
                       ----------------------------------------------------
					   
-- Insert authors 
INSERT INTO Author VALUES (1, 'TRESOR', 'KALOMBO');
INSERT INTO Author VALUES (2, 'Fyodor', 'Dostoevsky');


-- Insert books 
INSERT INTO Book VALUES (1, 'The Truth', '000077770000', 2057, 7);
INSERT INTO Book VALUES (2, 'The Brothers Karamazov', '000077770001', 1880, 5);


-- Connect books and authors 
INSERT INTO Book_Author VALUES (1, 1);
INSERT INTO Book_Author VALUES (2, 2);


-- Insert members
INSERT INTO Member VALUES (1, 'Zachariah', '22120765@student.ciu.edu.tr', '+2347061614885', '2025-10-07');
INSERT INTO Member VALUES (2, 'Sultan', '22305640@student.ciu.edu.tr', '+77052175021', '2025-09-07');


-- Insert staff
INSERT INTO Staff VALUES (1, 'Jacob Bush', 'Assistant');
INSERT INTO Staff VALUES (2, 'Aline Koj', 'Librarian');


-- Insert borrow records
INSERT INTO Borrow VALUES (1, 1, 1, 1, '2024-03-01', '2024-03-15', '2024-03-20');
INSERT INTO Borrow VALUES (2, 2, 2, 2, '2024-03-05', '2024-03-19', '2024-03-18');


-- Insert fines
INSERT INTO Fine VALUES (1, 1, 5.00, 'UNPAID');
INSERT INTO Fine VALUES (2, 2, 0.00, 'PAID');

