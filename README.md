# Moja_Kebab_Database
![image](https://user-images.githubusercontent.com/120745808/228325402-939fa720-8cac-4ece-ae75-cb5234bcc3d8.png)

## Project Description:
The Kebab Restaurant Management System is designed to manage the various aspects of a kebab restaurant, including managing orders, inventory, employees, and customer data. The system will use different database concepts such as relations many-to-many, one-to-many, integrity constraints, referential integrity, cascading actions, date and time data types, binary large objects, domains, indexes, users, privileges, and roles to ensure efficient management of the kebab restaurant.
## About Our Database
The database includes tables for customers, orders, menu items, inventory, and employees.

### Relations
![image](https://user-images.githubusercontent.com/120745808/228569152-600915ef-4e36-49a8-934b-7e6a420725c5.png)


### Tables
- **Customers**: This table stores information about the restaurant’s customers, including their name, email, phone number, and address.
- **Orders**: This table stores information about customer orders, including the date and time of the order and the total cost.
An index has also been created on the OrderDate column of the Orders table to improve query performance.
- **CustomerOrders**: This table links customers to their orders.
- **MenuItems**: This table stores information about the restaurant’s menu items, including their name, description, price, and an image (bytea).
- **OrderItems**: This table links orders to the menu items that were ordered and the quantity of each item.
- **Inventory**: This table stores information about the restaurant’s inventory of menu items, including the quantity of each item and the date it was purchased.
- **Employees**: This table stores information about the restaurant’s employees, including their name, email, phone number, and address.

### Roles
- **administrator**: This role has the LOGIN attribute, which allows it to log in to the database. It also has the SUPERUSER attribute, which gives it all privileges. Additionally, it has the CREATEDB and CREATEROLE attributes, which allow it to create new databases and roles. The role also has the REPLICATION attribute, which allows it to perform replication tasks. The password for this role is encrypted using the SCRAM-SHA-256 algorithm.

- **employee**: This role also has the LOGIN attribute, which allows it to log in to the database. However, it does not have the SUPERUSER, CREATEDB, or CREATEROLE attributes, so it cannot perform tasks that require those privileges. The password for this role is also encrypted using the SCRAM-SHA-256 algorithm.

### Some example data
~~~
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address)
VALUES ('Maria', 'Garcia', 'maria.garcia@gmail.com', 654321987, 'Calle Mayor, 3'),
('Juan', 'Martinez', 'juan.martinez@hotmail.com', 678954321, 'Plaza del Sol, 5'),
('Luis', 'Sanchez', 'luis.sanchez@yahoo.com', 656565656, 'Avenida de la Libertad, 10');

INSERT INTO Orders (CustomerID, OrderDate, OrderTime, TotalCost)
VALUES (1, '2023-03-28', '18:30:00', 15.50),
(2, '2023-03-29', '12:00:00', 20.00),
(3, '2023-03-29', '20:00:00', 12.75);

INSERT INTO CustomerOrders (CustomerID, OrderID)
VALUES (1, 1),
(2, 2),
(3, 3);

INSERT INTO MenuItems (ItemName, ItemDescription, ItemPrice, Image)
VALUES ('Kebab de pollo', 'Delicioso kebab de pollo con lechuga y tomate', 6.50, NULL),
('Kebab de ternera', 'Sabroso kebab de ternera con cebolla y pimiento', 7.50, NULL),
('Kebab mixto', 'Exquisito kebab mixto con pollo y ternera', 8.50, NULL);

INSERT INTO OrderItems (OrderID, ItemID, Quantity)
VALUES (1, 1, 2),
(2, 2, 1),
(3, 3, 3);

INSERT INTO Inventory (ItemID, ItemQuantity, PurchaseDate)
VALUES (1, 50, '2023-03-01'),
(2, 30, '2023-03-15'),
(3, 20, '2023-03-20');

INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, Address)
VALUES ('Pedro', 'Gonzalez', 'pedro.gonzalez@kebab.es', 612345678, 'Calle Mayor, 5'),
('Ana', 'Martinez', 'ana.martinez@kebab.es', 654987321, 'Avenida de la Libertad, 15');
~~~


