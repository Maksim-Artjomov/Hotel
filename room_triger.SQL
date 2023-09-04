create trigger room_lisamine
on room
for insert
as
insert into logi(kuupaev,kasutaja,andmed,tegevus)
select getdate(),user,
concat(inserted.number, ', ', inserted.name, ', ',inserted.status, ', ',inserted.smoke),
'room on lisatud'
from inserted
--kontroll
insert into room(number,name,status,smoke)
values('1','small','busy',2);
select * from room;
select * from logi
