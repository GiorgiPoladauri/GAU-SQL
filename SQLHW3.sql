--HomeWork 3 in Micrososft Server Management Studio : "Create Basic Function For NorthWind DataBase"  

--CREATE FUNCTION dbo.GetOrderTotal(@ProductID INT)
--RETURNS DECIMAL(18, 2)
--AS
--BEGIN
--    DECLARE @Total DECIMAL(18, 2);
    
--    SELECT @Total = SUM(OD.Quantity * P.Price)
--    FROM OrderDetails OD
--    INNER JOIN Products P ON OD.ProductID = P.ProductID
--    WHERE OD.ProductID = @ProductID;
    
--    RETURN @Total;
--END;

--Select dbo.GetOrderTotal(1)

--CREATE FUNCTION GetAllStudentNamesAndDaysAfterBorrow(@FullName INT)  
--RETURNS TABLE  
--AS   
--RETURN
--    SELECT 
--        m.MemberID,
--        m.FirstName, 
--        m.LastName, 
--        DATEDIFF(DAY, br.BorrowDate, GETDATE()) AS DaysAfterBorrow
--    FROM BorrowingRecords br
--    INNER JOIN Members m ON br.MemberID = m.MemberID
--    WHERE br.MemberID = @FullName;

--Select GetAllStudentNamesAndDaysAfterBorrow(1)

--CREATE FUNCTION GetStudentDetailsWithDays(@FullName INT)  
--RETURNS TABLE  
--AS   
--RETURN
--    SELECT 
--        m.FirstName, 
--        m.LastName,    
--        DATEDIFF(DAY, br.BorrowDate, GETDATE()) AS DaysAfterBorrow, 
--        br.BorrowDate,       
--        br.RecordID AS BorrowID,
--        b.BookID,          
--        b.Title AS BookTitle,
--        b.Genre AS Category 
--    FROM BorrowingRecords br
--    INNER JOIN Members m ON br.MemberID = m.MemberID
--    INNER JOIN Books b ON br.BookID = b.BookID
--    WHERE br.MemberID = @FullName;

SELECT * FROM GetStudentDetailsWithDays(1);
