/* Database Management Assignment 2 */

-- Part I  
-- Please write SQL statements for each of the following related questions

/* 1. 
Create a new table containing these four columns: Emp#, Lastname, Firstname, and Job_class. The
table name should be EMPLOYEES. The Job_class column should be able to store character strings
up to a maximum length of four, but the column values shouldn’t be padded if the value has less
than four characters. The Emp# column contains a numeric ID and should allow a five-digit number.
Use maximum length of 12 for the Firstname and Lastname columns.
*/
CREATE TABLE EMPLOYEES (
    Emp#       NUMBER(5),
    Lastname   VARCHAR(12),
    Firstname  VARCHAR(12),
    Job_class  VARCHAR(4)
);

/* 2. 
Now that you have created the EMPLOYEES table, add two columns to the table. One column,
named EmpDate, contains the date of employment for each employee, and its default value should
be the system date. The second column, named EndDate, contains employees’ date of termination.
EndDate does not have a default value.
*/
ALTER TABLE EMPLOYEES ADD (
    EmpDate  DATE DEFAULT sysdate,
    EndDate  DATE
);

/* 3. 
Modify the Job_class column of the EMPLOYEES table so that it allows a maximum width of two
characters.
*/
ALTER TABLE EMPLOYEES MODIFY (
    Job_class VARCHAR(2)
);

/*4.
Delete the EndDate column from the EMPLOYEES table.
*/
ALTER TABLE EMPLOYEES DROP COLUMN EndDate;

/*5.
Create a new table JL_EMPS by using a subquery from EMPLOYEES; copy three columns, Emp#,
Lastname, and Firstname from EMPLOYEES.
*/
CREATE TABLE JL_EMPS
    AS
        ( SELECT
            Emp#,
            Lastname,
            Firstname
        FROM
            EMPLOYEES
        );

/*6.
TRUNCATE the JL_EMPS table, and then verify that the table still exists but no longer contains any
data.
*/
TRUNCATE TABLE JL_EMPS;

SELECT
    *
FROM
    JL_EMPS; 

/*7.
Delete the JL_EMPS table permanently so that it isn’t moved to the recycle bin.
*/
DROP TABLE JL_EMPS PURGE; 

/*8.
Delete the EMPLOYEES table so that it can be restored. 
*/
DROP TABLE EMPLOYEES; 

/*9.
Restore the EMPLOYEES table
*/
FLASHBACK TABLE EMPLOYEES TO BEFORE DROP; 


-- Part II 

/*1.
Create the CATEGORY table and populate it with the given data. Provide a screenshot of the
query.
*/
CREATE TABLE CATEGORY (
    CATCODE  VARCHAR2(3),
    CATDESC  VARCHAR2(11) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY ( CATCODE )
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'BUS',
    'BUSINESS'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'CHN',
    'CHILDREN'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'COK',
    'COOKING'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'COM',
    'COMPUTER'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'FAL',
    'FAMILY LIFE'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'FIT',
    'FITNESS'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'SEH',
    'SELF HELP'
);

INSERT INTO CATEGORY (
    CATCODE,
    CATDESC
) VALUES (
    'LIT',
    'LITERATURE'
);

SELECT
    *
FROM
    CATEGORY;

/*2.
Add a column to the BOOKS table called Catcode.
*/
ALTER TABLE BOOKS ADD (
    Catcode VARCHAR2(3)
);

/*3.
Add a FOREIGN KEY constraint that requires all category codes entered in the BOOKS table to
already exist in the CATEGORY table. Set the Catcode values for the existing rows in the BOOKS
table, based on each book’s current Category value.
*/
ALTER TABLE BOOKS ADD (
    CONSTRAINT category_fk FOREIGN KEY ( Catcode )
        REFERENCES CATEGORY ( CATCODE )
);

UPDATE BOOKS B
SET
    B.CATCODE = (
        SELECT
            CATCODE
        FROM
            CATEGORY
        WHERE
            CATDESC = B.CATEGORY
    );

/*4.
Verify that the correct categories have been assigned in the BOOKS table. Provide a screenshot
of the query.
*/
SELECT
    *
FROM
    BOOKS;

SELECT
    *
FROM
    CATEGORY;

/*5.
Delete the Category column from the BOOKS table. 
*/
ALTER TABLE BOOKS DROP COLUMN CATEGORY;