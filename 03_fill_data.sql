-- 1. Clientes
INSERT INTO Customers (FullName, Email) VALUES
('Ana Torres',  'ana@example.com'),
('Luis García', 'luis@example.com'),
('María López', 'maria@example.com');

-- 2. Libros
INSERT INTO Books (Title, Author, Price, StockQty) VALUES
('Clean Code',               'Robert C. Martin',  39.99, 50),
('The Pragmatic Programmer', 'Hunt & Thomas',     45.50, 40),
('Design Patterns',          'GoF',               59.00, 30),
('Refactoring',              'Martin Fowler',     49.00, 20),
('Soft Skills',              'John Sonmez',       35.00, 25);

-- 3. Pedidos (aseguramos que los CustomerIDs ya existen)
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, NOW()),  -- Pedido de Ana
(2, NOW()),  -- Pedido de Luis
(3, NOW());  -- Pedido de María

-- 4. Líneas de pedido (aseguramos que OrderID y BookID existen)
INSERT INTO OrderLines (OrderID, BookID, Quantity, UnitPrice) VALUES
-- Pedido 1 (Ana)
(1, 1, 2, 39.99),   -- 2 Clean Code
(1, 3, 1, 59.00),   -- 1 Design Patterns

-- Pedido 2 (Luis)
(2, 2, 1, 45.50),   -- 1 The Pragmatic Programmer
(2, 4, 1, 49.00),   -- 1 Refactoring

-- Pedido 3 (María)
(3, 5, 2, 35.00);   -- 2 Soft Skills
