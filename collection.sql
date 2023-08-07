https://www.tutorialspoint.com/plsql/plsql_collections.htm

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
   
     A nested table is like a one-dimensional array with an arbitrary number of elements. However, a nested table differs from an array in the following aspects −

     An array has a declared number of elements, but a nested table does not. The size of a nested table can increase dynamically.

	 An array is always dense, i.e., it always has consecutive subscripts. A nested array is de
   
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


		DECLARE
		  TYPE table_type IS VARRAY(5) OF NUMBER(10);
		  v_tab  table_type;
		  v_idx  NUMBER;
		BEGIN
		  -- Initialise the collection with two values.
		  v_tab := table_type(1, 2);

		  -- Extend the collection with extra values.
		  << load_loop >>
		  FOR i IN 3 .. 5 LOOP
			v_tab.extend;
			v_tab(v_tab.last) := i;
		  END LOOP load_loop;
		  
		  -- Can't delete from a VARRAY.
		  -- v_tab.DELETE(3);

		  -- Traverse collection
		  v_idx := v_tab.FIRST;
		  << display_loop >>
		  WHILE v_idx IS NOT NULL LOOP
			DBMS_OUTPUT.PUT_LINE('The number ' || v_tab(v_idx));
			v_idx := v_tab.NEXT(v_idx);
		  END LOOP display_loop;
		END;

















	 Associative arrays :
		- Associative ARRAY  are non - persistent collection
		- they can not be resued
		- avilable in pl/sql block for the session
    

		DECLARE 
		   TYPE salary IS TABLE OF NUMBER INDEX BY VARCHAR2(20); 
		   salary_list salary; 
		   name   VARCHAR2(20); 
		BEGIN 
		   -- adding elements to the table 
		   salary_list('Rajnish') := 62000; 
		   salary_list('Minakshi') := 75000; 
		   salary_list('Martin') := 100000; 
		   salary_list('James') := 78000;  
		   
		   -- printing the table 
		   name := salary_list.FIRST; 
		   WHILE name IS NOT null LOOP 
			  dbms_output.put_line 
			  ('Salary of ' || name || ' is ' || TO_CHAR(salary_list(name))); 
			  name := salary_list.NEXT(name); 
		   END LOOP; 
		END; 
































CREATE OR REPLACE PACKAGE pkg_Test IS
       PROCEDURE SP_PRINT_DEAL;
       TYPE DEAL_IDS IS TABLE OF VARCHAR2(30); 
       my_deals_ids DEAL_IDS :=  DEAL_IDS();

       TYPE deal_Details IS RECORD(
         SECURITY_CODE TB_FIS_DEAL.SECURITY_CODE%TYPE,
         DEAL_ID TB_FIS_DEAL.DEAL_ID%TYPE,
         DEAL_FLOW TB_FIS_DEAL.DEAL_FLOW%TYPE
      );
      CURSOR cur_Deal_Info is
      SELECT DEAL_ID FROM TB_FIS_DEAL;
      
      Deal_info_log cur_Deal_Info%rowtype;
      Deal_details_log deal_Details;
END pkg_Test;















CREATE OR REPLACE PACKAGE BODY pkg_Test IS
       PROCEDURE SP_PRINT_DEAL IS
         BEGIN
           
      
           
              FOR L_IDX IN cur_Deal_Info
              LOOP
              -- DBMS_OUTPUT.PUT_LINE(L_IDX.DEAL_ID);
                my_deals_ids.extend();
                my_deals_ids( my_deals_ids.count ) := L_IDX.DEAL_ID;
             END LOOP;




            -- INSERT INTO DEAL_TEST(DEAL_ID,SECURITY_CODE,DEAL_FLOW)
            --   VALUES(Deal_details_log.DEAL_ID, Deal_details_log.SECURITY_CODE,Deal_details_log.DEAL_FLOW);
            
             IF my_deals_ids.COUNT > 0
              THEN
                  FOR indx IN my_deals_ids.FIRST .. my_deals_ids.LAST
               LOOP
                  DBMS_OUTPUT.PUT_LINE(my_deals_ids(indx));
               END LOOP;
             END IF;

             DBMS_OUTPUT.PUT_LINE('INSERT DATA INTO DEAL TEST SUCCESSFULLY ');
         END SP_PRINT_DEAL;

END pkg_Test;

 
