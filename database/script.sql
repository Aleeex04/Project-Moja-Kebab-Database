DROP DATABASE IF EXISTS "Kebab";

CREATE DATABASE "Kebab"
    WITH
    OWNER = alexr
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE DOMAIN PhoneNumberDomain AS NUMERIC(9) CHECK (VALUE > 99999999 AND VALUE < 1000000000);
CREATE DOMAIN NameDomain AS VARCHAR(50) CHECK (VALUE ~ '^[A-Za-z]*$');

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName NameDomain,
    LastName NameDomain,
    Email VARCHAR(50),
    PhoneNumber PhoneNumberDomain,
    Address VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    OrderDate DATE,
    OrderTime TIME,
    TotalCost NUMERIC
);

CREATE TABLE CustomerOrders (
    CustomerOrderID SERIAL PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    OrderID INTEGER REFERENCES Orders(OrderID) ON DELETE CASCADE
);

CREATE TABLE MenuItems (
    ItemID SERIAL PRIMARY KEY,
    ItemName VARCHAR(50),
    ItemDescription TEXT,
    ItemPrice NUMERIC,
    Image bytea
);

CREATE TABLE OrderItems (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INTEGER REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ItemID INTEGER REFERENCES MenuItems(ItemID) ON DELETE CASCADE ON UPDATE CASCADE,
    Quantity NUMERIC
);

CREATE TABLE Inventory (
    InventoryID SERIAL PRIMARY KEY,
    ItemID INTEGER REFERENCES MenuItems(ItemID),
    ItemQuantity NUMERIC,
    PurchaseDate DATE
);

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName NameDomain,
    LastName NameDomain,
    Email VARCHAR(50),
    PhoneNumber PhoneNumberDomain,
    Address VARCHAR(100)
);

CREATE INDEX idx_orderdate ON Orders (OrderDate);

