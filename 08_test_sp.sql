-- Ejecutar el procedimiento (por ejemplo, cliente 1 compra 2 libros)
CALL CreateOrderSimple(1, 1, 2, 3, 1);

-- Verificar inventario
SELECT * FROM Books;

-- Ver resumen de pedidos
SELECT * FROM vw_OrderSummary;

-- Ver total gastado por cliente
SELECT fn_TotalSpentByCustomer(1) AS TotalGastado;