Table functions are functions that produce a collection of rows (either a nested table or a varray) that can be queried 
like a physical database table. You use a table function like the name of a database table, in the FROM clause of a query.

A table function can take a collection of rows as input. An input collection parameter can be either a 
collection type or a REF CURSOR

Table functions return a collection type instance and can be queried like a table by calling the function in the FROM
 clause of a query. Table functions use the TABLE keyword.

CREATE TYPE Book_t AS OBJECT(
    name VARCHAR2(100),
    author VARCHAR2(30),
    abstract VARCHAR2(1000)
);


CREATE OR REPLACE TYPE BookSet_t AS TABLE OF Book_t;

select * from 
table (BookSet_t(Book_t('momin', 'momin', 'momin')));





CREATE OR REPLACE FUNCTION GET_DATA_AS_COL RETURN BookSet_t
AS
  DATA_S BookSet_t := BookSet_t ();
BEGIN
FOR I IN 1..3 LOOP
  DATA_S.EXTEND;
  DATA_S(DATA_S.LAST) := Book_t('SLEPPING', 'MOMIN', 'DES');
END LOOP;

RETURN DATA_S;
END;


SELECT * FROM TABLE(GET_DATA_AS_COL)


table funciton   
 table function loads all the values into collection and finally the collection would be return to caller
 
 
 

pipelined table function

pipelined funciton returns the value as and when the value is ready to send back caller 


pipelined table funciton : 

CREATE OR REPLACE FUNCTION GET_DATA_AS_COL_P RETURN BookSet_t PIPELINED
AS
  DATA_S BookSet_t := BookSet_t ();
BEGIN
FOR I IN 1..3 LOOP
  PIPE ROW(Book_t('SLEPPING', 'MOMIN', 'DES'));
--   DATA_S.EXTEND;
--   DATA_S(DATA_S.LAST) := Book_t('SLEPPING', 'MOMIN', 'DES');
END LOOP;

RETURN;
END;


SELECT * FROM GET_DATA_AS_COL_P();
 


