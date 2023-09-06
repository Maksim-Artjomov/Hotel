create trigger guestl_uuendamine
on guest
for update
as
insert into logi(kuupaev,kasutaja,andmed,tegevus)
select getdate(),user,
concat('vanad - ',
deleted.first_name,
', ',
deleted.last_name,
', ',
deleted.member_since,
' uued - ',
inserted.first_name,
', ',
inserted.last_name,
', ',
inserted.member_since),
'guest on uuendatud'
from deleted inner join inserted
on deleted.id=inserted.id
--kontroll
select * from guest
update guest set first_name='Luca'
where id=4
select * from guest
select * from logi
--------------------------
create trigger room_uuendamine
on room
for update
as
insert into logi(kuupaev,kasutaja,andmed,tegevus)
select getdate(),user,
concat('vanad - ',
deleted.number,
', ',
deleted.name,
', ',
deleted.status,
', ',
deleted.smoke,
' uued - ',
inserted.number,
', ',
inserted.name,
', ',
inserted.status,
', ',
inserted.smoke),
'room on uuendatud'
from deleted inner join inserted
on deleted.id=inserted.id
--kontroll
select * from room
update room set smoke=1
where id=4
select * from room
select * from logi
