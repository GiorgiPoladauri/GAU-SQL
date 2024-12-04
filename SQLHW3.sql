--HomeWork 3 in Micrososft Server Management Studio : "Create Basic Function For NorthWind DataBase"  

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
