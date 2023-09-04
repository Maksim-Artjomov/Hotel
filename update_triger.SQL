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
deleted.first_name,
', ',
deleted.last_name,
', ',
deleted.member_since),
'guest on uuendatud'
from deleted inner join inserted
on deleted.id=inserted.id
--kontroll
select * from guest
update guest set first_name='Luca'
where id=4
select * from guest
select * from logi
