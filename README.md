# Moja_Kebab_Database
![image](https://user-images.githubusercontent.com/120745808/228325402-939fa720-8cac-4ece-ae75-cb5234bcc3d8.png)

## Project Description:
The Kebab Restaurant Management System is designed to manage the various aspects of a kebab restaurant, including managing orders, inventory, employees, and customer data. The system will use different database concepts such as integrity constraints, referential integrity, cascading actions, date and time data types, binary large objects, domains, indexes, users, privileges, and roles to ensure efficient management of the kebab restaurant.
## About Our Database
The database includes tables for customers, orders, menu items, inventory, and employees.

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

