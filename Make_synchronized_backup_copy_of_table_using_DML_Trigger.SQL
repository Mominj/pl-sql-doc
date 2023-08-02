DESC superheros;
create table  superheros_backup as SELECT * FROM superheros WHERE 1=2;
DESC superheros_backup;


CREATE OR REPLACE TRIGGER superheroes_backup
BEFORE INSERT OR UPDATE OR DELETE ON superheros
FOR EACH ROW
ENABLE
DECLARE
BEGIN
	IF INSERTING THEN
        INSERT INTO superheros_backup(sh_name)
        VALUES(:NEW.sh_name);
    ELSIF UPDATING THEN
        UPDATE superheros_backup SET sh_name = :NEW.sh_name WHERE sh_name = :OLD.sh_name;
    ELSIF DELETING THEN
        DELETE FROM superheros_backup WHERE sh_name = :OLD.sh_name;
	END IF;
END;


select * from superheros;
SELECT * FROM superheros_backup;
insert into superheros(sh_name) values('TEST1');
UPDATE superheros SET sh_name = 'TEST11' WHERE sh_name = 'TEST1';
DELETE FROM superheros WHERE sh_name = 'TEST11';