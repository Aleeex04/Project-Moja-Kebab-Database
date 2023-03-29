-- Ejemplo de datos para Customers
--Los nombres y apellidos al tener el dominio solo pueden ser de la A a la Z tanto mayusuculas como minusculas y sin acentos.
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

--Se puede insertar tambien mediante el archivo inser_BLOB.py pero en este caso sera sin imagenes.
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