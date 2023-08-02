DECLARE
   v_count number := 11;
BEGIN
    IF v_count > 10 then
    DBMS_OUTPUT.PUT_LINE('IT IS GREATER THAN 10');
    ELSE 
     DBMS_OUTPUT.PUT_LINE('IT IS LESS THAN 10');
    END IF;
END;


// ELSE ID


DECLARE
   v_count number := 9;
BEGIN
    IF v_count > 10 then
    DBMS_OUTPUT.PUT_LINE('IT IS GREATER THAN 10');
    ELSIF  v_count = 1 THEN
     DBMS_OUTPUT.PUT_LINE('IT IS LESS THAN 10');
    END IF;
END;
