create table customer (
    customer_id number primary key,
    fname varchar2(45 char),
    lname varchar2(45 char)
)

create table orders(
    order_id number primary key,
    order_status varchar2(5 char),
    customer_id number references customer(customer_id)
);

create table order_item (
    line_item_id number,
    order_id number references orders(order_id),
    unit_price number(15,2),
    quantity number,
    constraint item_pk primary key (line_item_id, order_id)
);