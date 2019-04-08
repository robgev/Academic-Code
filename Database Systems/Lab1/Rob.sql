CREATE TABLE CUSTOMER(
    customer_id NUMBER(10) PRIMARY KEY,
    fname VARCHAR2(50 char),
    lname VARCHAR2(50 char),
    date_of_birth DATE,
    salary NUMBER(10,2)
);
INSERT INTO CUSTOMER VALUES
(1, 'John', 'Smith', to_date('1998-12-20', 'YYYY-MM-DD'),1000);

CREATE TABLE ORDERS (
    order_id NUMBER(10) PRIMARY KEY,
    order_date DATE,
    order_status VARCHAR2(10 char),
    order_total NUMBER(10, 2),
    customer_id NUMBER(10) REFERENCES 
        CUSTOMER(customer_id)
);
DESCRIBE ORDERS
INSERT INTO ORDERS VALUES 
(1, to_date('2018-08-02', 'YYYY-MM-DD'), 'shipping', 3, 1);