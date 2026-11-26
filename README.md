# Database Design and Normalization

This repository contains SQL exercises in relational database design and normalization. The examples show how keys and well-structured tables reduce repeated data and support integrity.

## Contents

The `answers.sql` file begins with three queries using employee, office, product, product-line, customer, and order tables. These require a MySQL schema containing those tables, such as Classic Models. The file then presents two normalization tasks.

### Question 1: First Normal Form

The original `ProductDetail` example puts several names in one `Products` value, making individual products harder to query and update. `ProductDetail_1NF` stores one product per row with its order number and customer. Its composite primary key, `(OrderID, Product)`, identifies each product within an order. The inserts convert the three sample orders into six rows, with no comma-separated lists.

### Question 2: Second Normal Form

The `OrderDetails` example uses `(OrderID, Product)` as its composite key, but `CustomerName` depends only on `OrderID`. This is a partial dependency. The solution stores order-level data in `Orders_2NF` and products with their quantities in `OrderItems_2NF`. `OrderID` is the orders table's primary key and the items table's foreign key. The item table retains `(OrderID, Product)` as its primary key, so a product appears at most once per order. Inserts preserve the supplied quantities.

Together, the examples show how normalization changes table structure without losing the original facts. The first removes repeating groups; the second removes a dependency on only part of a composite key. These are foundational steps toward reducing update anomalies and keeping related records consistent.

## Running the SQL

Open `answers.sql` in MySQL Workbench or another MySQL client. Select a database with the expected source tables before running the introductory queries. The normalization statements create separate example tables and do not require Classic Models. Run each `CREATE TABLE` before its inserts. Create `Orders_2NF` before `OrderItems_2NF` because of the foreign key.

The examples are for learning and omit cleanup statements. A second run in the same schema will fail if these tables already exist; use a fresh practice schema or remove them first. Comments in `answers.sql` mark each question and its statements.
