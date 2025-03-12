
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;




CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS Contact_Mech (
    contact_mech_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    street_address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NULL,
    email VARCHAR(100) NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);


CREATE TABLE IF NOT EXISTS Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    color VARCHAR(30) NULL,
    size VARCHAR(10) NULL
);


CREATE TABLE IF NOT EXISTS Order_Header (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    shipping_contact_mech_id INT NOT NULL,
    billing_contact_mech_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (shipping_contact_mech_id) REFERENCES Contact_Mech(contact_mech_id),
    FOREIGN KEY (billing_contact_mech_id) REFERENCES Contact_Mech(contact_mech_id)
);


CREATE TABLE IF NOT EXISTS Order_Item (
    order_item_seq_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Order_Header(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);




INSERT INTO Customer (first_name, last_name)
VALUES ('John', 'Doe'),
       ('Jane', 'Smith');


INSERT INTO Contact_Mech (customer_id, street_address, city, state, postal_code, phone_number, email)
VALUES (1, '1600 Amphitheatre Parkway', 'Mountain View', 'CA', '94043', '(650) 253-0000', 'john.doe@example.com'),
       (1, '1 Infinite Loop', 'Cupertino', 'CA', '95014', '(408) 996-1010', 'john.doe@work.com');


INSERT INTO Contact_Mech (customer_id, street_address, city, state, postal_code, phone_number, email)
VALUES (2, '350 Fifth Avenue', 'New York', 'NY', '10118', '(212) 736-3100', 'jane.smith@example.com');


INSERT INTO Product (product_name, color, size)
VALUES ('T-Shirt', 'Red', 'M'),
       ('Jeans', 'Blue', '32'),
       ('Sneakers', 'White', '9'),
       ('Jacket', 'Black', 'L'),
       ('Hat', 'Green', 'One Size');

