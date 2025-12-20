-- Insert authors
INSERT INTO Author VALUES (1, 'Tresor', 'Kalombo');
INSERT INTO Author VALUES (2, 'Fyodor', 'Dostoevsky');
INSERT INTO Author VALUES (3, 'Friedrich', 'Nietzsche');
INSERT INTO Author VALUES (4, 'Jane', 'Austen');
INSERT INTO Author VALUES (5, 'Albert', 'Camus');

-- Insert books
INSERT INTO Book VALUES (1, 'The Truth', '000077770000', 2057, 7);
INSERT INTO Book VALUES (2, 'The Brothers Karamazov', '000077770001', 1880, 5);
INSERT INTO Book VALUES (3, 'Next Year', '000077770002', 2059, 4);
INSERT INTO Book VALUES (4, 'Pride and Prejudice', '000077770003', 1813, 6);
INSERT INTO Book VALUES (5, 'The Stranger', '000077770004', 1942, 0); -- no copies available
INSERT INTO Book VALUES (6, 'Thus Spoke Zarathustra', '000077770005', 1883, 1);
INSERT INTO Book VALUES (7, 'Notes from Underground', '000077770006', 1864, 0); -- no copies available

-- Connect books with authors
-- Author 1 wrote two books
INSERT INTO Book_Author VALUES (1, 1);
INSERT INTO Book_Author VALUES (3, 1);
-- Author 2 wrote two books
INSERT INTO Book_Author VALUES (2, 2);
INSERT INTO Book_Author VALUES (5, 2);
-- Other authors
INSERT INTO Book_Author VALUES (6, 3); -- Nietzsche
INSERT INTO Book_Author VALUES (4, 4); -- Austen
INSERT INTO Book_Author VALUES (7, 5); -- Camus
-- Insert members

INSERT INTO Member VALUES (1, 'Zachariah', '22120765@student.ciu.edu.tr', '+2347061614885', '2025-10-07');
INSERT INTO Member VALUES (2, 'Sultan', '22305640@student.ciu.edu.tr', '+77052175021', '2025-09-07');
INSERT INTO Member VALUES (3, 'Josh', 'josh@student.ciu.edu.tr', '+9000000000', '2025-08-01');
INSERT INTO Member VALUES (4, 'Joel', 'joel@student.ciu.edu.tr', '+904444444446', '2024-07-15');
-- Insert staff members
INSERT INTO Staff VALUES (1, 'Jacob Bush', 'Assistant');
INSERT INTO Staff VALUES (2, 'Aline Koj', 'Librarian');
INSERT INTO Staff VALUES (3, 'Mark Koop', 'Supervisor');
INSERT INTO Staff VALUES (4, 'Jil Umar', 'Manager');

-- Borrow
INSERT INTO Borrow VALUES (1, 1, 1, 1, '2025-03-01', '2025-03-15', '2025-03-20');
INSERT INTO Borrow VALUES (2, 2, 2, 2, '2025-03-05', '2025-03-19', '2025-03-18');
INSERT INTO Borrow VALUES (3, 3, 3, 3, '2025-03-10', '2025-03-24', NULL);
INSERT INTO Borrow VALUES (4, 4, 4, 4, '2025-03-12', '2025-03-26', '2025-03-30');
INSERT INTO Borrow VALUES (5, 1, 6, 2, '2025-02-01', '2025-02-15', '2025-02-14');

-- Insert fines
INSERT INTO Fine VALUES (1, 1, 5.00, 'UNPAID');
INSERT INTO Fine VALUES (2, 4, 7.00, 'PAID');
INSERT INTO Fine VALUES (3, 3, 3.50, 'UNPAID');
