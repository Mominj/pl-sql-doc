Packages :  Packages are logical groups of related PL/SQL object.
	-> packages are named pl/sql blocks
	-> permanently stored into the database schema
	-> can be referienced or reused by program
What all can we include in a package ?
A package can hold multiple database objects such as
    - Stored Procesures
    - PL/SQL Functions
    - Database Cursors
    - Type declarations
    - Variables

Pacjkage Architecture 
    - The package specification (header) : In this section we put the declaration
       of all the package elements. whatever elements we declare here in this section
       are publically available and can be referenced outside of the
       package.
       this is decliartion part
       syntax : 
	CREATE OR REPLACE PACKAGE pkg_name IS
	    declaration of all the package element ...;
        END pkg_name;
    - the package body : we provide the actual structure to all
       the package elements.
       A package body conatains the inplementation of the elemets
       listed in the package specification.
       coded in the package body is called private package elemets
       sysntax of package body
       

	CREATE OR REPLACE BODY pkg_name IS
            variable declaration;
	    Type declaration;
	BEGIN
	    implementation of all the package element 
	END pkg_name;




















CREATE OR REPLACE PACKAGE pkg_Momin IS
    FUNCTION print_String RETURN VARCHAR2;
    PROCEDURE proc_Emp(f_name VARCHAR2, l_name VARCHAR2, salary NUMBER, age NUMBER);
END pkg_Momin;




CREATE OR REPLACE PACKAGE BODY pkg_Momin IS
    FUNCTION print_String RETURN VARCHAR2 IS
        BEGIN
            RETURN 'FUNCTION Print String';
        END print_String ;
    
    PROCEDURE proc_Emp(f_name VARCHAR2, l_name VARCHAR2, salary NUMBER, age NUMBER) IS
        BEGIN
            INSERT INTO employees
            Values(4,f_name, l_name, salary, age);
        END;
END pkg_Momin ;






BEGIN
    DBMS_OUTPUT.PUT_LINE(pkg_Momin.print_String );
END;

BEGIN
    pkg_Momin.proc_Emp('Sagor', 'sarkar', 100000, 26);
END;

