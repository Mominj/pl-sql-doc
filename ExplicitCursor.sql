DECLARE
    v_name varchar(30);
    CURSOR cur_Momin IS
    SELECT first_name from employees
    where employee_id < 2;
BEGIN
    OPEN cur_Momin;
    LOOP
        FETCH cur_Momin into v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_Momin%NOTFOUND;
    END LOOP;
    CLOSE cur_Momin;
END;




With parameterwise cursor

DECLARE
    v_name varchar(30);
    CURSOR cur_Momin(var_r_id NUMBER ) IS
    SELECT first_name from employees
    where employee_id < var_r_id;
BEGIN
    OPEN cur_Momin(2);
    LOOP
        FETCH cur_Momin into v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_Momin%NOTFOUND;
    END LOOP;
    CLOSE cur_Momin;
END;





parameterwise cursor with default value



DECLARE
    v_name varchar(30);
    CURSOR cur_Momin(var_r_id NUMBER := 2 ) IS
    SELECT first_name from employees
    where employee_id < var_r_id;
BEGIN
    OPEN cur_Momin;
    LOOP
        FETCH cur_Momin into v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_Momin%NOTFOUND;
    END LOOP;
    CLOSE cur_Momin;
END;


DECLARE
    v_name varchar(30);
    CURSOR cur_Momin(var_r_id NUMBER := 2 ) IS
    SELECT first_name from employees
    where employee_id < var_r_id;
BEGIN
    OPEN cur_Momin(1);
    LOOP
        FETCH cur_Momin into v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur_Momin%NOTFOUND;
    END LOOP;
    CLOSE cur_Momin;
END;



Cursor FOR Loop


DECLARE
    v_name varchar(30);
    CURSOR cur_Momin IS
    SELECT first_name from employees
    where employee_id < 2;
BEGIN
    FOR L_IDX IN cur_Momin
    LOOP
        DBMS_OUTPUT.PUT_LINE(L_IDX.first_name);
    END LOOP;
END;



Cursor For Loop With Parameterized Cursor


DECLARE
    v_name varchar(30);
    CURSOR cur_Momin(var_r_id NUMBER ) IS
    SELECT first_name from employees
    where employee_id < var_r_id;
BEGIN
    FOR L_IDX IN cur_Momin(2)
    LOOP
        DBMS_OUTPUT.PUT_LINE(L_IDX.first_name);
    END LOOP;
END;