create table superheroes(
    sh_name varchar2(20)
);
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE INSERT ON superheroes
FOR EACH ROW
ENABLE
DECLARE
	v_user varchar2(20);
BEGIN
	SELECT user into v_user from dual
END;

insert into superheroes(sh_name)
values('Bird Man');






CREATE OR REPLACE TRIGGER bi_superheroes
BEFORE UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
	v_user varchar2(20);
BEGIN
	SELECT users into v_user from dual;
	DBMS_OUTPUT.PUT_LINE('I update  ' || v_user);
END;

UPDATE superheroes
SET sh_name  = 'Momin'
WHERE sh_name = 'Anderson';






CREATE OR REPLACE TRIGGER tr_superheroes
BEFORE INSERT OR DELETE OR UPDATE ON superheros
FOR EACH ROW
ENABLE
DECLARE
	v_user varchar(20);
BEGIN
    SELECT users into v_user FROM dual;
	IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('one row inserted by ' || v_user);
	ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('one row DELETED by ' || v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('one row UPDATING by ' || v_user);
	END IF;
END;


INSERT INTO superheros values('batman');
update  superheros set sh_name = 'MOMIN' WHERE sh_name = 'batman'
delete   from superheros  WHERE sh_name = 'MOMIN'