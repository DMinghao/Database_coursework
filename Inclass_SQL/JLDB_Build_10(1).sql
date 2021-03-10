CREATE TABLE suppliers
  (sup_name VARCHAR2(20),
   description VARCHAR2(100) );
INSERT INTO suppliers
  VALUES ('Second Hand Reads', 
         'wholesaler of used books only, located in Chicago, 634.555-8787');
INSERT INTO suppliers
  VALUES ('Leftovers', 
     'Physical store location, located in Seattle, willing to fill referred sales, sales@leftovers.com');
INSERT INTO suppliers
  VALUES ('Read Again', 
 'Chain of used book store fronts, seeking online sales partner, located in western U.S., 919-555-3333');
INSERT INTO suppliers
  VALUES ('Bind Savers', 'Used book wholsaler, stock includes international titles, 402-555-2323');
INSERT INTO suppliers
  VALUES ('Book Recyclers', 'Used book chain, located in Canada, large volume of sales, 888.555.5204');
INSERT INTO suppliers
  VALUES ('Page Shock', 'Book wholsaler for specialty books and graphic novels, help@pageshock.com');
INSERT INTO suppliers
  VALUES ('RePage', 'Used book vendor, only wholesales, Wash D.C., 555-0122');
COMMIT;
CREATE TABLE contacts
  (name VARCHAR2(40));
INSERT INTO contacts
  VALUES('LaFodant,Mike,934-555-3493');
INSERT INTO contacts
  VALUES('Harris,Annette,727-555-2739');
INSERT INTO contacts
  VALUES('Crew,Ben,352-555-3638');
COMMIT;

DROP TABLE Employees PURGE;
CREATE TABLE Employees (
 EMPNO               NUMBER(4),
 LNAME               VARCHAR2(20),
 FNAME               VARCHAR2(15),
 JOB                 VARCHAR2(9),
 HIREDATE            DATE,
 DEPTNO              NUMBER(2) NOT NULL,
 MTHSAL                 NUMBER(7,2),
 MGR                 NUMBER(4),
 CONSTRAINT employees_empno_PK PRIMARY KEY (EMPNO));
INSERT INTO employees VALUES (7839,'KING','BEN', 'GTECH2',TO_DATE('17-NOV-01','DD-MON-YY'),10,6000,NULL);
INSERT INTO employees VALUES (8888,'JONES','LARRY','MTech2',TO_DATE('17-NOV-08','DD-MON-YY'),10,4200,7839);
INSERT INTO employees VALUES (7344,'SMITH','SAM','GTech1',TO_DATE('17-NOV-05','DD-MON-YY'),20,4900,7839);
INSERT INTO employees VALUES (7355,'POTTS','JIM','GTech1',TO_DATE('17-NOV-05','DD-MON-YY'),20,4900,7839);
INSERT INTO employees VALUES (8844,'STUART','SUE','MTech1',TO_DATE('17-NOV-08','DD-MON-YY'),10,3700,8888);
COMMIT;
ALTER TABLE employees ADD (region CHAR(2));
