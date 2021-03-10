/*
Q1
A manager at JustLee Books requests a list of the titles of all books generating a profit of at least
$10.00. The manager wants the results listed in descending order, based on each book’s profit.
*/

SELECT
    title,
    retail - COST profit
FROM
    books
WHERE
    retail - COST >= 10
ORDER BY
    profit DESC;

/*
Q2
A customer service representative is trying to identify all books in the Computer or Family Life
category and published by Publisher 1 or Publisher 3. However, the results shouldn’t include any
book selling for less than $45.00.
*/ 

SELECT
      *
  FROM
      books
  WHERE
      category IN ( 'COMPUTER', 'FAMILY LIFE' )
      AND pubid IN ( 1, 3 )
      AND retail >= 45;

/*
Q3
Identify the authors of the books Becca Nelson ordered. List the author names and book titles.
Perform the search by using the customer name. Use WHERE clause to join the tables.
*/ 

SELECT
      au.LNAME,
      au.FNAME,
      b.title
  FROM
      author      au,
      books       b,
      orderitems  oi,
      orders      od,
      bookauthor  ba
  WHERE
          b.isbn = oi.isbn
      AND oi.order# = od.order#
      AND od.customer# = (
          SELECT
              c.customer#
          FROM
              customers c
          WHERE
                  c.firstname = 'BECCA'
              AND c.lastname = 'NELSON'
      )
      AND au.authorid = ba.authorid;

/*
Q4
List all the books written by an author with the last name Adams. Perform the search using the
author name
*/

SELECT
    b.*
FROM
    books       b,
    bookauthor  ba,
    author      a
WHERE
        b.isbn = ba.isbn
    AND ba.authorid = a.authorid
    AND a.lname = 'ADAMS';

/*
Q5
Display a list of all books in the BOOKS table. If a book has been ordered by a customer, also list the
corresponding order number and the state in which the customer resides
*/

SELECT
    B.*,
    O.ORDER#,
    C.STATE
FROM
    BOOKS       B
    LEFT OUTER JOIN ORDERITEMS  OI ON B.ISBN = OI.ISBN
    LEFT OUTER JOIN ORDERS      O ON O.ORDER# = OI.ORDER#
    LEFT OUTER JOIN CUSTOMERS   C ON C.CUSTOMER# = O.CUSTOMER#;

/*
Q6
The marketing department of JustLee Books is analyzing books that don’t sell. A list of ISBNs for all
books with no sales recorded is needed. Use a set operator to complete this task.
*/

SELECT
    B.ISBN
FROM
    BOOKS B
MINUS
SELECT
    OI.ISBN
FROM
    ORDERITEMS OI;

/*
q7 
Produce a list of all customer names in which the first letter of the first and last names is in
uppercase and the rest are in lowercase.
*/ 

SELECT
    INITCAP(firstname),
    INITCAP(lastname)
FROM
    CUSTOMERS;
    
