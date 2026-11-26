

-- Question 1: Employee details and their office code
SELECT
	employees.firstName,
	employees.lastName,
	employees.email,
	employees.officeCode
FROM employees
INNER JOIN offices
	ON employees.officeCode = offices.officeCode;

-- Question 2: Products and their product line
SELECT
	products.productName,
	products.productVendor,
	products.productLine
FROM products
LEFT JOIN productlines
	ON products.productLine = productlines.productLine;

-- Question 3: First 10 orders and their customer numbers
SELECT
	orders.orderDate,
	orders.shippedDate,
	orders.status,
	orders.customerNumber
FROM customers
RIGHT JOIN orders
	ON customers.customerNumber = orders.customerNumber
ORDER BY orders.orderNumber
LIMIT 10;

-- Normalization Assignment

-- Question 1: Achieving First Normal Form (1NF)
-- Each row contains exactly one product for an order.
CREATE TABLE ProductDetail_1NF (
	OrderID INT NOT NULL,
	CustomerName VARCHAR(100) NOT NULL,
	Product VARCHAR(100) NOT NULL,
	PRIMARY KEY (OrderID, Product)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
	(101, 'John Doe', 'Laptop'),
	(101, 'John Doe', 'Mouse'),
	(102, 'Jane Smith', 'Tablet'),
	(102, 'Jane Smith', 'Keyboard'),
	(102, 'Jane Smith', 'Mouse'),
	(103, 'Emily Clark', 'Phone');

-- Question 2: Achieving Second Normal Form (2NF)
-- Partial dependency: CustomerName depends on OrderID, not on the full
-- composite key (OrderID, Product). Store it once per order instead.
CREATE TABLE Orders_2NF (
	OrderID INT NOT NULL,
	CustomerName VARCHAR(100) NOT NULL,
	PRIMARY KEY (OrderID)
);

CREATE TABLE OrderItems_2NF (
	OrderID INT NOT NULL,
	Product VARCHAR(100) NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (OrderID, Product),
	CONSTRAINT fk_orderitems_2nf_order
		FOREIGN KEY (OrderID) REFERENCES Orders_2NF (OrderID)
);

INSERT INTO Orders_2NF (OrderID, CustomerName) VALUES
	(101, 'John Doe'),
	(102, 'Jane Smith'),
	(103, 'Emily Clark');

INSERT INTO OrderItems_2NF (OrderID, Product, Quantity) VALUES
	(101, 'Laptop', 2),
	(101, 'Mouse', 1),
	(102, 'Tablet', 3),
	(102, 'Keyboard', 1),
	(102, 'Mouse', 2),
	(103, 'Phone', 1);