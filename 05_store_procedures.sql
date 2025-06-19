DELIMITER $$

CREATE PROCEDURE CreateOrderSimple (
    IN p_CustomerID INT,
    IN p_Book1 INT,
    IN p_Qty1 INT,
    IN p_Book2 INT,
    IN p_Qty2 INT
)
BEGIN
    DECLARE v_order_id INT;

    START TRANSACTION;

    INSERT INTO Orders (CustomerID)
    VALUES (p_CustomerID);

    SET v_order_id = LAST_INSERT_ID();

    INSERT INTO OrderLines (OrderID, BookID, Quantity, UnitPrice)
    SELECT v_order_id, BookID, p_Qty1, Price FROM Books WHERE BookID = p_Book1;

    INSERT INTO OrderLines (OrderID, BookID, Quantity, UnitPrice)
    SELECT v_order_id, BookID, p_Qty2, Price FROM Books WHERE BookID = p_Book2;

    COMMIT;
END$$

DELIMITER ;
