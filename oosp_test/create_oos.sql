drop table if exists buying;
create table buying(
   ordernumber int(10) not null,
    orderdate date not null,
    price int(20) not null,
    productnumber int(10) not null,
    customerid varchar(20) not null,
    discountrate int(10),
    delivery varchar(10) not null,
    review longtext,
    starreview int(1),
    primary key(ordernumber),
    foreign key(customerid) references customer(id)
);