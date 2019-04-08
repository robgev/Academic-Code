/*
CREATE TABLE customer (
 customer_id NUMBER(10) PRIMARY KEY,
 first_name VARCHAR2(50 CHAR) NOT NULL,
 last_name VARCHAR2(50 CHAR) NOT NULL,
 cust_email VARCHAR2(50 CHAR),
 date_of_birth DATE,
 gender VARCHAR2(1 CHAR)
);

CREATE TABLE orders (
 order_id NUMBER(10) PRIMARY KEY,
 order_date DATE NOT NULL,
 order_status VARCHAR2(12 CHAR),
 order_total NUMBER(10,2) NOT NULL,
 customer_id NUMBER(10) NOT NULL REFERENCES customer (customer_id)
);

INSERT INTO customer VALUES 
(1, 'Roger', 'Federer', 'federer@gmail.com', TO_DATE('1981-08-08', 'YYYY-MM-DD'), 'M');

INSERT INTO customer (customer_id, first_name, last_name, gender) VALUES
(2, 'Serena', 'Williams', 'F');

INSERT INTO orders VALUES 
(1, TO_DATE('2018-08-12', 'YYYY-MM-DD'), NULL, 345.50, 1);

INSERT INTO orders (order_id, order_date, order_total, customer_id) VALUES 
(2, TO_DATE('2018-09-02', 'YYYY-MM-DD'), 45.65, 1);

INSERT INTO orders (order_id, order_date, order_total, customer_id) VALUES 
(3, TO_DATE('2018-09-02', 'YYYY-MM-DD'), 278.32, 2);
*/

CREATE TABLE product (
    product_id NUMBER(10) PRIMARY KEY,
    product_name VARCHAR2(50 CHAR) NOT NULL,
    product_desc VARCHAR2(150 CHAR),
    list_price NUMBER(10,2) NOT NULL,
    min_price NUMBER(10,2)
);

CREATE TABLE order_item (
    -- Explicity give not null constraint
    -- to order_id and line_item_id
    order_id NUMBER(10) NOT NULL
        REFERENCES orders ( order_id ),
    line_item_id NUMBER(10) NOT NULL,
    product_id NOT NULL
        REFERENCES product ( product_id ),
    unit_price NUMBER(10,2) NOT NULL,
    qty NUMBER(5) NOT NULL,
    CONSTRAINT order_pk PRIMARY KEY ( order_id, line_item_id )
);

INSERT INTO product VALUES 
(1, 'Tennis Racquet', 'One of the best racquets you will ever find by Wilson', 129.99, 128.75);

INSERT INTO product (product_id, product_name, list_price) VALUES
(2, 'Tennis ball', 10.94);

INSERT INTO order_item VALUES 
(1, 1, 1, 128.99, 2);

INSERT INTO order_item VALUES 
(1, 2, 2, 10.94, 8);

-- I think there was a mistake in test, and it should have
-- been September 1, 2018. Anyways,
SELECT * FROM orders WHERE
order_date > TO_DATE('2018-10-01', 'YYYY-MM-DD');