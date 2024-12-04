--HomeWork 3 in Micrososft Server Management Studio : "Create Basic Function For (GiorgiPoladauri|Made) LibraryManagement DataBase"  

--Create Function dbo.DaysAfterBorrow(@MemberID INT)
--Returns Int
--As
--Begin
--    Declare @Days INT;

-- Select @Days = DATEDIFF(Day,BorrowDate,GetDate())
-- From BorrowingRecords OD
-- Where MemberID = @MemberID;

-- Return @Days;
--End;

--Select dbo.DaysAfterBorrow(1)

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
