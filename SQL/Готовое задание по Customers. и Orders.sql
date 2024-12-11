CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CompanyName VARCHAR(50),
    Address VARCHAR(75),
    City VARCHAR(50),
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Country) VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
('BLONP', 'Blondesddsl père et fils', '24 place Kléber', 'StrasbourgCity', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil 67', 'MadridCity', 'Spain');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    OrderSum INT
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderSum) VALUES 
(10355, 'AROUT', '1996-11-15', 10000),
(10365, 'ANTON', '1996-11-27', 15000),
(10381, 'LILAS', '1996-12-12', 20000),
(10436, 'BLONP', '1997-02-05', 17500),
(10442, 'ERNSH', '1997-02-11', 20000),
(10449, 'BLONP', '1997-02-18', 10000),
(10453, 'AROUT', '1997-02-21', 15000);

SELECT*From orders

SELECT*From customers

--Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997
SELECT C.CompanyName
FROM customers C
JOIN orders o On o.customerid = c.customerid
WHERE o.orderdate NOT BETWEEN '1996-11-15' AND '1997-02-18'
GROUP BY c.companyname;

--Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-12-12' AND '1997-02-18';

--Вывести названия компаний поставщиков, которые находятся в México D.F.;
SELECT CompanyName
FROM Customers
WHERE City = 'México D.F.';

--Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE  'An%';

--Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.
SELECT c.CompanyName, o.OrderID, o.OrderSum
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderSum>17000;

-- Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
SELECT c.CompanyName, o.OrderSum
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CompanyName DESC;

--Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
SELECT c.CompanyName, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;












