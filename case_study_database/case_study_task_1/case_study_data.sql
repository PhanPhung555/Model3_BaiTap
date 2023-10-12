create database ManagerHotel;
use ManagerHotel;

create table location (
	code_location int auto_increment primary key,
    name_location varchar(45)
);
create table lever(
	code_lever int auto_increment primary key,
    name_lever varchar(45)
);
create table part (
	code_part int auto_increment primary key,
    name_part varchar(45)
);
create table staff (
	code_staff int auto_increment primary key,
    fullname_staff varchar(45) not null,
    date_of_birth_staff date not null,
    number_cmnd_staff varchar(45) not null,
    salary_staff double not null,
    number_phone_staff varchar(45),
    email_staff varchar(45),
    address_staff varchar(45),
    code_location int,
    code_lever int,
    code_part int,
    foreign key (code_location) references location(code_location),
    foreign key (code_lever) references lever(code_lever) ,
    foreign key (code_part) references part(code_part)
);
create table typeClient(
	code_type_client int auto_increment primary key,
    name_type_client varchar(45)
);
create table clients (
	code_client int auto_increment primary key,
	fullname_client varchar(45) not null,
    date_of_birth_client date not null,
    gender_client bit(1) not null ,
    number_cmnd_client varchar(45) not null,
    number_phone_client varchar(45) not null,
    email_client varchar(45),
    address_client varchar(45),
	code_type_client int,
    foreign key (code_type_client) references typeClient(code_type_client)
);
create table typeRental (
	code_type_rental int auto_increment primary key,
    name_type_retal varchar(45)
);
create table typeService (
	code_type_service int auto_increment primary key,
    name_type_service varchar(45)
);

create table service(
	code_service int auto_increment primary key,
    name_service varchar(45) not null,
    acreage int,
    rental_costs double not null,
    number_person_max int,
    room_standards varchar(45),
    describe_other_amenities varchar(45),
    acreage_pool double null,
    number_floor int null,
    code_type_rental int,
    code_type_service int,
    foreign key (code_type_rental) references typeRental (code_type_rental),
    foreign key (code_type_service) references typeService(code_type_service)
);
create table contract (
	code_contract int auto_increment primary key,
	start_date_contract datetime not null,
    end_date_contract datetime not null,
    monney_deposit double not null,
    code_staff int,
    code_client int ,
    code_service int,
    foreign key (code_staff) references staff (code_staff),
    foreign key (code_client) references clients (code_client),
    foreign key (code_service) references service (code_service)
);
create table serviceGoWith (
	code_service_gowith int auto_increment primary key,
    name_service_gowith varchar(45),
    price double,
    unit varchar(45) not null,
    status1 varchar(45) null
);
alter table serviceGoWith add column unit varchar(45), add column status1 varchar(45) null;

create table detailedContract (
	code_contract_detailed int auto_increment primary key,
    code_contract int ,
    code_service_gowith int,
    quantity int,
    foreign key (code_contract) references contract(code_contract),
    foreign key (code_service_gowith) references serviceGoWith (code_service_gowith)
);
