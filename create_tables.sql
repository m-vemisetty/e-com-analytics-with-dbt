
CREATE OR REPLACE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name STRING,
    last_name STRING,
    email STRING,
    created_at DATE
);

CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status STRING
);

CREATE OR REPLACE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name STRING,
    quantity INT,
    price FLOAT
);

CREATE OR REPLACE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method STRING,
    amount FLOAT,
    payment_date DATE
);
