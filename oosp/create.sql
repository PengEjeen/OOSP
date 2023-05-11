drop database if exists oos;
create database oos;
use oos;

drop table if exists customer;
create table customer(
	id varchar(20) not null,
    name varchar(20) not null,
    address varchar(100) not null,
    number varchar(20) not null,
    pw varchar(20) not null,
    email varchar(20) not null,
    totalamount int(20),
    numberamount int(10),
    primary key(id)
);

drop table if exists buying;
create table buying(
	ordernumber int(10) not null,
    orderdate date not null,
    price int(20) not null,
    customerid varchar(20) not null,
    discountrate int(10),
    delivery varchar(10) not null,
    review longtext,
    starreview int(1),
    primary key(ordernumber),
    foreign key(customerid) references customer(id)
);

drop table if exists cancel;
create table cancel(
	ordernumber int(10) not null,
    cancelreason longtext,
    canceldate date not null,
    orderdate date not null,
    price int(20) not null,
    customerid varchar(20) not null,
    discountrate int(10)
);

drop table if exists company;
create table company(
	companyname varchar(20) not null,
    companyaddress varchar(100) not null,
    companynumber varchar(20) not null,
    primary key(companyname)
);

drop table if exists product;
create table product(
	productnumber int(10) not null,
    productname varchar(20) not null,
    companyname varchar(20) not null,
    price int(20) not null,
    starcount int(10),
    totalstar int(10),
    salecount int(10),
    totalsale int(20),
    stock int(20) not null,
    primary key(productnumber),
    foreign key(companyname) references company(companyname)
);