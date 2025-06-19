-- Clientes
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName   VARCHAR(100) NOT NULL,
    Email      VARCHAR(120) NOT NULL UNIQUE,
    JoinDate   DATETIME DEFAULT NOW()
);

-- Libros
CREATE TABLE Books (
    BookID    INT AUTO_INCREMENT PRIMARY KEY,
    Title     VARCHAR(150) NOT NULL,
    Author    VARCHAR(100) NOT NULL,
    Price     DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    StockQty  INT NOT NULL CHECK (StockQty >= 0)
);

-- Pedidos (encabezado)
CREATE TABLE Orders (
    OrderID    INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate  DATETIME DEFAULT NOW(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Detalle del pedido
CREATE TABLE OrderLines (
    OrderLineID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID     INT NOT NULL,
    BookID      INT NOT NULL,
    Quantity    INT NOT NULL CHECK (Quantity > 0),
    UnitPrice   DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (BookID)  REFERENCES Books(BookID)
);