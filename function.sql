PL/SQL Functions : A self contained sub program that is meant to 
do some specific well defined task.

Functions are named PL/SQL Block which means they can be stored into the database
as a database object and can be reused.

TYPES of subroutings or say sub programs
	1.PL/SQL Functions and
	2. PL/SQL Procedures

PL/SQL Functions Syntax :


	CREATR [OR REPLACE] FUNCTION function_name
	(parameter 1, parameter 2, ....) return data_type
	IS
        DECLARE VARIABLE,CONSTANT ETC.
	BEGIN
	    Executable statements
	    return (return value);
	END;


//  Function create

CREATE OR REPLACE FUNCTION circle_area(redius number)
RETURN NUMBER IS

    PI CONSTANT NUMBER (7,4) := 3.1416;
    area NUMBER(7,3);
BEGIN
    area := pi * (redius * redius) ;
    return area;
END;



//  function call

DECLARE
    v_area NUMBER(7,3);
BEGIN
    v_area := circle_area(3);
    DBMS_OUTPUT.PUT_LINE(v_area);
END;