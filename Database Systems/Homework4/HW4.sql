CREATE TABLE product (
    product_id NUMBER PRIMARY KEY,
    prod_name VARCHAR2(60 CHAR),
    prod_description VARCHAR2(350 CHAR),
    price NUMBER(12,2)
);

INSERT INTO product VALUES (
    1,
    'Camembers Pierrot',
    'a soft, creamy, surface-ripened cow''s milk cheese',
    38.35
);

INSERT INTO product (
    product_id,
    prod_name,
    price
) VALUES (
    2,
    'Carnarvon Tiger',
    62.78
);

COMMIT;

-- A
ALTER TABLE product MODIFY (
    prod_name VARCHAR2(15 CHAR)
);
-- Will be an error as Camembers Pierrot is 17 chars
-- i.e. longer than 15 CHAR
-- Running Result: Error report -
-- ORA-01441: cannot decrease column length because some value is too big

-- B
ALTER TABLE product MODIFY (
    prod_name VARCHAR2(20 CHAR)
);
-- This will work okay as we have no row
-- longer than 20 char
-- Running Result: Table PRODUCT altered.

-- C
ALTER TABLE product MODIFY (
    price NUMBER(10, 2)
);
-- Not allowed to decrease precision as we have inserted values.
-- Running Result: 
-- ORA-01440: column to be modified must be empty to decrease precision or scale

-- D 
ALTER TABLE product MODIFY (
    price NUMBER(10,4)
);
-- Same as C
-- Running Result: 
-- ORA-01440: column to be modified must be empty to decrease precision or scale

-- E
ALTER TABLE product MODIFY
    price NUMBER(14, 2);
-- Syntax is acceptable and
-- Running result: Table PRODUCT altered.
-- Apparently, you can increase precision and scale
-- But you cannot decrease, unless the column is empty

-- F
ALTER TABLE product MODIFY
    prod_description VARCHAR2(50 CHAR) NOT NULL;
-- Again, shorthand syntax but
-- Running result:
-- ORA-02296: cannot enable (USERNAME.) - null values found
-- As we said, we can modify like this only if
-- we have a default clause specified, which is missing here
-- hence the error

-- G
ALTER TABLE product MODIFY
    prod_description VARCHAR2(80 CHAR) DEFAULT 'description to be updated' NOT NULL;
-- As we have default specified, this would have worked fine
-- if the table was empty or we didn't have null in this column
-- BUT, Running result:
-- cannot enable (USERNAME.) - null values found
-- *Cause:    an alter table enable constraint failed because the table
--            contains values that do not satisfy the constraint.
-- This happens, because product with id 2 has null description
