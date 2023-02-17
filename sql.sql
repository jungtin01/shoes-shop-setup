CREATE DATABASE	PRJ321_DB

use PRJ321_DB

create table product(
	id int identity(1, 1) not null primary key,
	name nvarchar(255) unique not null,
	img_url varchar(500) not null,
	price money not null,
	quantity int not null,
	last_import_date date default getdate()
)

create table invoice(
	id int identity(1, 1) not null primary key,
	cust_name nvarchar(255) not null,
	cust_addr nvarchar(255) not null,
	cust_phone_no nvarchar(255) not null,
	create_time datetime default CURRENT_TIMESTAMP
)

create table invoice_detail(
	invoice_id int not null FOREIGN KEY REFERENCES invoice(id),
	product_id int not null FOREIGN KEY REFERENCES product(id),
	quantity int not null,
	primary key(invoice_id, product_id)
)

create table account(
	id int identity(1, 1) not null primary key,
	username varchar(255) not null,
	password varchar(255) not null
)