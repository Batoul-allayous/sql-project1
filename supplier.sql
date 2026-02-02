use [database supliersystem];
CREATE TABLE Product ( Product_id INT PRIMARY KEY, Product_Name VARCHAR(50),Price DECIMAL(10,2));
CREATE TABLE Customer ( Customer_id INT PRIMARY KEY, Customer_Name VARCHAR(50));
CREATE TABLE OrderTable ( Customer_id INT ,Product_id INT , Order_Date DATE,FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id),
FOREIGN KEY (Product_id) REFERENCES Product (Product_id));
CREATE TABLE Supplier ( Supplier_id INT PRIMARY KEY,Supplier_name VARCHAR(50));
INSERT INTO Product VALUES (1, 'IPAD', 1500),(2, 'IPHONE', 2500),(3, 'MS OFFICE 2020', 1600),(4, 'COLOR PRINTER',1800);
INSERT INTO Customer VALUES (1, 'Muhammad'),(2, 'Samer'),(3, 'Amer'),(4, 'Mustafa');
INSERT INTO OrderTable VALUES (1, 1, '2018-01-01'),(2, 2, '2020-02-01'),(3, 3, '2022-04-02'),(4, 4, '2020-03-23');
INSERT INTO Supplier VALUES (10, 'HP'),(20, 'IBM'),(30, 'APPLE'),(40, 'MICROSOFT');
Select  Supplier_name , Product_name , Price From Supplier,Product Where Supplier.Supplier_id = Product.Supplier_id;

SELECT c.Customer_Name, p.Product_Name, o.Order_Date FROM Customer c
JOIN OrderTable o ON c.Customer_id = o.Customer_id
JOIN Product p ON o.Product_id = p.Product_id;

SELECT c.Customer_Name, p.Product_Name, p.Price FROM Customer c
JOIN OrderTable o ON c.Customer_id = o.Customer_id
JOIN Product p ON o.Product_id = p.Product_id;

SELECT o.Order_Date, c.Customer_Name, p.Product_Name, p.Price FROM OrderTable o
JOIN Customer c ON o.Customer_id = c.Customer_id
JOIN Product p ON o.Product_id = p.Product_id;
ALTER TABLE Product ADD Supplier_id INT;
ALTER TABLE Product ADD CONSTRAINT fk_supplier FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id);

SELECT p.Product_Name, s.Supplier_name FROM Product p
LEFT JOIN Supplier s ON p.Supplier_id = s.Supplier_id;

-- ??? ??? IPAD ??????? APPLE
UPDATE Product SET Supplier_id = 30 WHERE Product_Name = 'IPAD';

-- ??? ??? IPHONE ??????? APPLE
UPDATE Product SET Supplier_id = 30 WHERE Product_Name = 'IPHONE';

-- ??? MS OFFICE 2020 ??????? MICROSOFT
UPDATE Product SET Supplier_id = 40 WHERE Product_Name = 'MS OFFICE 2020';

-- ??? COLOR PRINTER ??????? HP
UPDATE Product SET Supplier_id = 10 WHERE Product_Name = 'COLOR PRINTER';

SELECT c.Customer_Name, p.Product_Name, s.Supplier_name FROM Customer c
LEFT JOIN OrderTable o ON c.Customer_id = o.Customer_id
LEFT JOIN Product p ON o.Product_id = p.Product_id
LEFT JOIN Supplier s ON p.Supplier_id = s.Supplier_id
WHERE s.Supplier_name = 'APPLE' OR s.Supplier_name IS NULL; 


SELECT c.Customer_Name, p.Product_Name, s.Supplier_name FROM Customer c
JOIN OrderTable o ON c.Customer_id = o.Customer_id
JOIN Product p ON o.Product_id = p.Product_id
JOIN Supplier s ON p.Supplier_id = s.Supplier_id
WHERE s.Supplier_name = 'APPLE';


SELECT c.Customer_Name, COUNT(o.Product_id) AS OrdersCount FROM Customer c
JOIN OrderTable o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_Name;


SELECT c.Customer_Name, p.Product_Name, s.Supplier_name
FROM Customer c
RIGHT JOIN OrderTable o ON c.Customer_id = o.Customer_id
RIGHT JOIN Product p ON o.Product_id = p.Product_id
RIGHT JOIN Supplier s ON p.Supplier_id = s.Supplier_id
WHERE s.Supplier_name = 'APPLE';


SELECT c.Customer_Name, p.Product_Name, s.Supplier_name
FROM Customer c
FULL JOIN OrderTable o ON c.Customer_id = o.Customer_id
FULL JOIN Product p ON o.Product_id = p.Product_id
FULL JOIN Supplier s ON p.Supplier_id = s.Supplier_id
WHERE s.Supplier_name = 'APPLE' OR s.Supplier_name IS NULL;

SELECT p.Product_Name, s.Supplier_name
FROM Product p
CROSS JOIN Supplier s;

SELECT c.Customer_Name, p.Product_Name
FROM Customer c
CROSS JOIN Product p;

SELECT c.Customer_Name, p.Product_Name, s.Supplier_name
FROM Customer c
CROSS JOIN Product p
CROSS JOIN Supplier s
WHERE p.Supplier_id = s.Supplier_id;





