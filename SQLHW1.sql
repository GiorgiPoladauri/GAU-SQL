-- Step 1: Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATE
);

-- Step 2: Create Books table with a foreign key linking to Authors
CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100),
    Genre NVARCHAR(50),
    Price DECIMAL(10, 2),
    PublishDate DATE,
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Step 3: Stored procedure to add a new author
CREATE PROCEDURE AddAuthor
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @BirthDate DATE
AS
BEGIN
    INSERT INTO Authors (FirstName, LastName, BirthDate)
    VALUES (@FirstName, @LastName, @BirthDate);
END;

-- Step 4: Stored procedure to add a new book
CREATE PROCEDURE AddBook
    @Title NVARCHAR(100),
    @Genre NVARCHAR(50),
    @Price DECIMAL(10, 2),
    @PublishDate DATE,
    @AuthorID INT
AS
BEGIN
    INSERT INTO Books (Title, Genre, Price, PublishDate, AuthorID)
    VALUES (@Title, @Genre, @Price, @PublishDate, @AuthorID);
END;

-- Step 5: Stored procedure to get books by a specific author
CREATE PROCEDURE GetBooksByAuthor
    @AuthorID INT
AS
BEGIN
    SELECT Title, Genre, Price, PublishDate
    FROM Books
    WHERE AuthorID = @AuthorID;
END;

-- Step 6: Stored procedure to update the price of a specific book
CREATE PROCEDURE UpdateBookPrice
    @BookID INT,
    @NewPrice DECIMAL(10, 2)
AS
BEGIN
    UPDATE Books
    SET Price = @NewPrice
    WHERE BookID = @BookID;
END;
