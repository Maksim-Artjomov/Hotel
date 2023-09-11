--RoomLisamine SQL Server
create trigger roomLisamine
on room
for insert
as
insert into logi(kuupaev, andmed, kasutaja)
select getdate(), 
concat(inserted.number,', ',inserted.name,', ',inserted.status,', ',inserted.smoke,', ',rt.description), 
user
from inserted
inner join room_type rt on inserted.room_type_id = rt.room_typeID;
--kontroll
insert into room(number,name,status,smoke,room_type_id)
values('123','Small','Free',0, 1);
select * from room;
select * from logi;
----------------
XAMPP
insert into logi(kuupaev,andmed,kasutaja)
select now(),
concat('Uued andmed -',new.number,', ',new.name,', ',new.status,', ',new.smoke,', ',rt.description),
user()
from room r
inner join room_type rt
on r.room_type_id=rt.room_typeID
where r.roomID=new.roomID
