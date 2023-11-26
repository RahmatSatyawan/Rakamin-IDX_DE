CREATE PROCEDURE summary_order_status
(@StatusID int) 
AS
BEGIN
	SELECT
		f.OrderID,
		c.CustomerName,
		p.ProductName,
		f.Quantity,
		s.StatusOrder
	FROM FactSalesOrder AS f
	JOIN DimCustomer c ON f.CustomerID = c.CustomerID
	JOIN DimProduct p ON f.ProductID = p.ProductID
	JOIN DimStatusOrder s ON f.StatusID = s.StatusID
	WHERE s.StatusID = @StatusID
END


EXEC summary_order_status @StatusID = 2