DECLARE
   v_count number := 1;
BEGIN
     loop
    DBMS_OUTPUT.PUT_LINE(v_count);
    v_count := v_count + 1;
    IF v_count > 10 then
    exit;
    end if;

    end loop;

END;



// while loop

DECLARE
   v_count number := 1;
BEGIN
    while v_count < 10  loop
    DBMS_OUTPUT.PUT_LINE(v_count);
    v_count := v_count + 1;
    end loop;

END;

// for loop


DECLARE
   v_count number := 10;
BEGIN
    for i in 1 .. v_count   loop
        DBMS_OUTPUT.PUT_LINE(i);
    end loop;

END;

