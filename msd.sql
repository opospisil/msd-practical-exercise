CREATE TABLE Orders (
  OrderID INTEGER PRIMARY KEY,
  CustomerID INTEGER,
  EmployeeID INTEGER,
  OrderDate TEXT,
  ShipperID INTEGER
);

INSERT INTO Orders (OrderID, CustomerID,	EmployeeID,	OrderDate,	ShipperID)
VALUES
(10308,	2,	7,	"1996-09-18",	3),
(10309,	37,	3,	"1996-09-19",	1),
(10310,	77,	8,	"1996-09-20",	2);

CREATE TABLE Customers (
  CustomerID INTEGER PRIMARY KEY,
  CustomerName TEXT,
  ContactName TEXT,
  Address TEXT,
  City TEXT,
  PostalCode INTEGER,
  Country TEXT
);

INSERT INTO Customers (CustomerID,	CustomerName,	ContactName,	Address,	City,	PostalCode,	Country)
VALUES
(1,	"Alfred Futterkiste",	"Maria Anders",	"Obere Str. 57",	"Berlin",	12209,	"Germany"),
(2,	"Ana Trujillo Emparedados y helados",	"Ana Trujillo", "Avda. de la Constitución 2222",	"México D.F.",	05021, "Mexico"),
(3,	"Antonio Moreno Taquería",	"Antonio Moreno",	"Mataderos 2312",	"México D.F.",	05023,	"Mexico");

SELECT Customers.CustomerName, Customers.Country, COUNT(Orders.CustomerID) as o_count
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;