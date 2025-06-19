DELIMITER $$

CREATE FUNCTION fn_TotalSpentByCustomer(p_CustomerID INT)
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(18,2);

    SELECT SUM(ol.Quantity * ol.UnitPrice)
    INTO total
    FROM Orders o
    JOIN OrderLines ol ON o.OrderID = ol.OrderID
    WHERE o.CustomerID = p_CustomerID;

    RETURN IFNULL(total, 0);
END$$

DELIMITER ;
