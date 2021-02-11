SELECT
    *
FROM
    user_tables;

--DECLARE
--    t VARCHAR2(100) := 'acctmanager_test';
--BEGIN
--    EXECUTE IMMEDIATE 'DROP TABLE '
--                      || upper(t)
--                      || ' CASCADE CONSTRAINTS';
--EXCEPTION
--    WHEN OTHERS THEN
--        IF SQLCODE != -942 THEN
--            RAISE;
--        END IF;
--END;
DROP TABLE acctmanager_test CASCADE CONSTRAINTS;

CREATE TABLE acctmanager_test (
    amid     CHAR(4),
    amfirst  VARCHAR2(12),
    amlast   VARCHAR2(12),
    amedate  DATE DEFAULT sysdate,
    amsal    NUMBER(8, 2),
    amcomm   NUMBER(7, 2) DEFAULT 0,
        amearn AS ( amsal + amcomm ),
    region   CHAR(2)
);

SELECT
    *
FROM
    user_tables;