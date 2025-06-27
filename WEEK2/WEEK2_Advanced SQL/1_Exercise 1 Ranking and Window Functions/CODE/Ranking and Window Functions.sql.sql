-- Creating the Products table
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Inserting sample data with ties in Electronics category
INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics', 80000),
(2, 'Phone A', 'Electronics', 60000),
(3, 'Phone B', 'Electronics', 60000),
(4, 'Headphones', 'Electronics', 2000),
(5, 'Blender', 'Home Appliances', 3000),
(6, 'Microwave', 'Home Appliances', 8000),
(7, 'Fridge', 'Home Appliances', 25000),
(8, 'Washing Machine', 'Home Appliances', 18000),
(9, 'Sofa', 'Furniture', 15000),
(10, 'Table', 'Furniture', 5000),
(11, 'Chair', 'Furniture', 2500);

-- Using ROW_NUMBER() to find top 3 expensive products per category
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
) AS ranked
WHERE RowNum <= 3;

-- Using RANK() to find top 3 expensive products per category with ties
SELECT * FROM (
    SELECT *, RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankNum
    FROM Products
) AS ranked
WHERE RankNum <= 3;

-- Using DENSE_RANK() to find top 3 expensive products per category with ties (no skipped ranks)
SELECT * FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRank
    FROM Products
) AS ranked
WHERE DenseRank <= 3;
