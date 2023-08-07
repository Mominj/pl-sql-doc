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

 
