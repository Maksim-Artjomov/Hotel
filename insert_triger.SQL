create trigger guestl_lisamine
on guest
for insert
as
insert into logi(kuupaev,kasutaja,andmed,tegevus)
select getdate(),user,
concat(inserted.first_name, ', ', inserted.last_name, ', ',inserted.member_since),
'guest on lisatud'
from inserted
--kontroll
insert into guest(first_name,last_name,member_since)
values('Maksim','Artjomiov','2023-02-18');
select * from guest;
select * from logi
