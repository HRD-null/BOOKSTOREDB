CREATE OR REPLACE VIEW vw_OrderSummary AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.FullName AS Cliente,
    SUM(ol.Quantity * ol.UnitPrice) AS MontoTotal
FROM Orders o
JOIN Customers c ON c.CustomerID = o.CustomerID
JOIN OrderLines ol ON ol.OrderID = o.OrderID
GROUP BY o.OrderID, o.OrderDate, c.FullName;