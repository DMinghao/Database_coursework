/* Week 3 (Feb.12, 2021) Class */

/* create CUST_MKT table by using subquery. 
    This command copies the contents and structure of table CUSTOMERS to CUST_MKT */
CREATE TABLE cust_mkt           
AS (SELECT customer#, city, state, zip, referred, region
    FROM customers);

SELECT *                    -- check if cust_mkt looks like customers table
FROM cust_mkt;

DESCRIBE publisher;         -- DESC or DESCRIBE command shows table structure

ALTER TABLE publisher
ADD (ext3 NUMBER(4));       --- adding a new column 'ext3' to PUBLISHER table

DESCRIBE books;

ALTER TABLE books
MODIFY (retail NUMBER(5,1));   -- try to decrease the size: get an error message (5,2):999.99    (5,1):9999.9, (5) 99999

-- Let's check whether DEFAULT changes existing values
DESC publisher;

SELECT *
FROM publisher;

ALTER TABLE publisher           
ADD (rating CHAR(1));           -- create a new column to PUBLISHER table. The new column 'rating' is empty now.

ALTER TABLE publisher
MODIFY (rating DEFAULT 'N');    -- 'N' is a character value (assume N or Y values will be entered)
                                -- after setting a default value, null values in RATING column did not change to 'N'


--- modify the size of a column
DESC acctmanager;

ALTER TABLE acctmanager
MODIFY (amlast VARCHAR2(18));   -- increase the column size from 12 to 18

ALTER TABLE publisher
DROP COLUMN ext3;               -- remove the column 'ext3' from table 'publisher'

RENAME cust_mkt TO cust_mkt1;   -- rename table 'cust_mkt' to 'cust_mkt1'

SELECT *
FROM cust_mkt;    -- error

SELECT *
FROM cust_mkt1;

TRUNCATE TABLE cust_mkt1;     -- delete all rows and retain the table structure (free up storage sapce)

DROP TABLE cust_mkt1;           -- remove table cust_mkt1

SELECT object_name, original_name
FROM recyclebin;

FLASHBACK TABLE cust_mkt1       -- recover table CUST_MKT1 from recycle bin
TO BEFORE DROP;

PURGE TABLE "BIN$uxFL+FUsInfgUwEAAH92Dw==$0";   -- removes the table object from recyclebin (must use object name)

DESC customers1;

CREATE TABLE customers1                 -- copy customers table
AS (SELECT *
     FROM customers);

SELECT *
FROM customers1;

ALTER TABLE customers1
ADD CONSTRAINT customers1_customer#_pk PRIMARY KEY (customer#);

INSERT INTO customers1 (customer#, lastname, firstname, region)
 VALUES (1020, 'PADDY', 'JACK', 'NE');          -- get an error message since customer#=1020 exists

CREATE TABLE orderitems1
AS (SELECT *
    FROM orderitems);

SELECT *
FROM orderitems1;

ALTER TABLE orderitems1
ADD CONSTRAINT orderitems1_order#item#_pk PRIMARY KEY (order#, item#);   -- adding a composite primary key constraint


ALTER TABLE orderitems1
ADD (CONSTRAINT orderitems1_order#_fk FOREIGN KEY (order#)      -- adding two foreign key constraints at once 
     REFERENCES orders (order#),                                -- must have 'REFERENCES parenttablename (parent table's pk)'
     CONSTRAINT orderitems1_isbn_fk FOREIGN KEY(isbn)
     REFERENCES books (isbn));
    
desc orderitems1;  

SELECT *
FROM orders;

INSERT INTO orderitems1
 VALUES (1030, 1, 1059831198, 2, 30.00);
 
ALTER TABLE books
ADD CONSTRAINT books_title_uk UNIQUE (title);

SELECT *
FROM books;

INSERT INTO books (isbn, title)
 VALUES (1212121212, 'SHORTEST POEMS');
 
CREATE TABLE acctmanager1
AS (SELECT *
    FROM acctmanager);

ALTER TABLE acctmanager1
ADD CONSTRAINT acctmanager1_region_ck CHECK (region IN ('NE', 'SE', 'NW', 'SW'));   -- check constraint


SELECT *
FROM acctmanager1;

DESC acctmanager1;

INSERT INTO acctmanager1 (amid, amfirst, amlast, region)
 VALUES (0001, 'CHANGMI', 'JUNG', 'NN');       -- get an error message since 'NN' is not one of the values allowed for REGION















