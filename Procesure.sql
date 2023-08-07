Same as function but no have return type

PL/SQL Procedure Syntax :


	CREATR [OR REPLACE] PROCEDURE function_name
	(parameter 1, parameter 2, ....) 
	IS
        DECLARE VARIABLE,CONSTANT ETC.
	BEGIN
	    Executable statements
	END;



// Stored Procedure Without Parameters

CREATE OR REPLACE  PROCEDURE pro_Momin
IS
    v_name varchar(30) := 'Momin';
    v_from varchar(30) := 'Bangladesh';
BEGIN
   DBMS_OUTPUT.PUT_LINE('HI THIS IS ' || v_name || '  from  ' || v_from );
END;


// run 
BEGIN
  pro_Momin;
END;



// Stored Procedure With Parameters
CREATE OR REPLACE  PROCEDURE emp_sal(emp_id number, emp_salary number)
IS

BEGIN
   UPDATE EMPLOYEES SET salary = emp_salary where employee_id = emp_id;
END;


// naming call
BEGIN
  emp_sal(1, 500);
END;


// notation calling

EXECUTE emp_sal(1, 500);