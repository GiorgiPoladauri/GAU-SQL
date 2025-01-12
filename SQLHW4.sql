--My HomeWork for DataBases-2, for same base provided in last Homeworks, just added transactions(5)...2025/1/12

BEGIN TRANSACTION;
INSERT INTO Members (FirstName, LastName, DateOfBirth, MembershipDate)
VALUES ('John', 'Doe', '1990-05-10', GETDATE());
COMMIT;

BEGIN TRANSACTION;
DECLARE @MemberID INT;
SELECT @MemberID = MemberID
FROM Members
WHERE FirstName = 'John' AND LastName = 'Doe';
IF @MemberID IS NOT NULL
BEGIN
    INSERT INTO BorrowingRecords (MemberID, BookID, BorrowDate)
    VALUES (@MemberID, 1, GETDATE());
    COMMIT;
END
ELSE
BEGIN
    PRINT 'Member not found';
    ROLLBACK;
END;

BEGIN TRANSACTION;
UPDATE Books
SET Genre = 'Science Fiction'
WHERE BookID = 2;
COMMIT;

BEGIN TRANSACTION;
DELETE FROM BorrowingRecords
WHERE RecordID = 3;
COMMIT;

BEGIN TRANSACTION;
UPDATE Members
SET MembershipDate = GETDATE()
WHERE MemberID = 2;
COMMIT;
