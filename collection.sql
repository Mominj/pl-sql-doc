Collections : A Homogeneous single dimenstion data structure which is made
of elements of same datatype is called collection in oracle database.

Example : one dimenstion array

The structure of pl/sql collections consist of a cell with subscript called 
index.

Data is stored into these cells and can be identified and accessed using the index
number.

Collections are two types .
    1. Persistent : Persist collection are those which store the colleciton structure
        with the data physically into the database and can be accessed again if needed.
       type : 1. NESTED TABLE  2. VARIABLE SIZE ARRAY 
    2. Non-Persistent : Non-persistent collection only stores data and
         structure just for one session.
        TYPE : 1. Associative arrays
   

   Nested Table : 
	- Nested table are persistent collection
	- Nested tables has no upper limits on rows
   
   Syntax : DECLARE
		TYPE nested_table_name IS TABLE OF element_type [NOT NULL];




	DECLARE
	    TYPE  my_nested_table IS TABLE OF NUMBER;
 	   var_nt my_nested_table := my_nested_table(9,2,3,54);

	BEGIN
 	   DBMS_OUTPUT.PUT_LINE( var_nt(1));
	END;



	DECLARE
    	    TYPE  my_nested_table IS TABLE OF NUMBER;
   	    var_nt my_nested_table := my_nested_table(9,2,3,54);

	BEGIN
   	    FOR i IN  1..var_nt.COUNT
   	    LOOP
    	    DBMS_OUTPUT.PUT_LINE( var_nt(i));
   	    END LOOP;
	END;

  //   Nested table as Database Object

   CREATE OR REPLACE TYPE my_nested_table IS TABLE  OF VARCHAR(30);

	CREATE TABLE my_subject(
   	   sub_id NUMBER,
 	   sub_name VARCHAR(20),
 	   sub_schedule_day my_nested_table
	)NESTED TABLE sub_schedule_day STORE AS nested_tab_space ;

	desc my_subject;



	INSERT INTO my_subject(sub_id, sub_name, sub_schedule_day)
	VALUES(2, 'ENG', my_nested_table('mon', 'fri'));

	select * from my_subject;


    //   nested tables using user define datatype
	CREATE OR REPLACE TYPE object_type AS OBJECT (
  	   OBJ_ID number,
   	   OBJ_NAME VARCHAR2(10)
	);

	CREATE OR REPLACE TYPE my_nt IS TABLE OF object_type;


	CREATE TABLE base_table(
   	   tab_id NUMBER,
 	   tab_ele my_nt
 	)NESTED TABLE tab_ele STORE AS store_tab_1;












	 VARIABLE SIZE ARRAY  :
 
		- VARIABLE SIZE ARRAY  are persistent collection
	        - VARIABLE SIZE ARRAY  are bounded




















	 Associative arrays :
		- Associative ARRAY  are non - persistent collection
		- they can not be resued
		- avilable in pl/sql block for the session

failer accounting entries list 


brnNUm   ref_num   core posting status  -- I
    
1      1SB2320600004
 
