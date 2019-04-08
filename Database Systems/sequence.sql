CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date DATE,
    customer_id NUMBER
);

CREATE TABLE order_item (
    line_item_id NUMBER PRIMARY KEY,
    order_id NUMBER
        REFERENCES orders ( order_id ),
    product NUMBER
);

CREATE SEQUENCE orders_seq;

INSERT INTO orders (
    order_id,
    order_date,
    customer_id
) VALUES (
    orders_seq.NEXTVAL,
    TO_DATE(SYSDATE),
    106
);

INSERT INTO order_item (
    order_id,
    line_item_id,
    product
) VALUES (
    orders_seq.CURRVAL,
    1,
    2359
);

INSERT INTO order_item (
    order_id,
    line_item_id,
    product
) VALUES (
    orders_seq.CURRVAL,
    2,
    6528
);

INSERT INTO order_item (
    order_id,
    line_item_id,
    product
) VALUES (
    orders_seq.CURRVAL,
    3,
    2381
);