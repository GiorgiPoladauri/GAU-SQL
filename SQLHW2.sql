--GPoladauri made this database for DB-2 subject at GAU...

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'LibraryManagement')
BEGIN
    CREATE DATABASE LibraryManagement;
END;

GO
USE LibraryManagement;
GO

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Genre NVARCHAR(50),
    PublishedYear INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    DateOfBirth DATE,
    MembershipDate DATE
);

CREATE TABLE BorrowingRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Country NVARCHAR(50)
);

CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

GO

CREATE PROCEDURE AddBorrowingRecord
    @MemberID INT,
    @BookID INT,
    @BorrowDate DATE
AS
BEGIN
    INSERT INTO BorrowingRecords (MemberID, BookID, BorrowDate)
    VALUES (@MemberID, @BookID, @BorrowDate);
END;
GO

CREATE PROCEDURE ReturnBook
    @RecordID INT,
    @ReturnDate DATE
AS
BEGIN
    UPDATE BorrowingRecords
    SET ReturnDate = @ReturnDate
    WHERE RecordID = @RecordID;
END;
GO

CREATE VIEW BorrowedBooksByMember AS
SELECT 
    Members.FirstName, 
    Members.LastName, 
    Books.Title AS BookTitle, 
    BorrowingRecords.BorrowDate, 
    BorrowingRecords.ReturnDate
FROM BorrowingRecords
INNER JOIN Members ON BorrowingRecords.MemberID = Members.MemberID
INNER JOIN Books ON BorrowingRecords.BookID = Books.BookID;
GO

CREATE VIEW BooksAndAuthors AS
SELECT 
    Books.Title AS BookTitle, 
    Authors.Name AS AuthorName
FROM BookAuthors
INNER JOIN Books ON BookAuthors.BookID = Books.BookID
INNER JOIN Authors ON BookAuthors.AuthorID = Authors.AuthorID;
GO

CREATE FUNCTION TotalBooksBorrowed(@MemberID INT)
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) 
            FROM BorrowingRecords 
            WHERE MemberID = @MemberID);
END;
GO

CREATE FUNCTION GetMemberAge(@MemberID INT)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, 
                    (SELECT DateOfBirth FROM Members WHERE MemberID = @MemberID), 
                    GETDATE());
END;
GO

INSERT INTO Authors (Name, Country) VALUES ('J.K. Rowling', 'UK');
INSERT INTO Authors (Name, Country) VALUES ('George R.R. Martin', 'USA');

INSERT INTO Books (Title, Genre, PublishedYear) VALUES ('Harry Potter', 'Fantasy', 1997);
INSERT INTO Books (Title, Genre, PublishedYear) VALUES ('Game of Thrones', 'Fantasy', 1996);

INSERT INTO Members (FirstName, LastName, DateOfBirth, MembershipDate) 
VALUES ('Alice', 'Smith', '1990-02-15', '2024-01-01');

INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 1);
INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 2);

EXEC AddBorrowingRecord @MemberID = 1, @BookID = 1, @BorrowDate = '2024-11-27';
GO
