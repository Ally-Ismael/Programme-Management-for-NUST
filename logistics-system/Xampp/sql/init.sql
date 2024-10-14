CREATE DATABASE logisticsDB;
USE logisticsDB;
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    contact_number VARCHAR(15)
);
CREATE TABLE shipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    type VARCHAR(50),
    pickup_location VARCHAR(255),
    delivery_location VARCHAR(255),
    preferred_time_slot VARCHAR(100),
    status VARCHAR(50)
);
