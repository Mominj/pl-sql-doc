DECLARE
    v_emp employees%ROWTYPE;
BEGIN
    select * into v_emp from employees where employee_id = 1;
    DBMS_OUTPUT.PUT_LINE(v_emp.last_name);
END;



//

DECLARE
    v_emp employees%ROWTYPE;
BEGIN
    select first_name, last_name into v_emp.first_name, v_emp.last_name from employees where employee_id = 1;
    DBMS_OUTPUT.PUT_LINE(v_emp.last_name || v_emp.first_name);
END;



// cursor based record datatype

DECLARE
    CURSOR cur_Momin IS
    select first_name, last_name from employees
    where employee_id = 1;

    var_emp cur_Momin%ROWTYPE;
BEGIN
    OPEN cur_Momin;
    FETCH cur_Momin INTO var_emp;
    DBMS_OUTPUT.PUT_LINE(var_emp.last_name);
    DBMS_OUTPUT.PUT_LINE(var_emp.first_name);
    CLOSE cur_Momin;
END;



//curosr based record = with multiple value

DECLARE
    CURSOR cur_Momin IS
    select first_name, last_name, salary from employees
    where employee_id < 3;

    var_emp cur_Momin%ROWTYPE;
BEGIN
    OPEN cur_Momin;
    LOOP
        FETCH cur_Momin INTO var_emp;
        EXIT WHEN cur_Momin%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(var_emp.last_name || '  ' || var_emp.salary);
    END LOOP;
    CLOSE cur_Momin;
END;


//  User Defined Record Datatype variable

DECLARE 
    TYPE rv_dept IS RECORD(
        f_name varchar(30),
        dept_name DEPARTMENT.dept_name%TYPE
    );

    var1 rv_dept;
BEGIN
    select first_name, dept_name into var1.f_name, var1.dept_name from 
     DEPARTMENT;
    
    DBMS_OUTPUT.PUT_LINE(var1.f_name);
END;


