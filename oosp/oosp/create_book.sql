drop database if exists bookstore;
create database bookstore;
use bookstore;
drop table if exists customer;
CREATE TABLE customer
(
    id VARCHAR(20) NOT NULL,
    cname VARCHAR(10) NULL,
    age INT NULL,
    address VARCHAR(20) NULL,
    pw VARCHAR(20) NULL,
    buycnt INT NULL,
    buysum INT NULL,
    PRIMARY KEY(id)
);

drop table if exists manager;
CREATE TABLE manager
(
    id VARCHAR(20) NOT NULL,
    mname VARCHAR(10) NULL,
    age INT NULL,
    pw VARCHAR(20) NULL,
    PRIMARY KEY(id)
);

drop table if exists books;
CREATE TABLE books
(
    isbn BIGINT NOT NULL,
    bname VARCHAR(30) NULL,
    writer VARCHAR(20) NULL,
    publisher VARCHAR(20) NULL,
    category VARCHAR(20) NULL,
    price INT NULL,
    reviewcnt INT NULL,
    sellcnt INT NULL,
    rateavg FLOAT NULL,
    imgpath VARCHAR(255) NULL,
    detail VARCHAR(255) NULL,
    PRIMARY KEY(isbn)
);

drop table if exists buying;
CREATE TABLE buying
(
    isbn BIGINT NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    buyingno INT NOT NULL,
    date DATE NOT NULL,
    buyingcnt INT NULL,
    price INT NULL,
    rating FLOAT NULL,
    review VARCHAR(45) NULL,
    reviewdate DATE NULL,
    shipping VARCHAR(20) NULL,
    shipdate DATE NULL,
    PRIMARY KEY(buyingno),
    foreign key(isbn) references books(isbn),
    foreign key(customer_id) references customer(id)
);
drop table if exists cancel;
CREATE TABLE cancel
(
    buyingno INT NOT NULL,
    isbn BIGINT NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    date DATE NULL,
    reason VARCHAR(45) NULL,
    PRIMARY KEY(buyingno),
    foreign key(isbn) references books(isbn),
    foreign key(buyingno) references buying(buyingno),
    foreign key(customer_id) references buying(customer_id)
);