CREATE TABLE Customers (
   CustomerID INT PRIMARY KEY IDENTITY,
   CustomerName NVARCHAR(100) NOT NULL,
   Email NVARCHAR(255) UNIQUE NOT NULL,
   DateJoined DATE DEFAULT GETDATE()
);

CREATE TABLE Orders (
   OrderID INT PRIMARY KEY IDENTITY,
   OrderDate DATE DEFAULT GETDATE(),
   Amount DECIMAL(10,2),
   CustomerID INT,
   FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE PROCEDURE Procedure1
   @NameOfCompany NVARCHAR(40),
   @Email NVARCHAR(255)
AS
BEGIN
   INSERT INTO Customers (CustomerName, Email)
   VALUES (@NameOfCompany, @Email)
END;

EXEC Procedure1 @NameOfCompany = 'GeoLab', @Email = 'name.surname@Geolab.edu.ge';
