SELECT
    customer_id,
    line_item_id
FROM
    orders
    INNER JOIN order_item ON orders.order_id = order_item.order_id;