/* Week4 DBM Class (Feb. 18, 2021) */

-- Create constraints with table creation on the table level
CREATE TABLE dept               -- create parent tables first (DEPT and ETYPES are parent tables to EQUIP table)
(deptid NUMBER(2),
 dname VARCHAR2(20) NOT NULL,                                       -- requirement #2 (slide 4.32)
 fax VARCHAR2(12),
 CONSTRAINT dept_deptid_pk PRIMARY KEY (deptid),
 CONSTRAINT dept_dname_uk UNIQUE (dname));                          -- requirement #1

CREATE TABLE etypes
(etypeid NUMBER(2),
 etypename VARCHAR2(30) NOT NULL,                                   -- requirement #4
 CONSTRAINT etypes_etypeid_pk PRIMARY KEY (etypeid),
 CONSTRAINT etypes_etypename_uk UNIQUE (etypename));                -- requirement #3   

CREATE TABLE equip
(equipid NUMBER(3),
 edesc VARCHAR2(30),
 purchdate DATE,
 rating CHAR(1),
 deptid NUMBER(2) NOT NULL,
 etypeid NUMBER(2),
 CONSTRAINT equip_equipid_pk PRIMARY KEY (equipid),         
 CONSTRAINT equip_deptid_fk FOREIGN KEY (deptid)                    -- requirement #5
    REFERENCES dept (deptid),
 CONSTRAINT equip_etypeid_fk FOREIGN KEY (etypeid)                  -- requirement #6
    REFERENCES etypes (etypeid),
 CONSTRAINT equip_rating_ck CHECK (rating IN ('A', 'B', 'C')));     -- requirement #7
 
-- We may disable constraints to reduce checking processing time for batch job
ALTER TABLE equip
DISABLE CONSTRAINT equip_rating_ck;

ALTER TABLE equip
ENABLE CONSTRAINT equip_rating_ck;      -- enable the disabled constraint after the work


SELECT constraint_name, column_name
FROM user_cons_columns                  -- data dictionary that contains conatraint information
WHERE table_name = 'EQUIP';

ALTER TABLE equip
DROP CONSTRAINT equip_rating_ck;        -- remove constraint

ALTER TABLE dept
DROP PRIMARY KEY;                       -- remove PRIMARY KEY constraint (will get an error message because DEPT's primary key is referenced by its child table EQUIP

ALTER TABLE dept
DROP PRIMARY KEY CASCADE;               -- we can remove Parent table's PRIMARY KEY constraint by using CASCADE (it drops child table's FOREIGN KEY constraint)

DESCRIBE books;

INSERT INTO acctmanager
VALUES ('T500', 'NICK', 'TAYLOR', '05-SEP-20', 42000, 3500, 'NE');

INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
VALUES ('J500', 'Sammie', 'Jones', 39500, 2000, 'NW');

SELECT *
FROM acctmanager;

DELETE FROM acctmanager
WHERE amid = 'J500';

INSERT INTO acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
VALUES ('J500', 'SAMMIE', 'JONES', DEFAULT, 39500, 2000, 'NW');     -- DEFAULT keyword makes sure a default value be entered to the corresponding column

INSERT INTO acctmanager
VALUES ('L500', 'MANDY', 'LOPEZ', '01-OCT-20',47000, 1500, NULL);   -- NULL value (absence of value) will be entered to REGION column

ALTER TABLE acctmanager
MODIFY (amsal DEFAULT ON NULL 0);           -- since NULL can override default value, having DEFAULT ON NULL prevents the overriding

UPDATE acctmanager
SET amedate = '01-AUG-20'
WHERE amid = 'J500';                    -- this update applies to account manager id = J500 only.

INSERT INTO acctmanager (amid, amfirst, amlast, amedate, amsal, amcomm, region)
VALUES ('J500', 'SAMMIE', 'JONES', NULL, NULL, 2000, 'NW');

ALTER TABLE acctmanager
ADD (amearn AS (amsal + amcomm));       -- add a virtual column

DESC acctmanager;

INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
VALUES ('D500', 'SCOTT', 'DAVIS', 53000, 6000, 'SE');

INSERT INTO acctmanager (amid, amfirst, amlast, amsal, amcomm, region)
VALUES ('M500', 'PEG', 'O''HARA', 46000, 2000, 'SW');       -- need double single quotes to make sure O'HARA is entered

INSERT INTO acctbonus (amid, amsal, region)
SELECT amid, amsal, region                     -- Insert data by subquery.  We don't need parentheses and AS unlike CREATE TABLE's subquery
    FROM acctmanager;

SELECT * FROM acctbonus;    

UPDATE acctmanager
SET amsal = 39500
WHERE amid = 'J500';

SELECT *
FROM acctmanager;

UPDATE acctmanager
SET amedate = '10-OCT-20',
    region = 'S'
WHERE amid = 'L500';    

UPDATE customers
SET region = '&Region'          -- by using substitution variable, we can update data interactively
WHERE state = '&State';








 
  




