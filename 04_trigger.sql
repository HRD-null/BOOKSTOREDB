DELIMITER $$

CREATE TRIGGER trg_decrease_inventory
AFTER INSERT ON OrderLines
FOR EACH ROW
BEGIN
    UPDATE Books
    SET StockQty = StockQty - NEW.Quantity
    WHERE BookID = NEW.BookID;

    IF (SELECT StockQty FROM Books WHERE BookID = NEW.BookID) < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Inventario insuficiente. Operación cancelada';
    END IF;
END$$

CREATE TRIGGER trg_restore_inventory
AFTER DELETE ON OrderLines
FOR EACH ROW
BEGIN
    UPDATE Books
    SET StockQty = StockQty + OLD.Quantity
    WHERE BookID = OLD.BookID;
END$$

DELIMITER ;
