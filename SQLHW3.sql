--HomeWork 3 in Micrososft Server Management Studio : "Create Basic Function For NorthWind DataBase"  

CREATE FUNCTION dbo.GetOrderTotal(@ProductID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(18, 2);
    
    SELECT @Total = SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    WHERE OD.ProductID = @ProductID;
    
    RETURN @Total;
END;
