/* Week 2 Class 
  Feb 4, 2021 */

SELECT table_name
FROM user_tables;    -- data dictionary that contains all table information in the database

SELECT *             -- to query all columns
FROM customers;

SELECT title, pubdate   -- use comma to separate column names
FROM books;

SELECT title AS "Title_of_Books!"    -- column alias: 'AS' is optional
FROM books;

SELECT title, retail, cost, retail-cost AS profit
FROM books;

SELECT title, retail,  discount, retail-discount AS sales_price
FROM books;

SELECT title, retail,  discount, retail-NVL(discount, 0) AS sales_price    -- no need to know NVL right now
FROM books;

SELECT DISTINCT state  --- supress duplicates
FROM customers;

SELECT UNIQUE category
FROM books;

SELECT firstname, lastname, firstname || ' ' || lastname "Customer Name"   -- concatenation
FROM customers;

DESCRIBE customers;

select * 
from customers
WHERE rownum < 2;

desc acctmanager_test;

CREATE TABLE acctmanager_test1
(amid CHAR(4),
 amfirst VARCHAR2(12),
 amlast VARCHAR2(12),
 amedate DATE DEFAULT SYSDATE,
 amsal NUMBER(8,2),
 amcomm NUMBER(7,2) DEFAULT 0, --- 7: total digits 99999.99  (2 means the number of digits on the right side of decimal point)
 amearn AS (amsal + amcomm),
 region CHAR(2)
 );
 
 DESCRIBE acctmanager_test;
 
 SELECT column_name, data_type, data_default
 FROM user_tab_columns
 WHERE table_name = 'ACCTMANAGER_TEST';
 
 CREATE TABLE test_invis
 (col1 CHAR(1),
  col2 NUMBER(4) invisible
  );
 
 DESC acctmanager_test;
  
 SELECT *               --- col2 does not show up since it's a hidden column
 FROM test_invis;
 
 SELECT col1, col2      -- when you specify the hidden column name, it's displayed in the result
 FROM test_invis;
 
 
 
 
 



