create table sh_audit(
    new_name varchar2(30),
    old_name varchar2(30),
    user_name varchar2(30),
    entry_date varchar2(30),
    operation varchar2(30)
);



CREATE OR REPLACE TRIGGER superheroes_audit
BEFORE INSERT OR UPDATE OR DELETE ON superheros
FOR EACH ROW
ENABLE
DECLARE
    v_user varchar(30);
	v_date varchar(30);
BEGIN
    SELECT users, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') INTO v_user,v_date from dual;
	DBMS_OUTPUT.PUT_LINE(v_date || '   ' || v_user);
	IF INSERTING THEN
        INSERT INTO sh_audit(new_name, old_name, user_name, entry_date, operation)
        VALUES(:NEW.sh_name, NULL, v_user, v_date, 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO sh_audit(new_name, old_name, user_name, entry_date, operation)
        VALUES(:NEW.sh_name,:OLD.sh_name, v_user, v_date, 'update');
    ELSIF DELETING THEN
        INSERT INTO sh_audit(new_name, old_name, user_name, entry_date, operation)
        VALUES(:NEW.sh_name, :OLD.sh_name, v_user, v_date, 'DELETE');
	END IF;
END;




select * from sh_audit;
insert into superheros(sh_name) values('superman');
update superheros set sh_name='BATMAN' WHERE sh_name = 'superman';
delete from superheros where sh_name = 'BATMAN';






