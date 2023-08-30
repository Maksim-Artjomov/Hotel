create table guest(
id int not null primary key identity (1,1),
first_name varchar(80),
last_name varchar(80) null,
member_since date)

-----------------------
create table room_type(
id int not null primary key identity (1,1),
description varchar(80),
max_capacity int)

-----------------------
create table reservation(
id int not null primary key identity (1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id))

-----------------------
create table reserved_room(
id int not null primary key identity (1,1),
number_of_rooms int,
room_type_id int,
foreign key (room_type_id) references room_type(id),
reservation_id int,
foreign key (reservation_id) references reservation(id),
status varchar(20))

-----------------------
create table room(
id int not null primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id))

-----------------------
create table occupied_room(
id int not null primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reservation(id))

-----------------------
create table hosted_at(
id int not null primary key identity (1,1),
guest_id int,
foreign key (guest_id) references guest(id),
occupled_room_id int,
foreign key (occupled_room_id) references occupied_room(id))
