create table trainer(
    full_name varchar(20)
);

create table subject;(
    subject_name varchar(20)
);



create view vw_Momin as
select full_name, subject_name from trainer, subject;

insert into vw_Momin values('Momin', 'java');

SELECT * FROM vw_Momin;  




CREATE OR REPLACE TRIGGER tr_io_insert
INSTEAD OF INSERT ON vw_Momin
FOR EACH ROW
BEGIN
INSERT INTO trainer(full_name) values(:new.full_name);
INSERT INTO subject(subject_name) values(:new.subject_name);
END;

select * from trainer;
select * from subject;