-- PostgreSQL Database Schema for POS System  

-- Table for users  
CREATE TABLE users (  
    id SERIAL PRIMARY KEY,  
    username VARCHAR(50) UNIQUE NOT NULL,  
    email VARCHAR(100) UNIQUE NOT NULL,  
    password_hash VARCHAR(255) NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

-- Table for products  
CREATE TABLE products (  
    id SERIAL PRIMARY KEY,  
    name VARCHAR(100) NOT NULL,  
    description TEXT,  
    price DECIMAL(10, 2) NOT NULL,  
    stock_quantity INT NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

-- Table for invoices  
CREATE TABLE invoices (  
    id SERIAL PRIMARY KEY,  
    user_id INT REFERENCES users(id),  
    total DECIMAL(10, 2) NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

-- Table for stock receipts  
CREATE TABLE stock_receipts (  
    id SERIAL PRIMARY KEY,  
    product_id INT REFERENCES products(id),  
    quantity_received INT NOT NULL,  
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  

-- Table for delivery notes  
CREATE TABLE delivery_notes (  
    id SERIAL PRIMARY KEY,  
    invoice_id INT REFERENCES invoices(id),  
    delivery_date TIMESTAMP NOT NULL,  
    notes TEXT  
);  
