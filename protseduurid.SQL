1)Andmete Lisamine ja SELECT
CREATE PROCEDURE lisaGuest
@fname varchar(100),
@lname varchar(100),
@since date
AS
BEGIN
INSERT INTO guest(first_name,last_name,member_since)
VALUES(@fname,@lname,@since);
SELECT * from guest;
SELECT * from logi;
END
--käivitamine
EXEC lisaGuest 'Maksim','Artjomov','2022-12-12'
2)Andmete kustutamine ja SELECT  
CREATE PROCEDURE guestKustutamine
@id int
AS
BEGIN
SELECT * FROM guest
DELETE FROM guest
WHERE @id=id;
SELECT * FROM guest
SELECT * from logi;
END

EXEC guestKustutamine 2
3)Update
CREATE PROCEDURE guestUuendamine
@id int,
@since date
AS
BEGIN
SELECT * FROM guest
update guest set member_since=@since
Where id=@id
SELECT * FROM guest
END

EXEC guestUuendamine 3,'2002-12-13'
