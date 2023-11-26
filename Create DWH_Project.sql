CREATE DATABASE DWH_Project;

CREATE TABLE DimCustomer (
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoHp VARCHAR(50) NOT NULL
);

CREATE TABLE DimProduct (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ProductCategory VARCHAR(255) NOT NULL,
    ProductUnitPrice INT NOT NULL
);

CREATE TABLE DimStatusOrder (
    StatusID INT NOT NULL PRIMARY KEY,
    StatusOrder VARCHAR(50) NOT NULL,
    StatusOrderDesc VARCHAR(50) NOT NULL
);

CREATE TABLE FactSalesOrder (
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    StatusID INT,
    Quantity INT NOT NULL,
    Amount INT NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
    FOREIGN KEY (StatusID) REFERENCES DimStatusOrder (StatusID)
);