--RoomUuendamine 
SQL Server
create trigger roomUuendamine
on room
for update
as
insert into logi(kuupaev,andmed,kasutaja)
select getdate(),
concat('Vanad toad ',deleted.number,', ',deleted.name,', ',deleted.status,', ',deleted.smoke,', ',rt1.description,
' Uued toad ',inserted.number,', ',inserted.name,', ',inserted.status,', ',inserted.smoke,', ',rt2.description),
user
from deleted
inner join inserted on deleted.roomID=inserted.roomID
inner join room_type  rt1 on deleted.room_type_id =rt1.room_typeID
inner join room_type  rt2 on inserted.room_type_id =rt2.room_typeID
--kontroll
select * from room;
update room set room_type_id=2
where number='123';
select * from room;
select * from logi;
---------------------
XAMPP
insert into logi(kuupaev,andmed,kasutaja)
select now(),
concat('Vanad andmed ',old.number,', ',old.name,', ',old.status,', ',old.smoke,', ',rt1.description,
' Uued andmed ',new.number,', ',new.name,', ',new.status,', ',new.smoke,', ',rt2.description),
user()
from room r
inner join room_type rt1 on old.room_type_id=rt1.room_typeID
inner join room_type rt2 on new.room_type_id=rt2.room_typeID
where r.roomID=new.roomID
