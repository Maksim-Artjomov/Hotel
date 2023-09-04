create trigger guestl_kustutamine
on guest
for delete
as
insert into logi(kuupaev,kasutaja,andmed,tegevus)
select getdate(),user,
concat(deleted.first_name, ', ', deleted.last_name, ', ',deleted.member_since),
'guest on deleted'
from deleted
--kontroll
delete from guest where id=1
select * from guest
select * from logi
