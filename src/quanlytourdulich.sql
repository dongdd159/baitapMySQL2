CREATE DATABASE travellingmanagement;
use travellingmanagement;
create table city
(
    id   int auto_increment
        primary key,
    name varchar(50) not null
);
create table customer
(
    id             int auto_increment
        primary key,
    name           varchar(50) not null,
    identification varchar(20) not null,
    birthyear      year        not null,
    city_id        int         not null,
    constraint customer_ibfk_1
        foreign key (city_id) references city (id)
);

create index city_id
    on customer (city_id);
create table location
(
    id          int auto_increment
        primary key,
    name        varchar(30) null,
    description varchar(60) null,
    avgprice    double      null,
    city_id     int         null,
    constraint location_ibfk_1
        foreign key (city_id) references city (id)
);

create index city_id
    on location (city_id);
create table `order`
(
    id          int auto_increment
        primary key,
    tour_id     int        null,
    customer_id int        null,
    status      tinyint(1) not null,
    constraint order_ibfk_1
        foreign key (tour_id) references tour (id),
    constraint order_ibfk_2
        foreign key (customer_id) references customer (id)
);

create index customer_id
    on `order` (customer_id);
create table tour
(
    id            int auto_increment
        primary key,
    touridentify  varchar(30) not null,
    tourtype_id   int         null,
    locationprice double      not null,
    departuredate date        not null,
    arrivedate    date        not null,
    constraint tour_ibfk_1
        foreign key (tourtype_id) references tourtype (id)
);

create index tourtype_id
    on tour (tourtype_id);
create table tourtype
(
    id           int auto_increment
        primary key,
    typeidentify varchar(30) not null,
    name         varchar(50) not null
);
insert into location( name, description, avgprice, city_id) values ('agga','',45,4),('gága','',74.2,3),('gsdgcd','ứgfs',43.41,1),('dsagcx','',91,3),('cxbxx','ag',25.13,5);
insert into customer( name, identification, birthyear, city_id) values ('cxbxb','fd23',1953,5),('ừca','sâ35',1978,1),('zva','áax',1999,4),('edee','hbd45',1952,1),('zzzs','qs48',2005,3),('xcee','ax53',2002,1),('vcxbh','wfa45',1998,5),('ceee','sa75',1994,2),('poo','th22',1991,3),('bfdbdb','cv43',1989,4);
insert into city( name) values ('gvse'),('cvx'),('gbfdsh'),('brrr'),('cxzzz');
insert into tour(touridentify, tourtype_id, locationprice, departuredate, arrivedate) values ('ca48',2,75.44,'2021-01-06','2021-04-01'),('eg12',1,42.65,'2021-06-12','2021-07-13'),('vx58',1,86.12,'2021-10-27','2022-01-21'),('ev41',1,94.1,'2021-03-04','2021-08-06'),('cx85',2,13.56,'2021-11-22','2021-12-23'),('ew53',1,99.23,'2021-03-15','2021-06-01'),('cxx52',2,22.9,'2021-10-22','2021-10-24'),('sacz52',2,156.25,'2021-12-19','2022-01-29'),('vx82',1,95.13,'2021-06-17','2021-08-21'),('zm413',2,85.36,'2021-09-22','2021-11-17'),('vv45',1,74.525,'2021-01-01','2021-02-06'),('ex99',1,250.7,'2021-02-14','2021-05-20'),('qh44',1,43.55,'2021-08-14','2022-04-19'),('cbb89',2,56.2,'2021-05-16','2021-06-06'),('ji42',1,110.3,'2021-10-02','2021-12-13');
insert into tourtype(typeidentify, name) values ('fdh25','gágvs'),('bhgsw','fvzvbv');
insert into `order`( tour_id, customer_id, status) values (6,8,true),(2,9,true),(7,4,false),(13,1,true),(10,7,false),(4,6,true),(11,3,false),(8,10,true),(14,2,true),(1,5,false);
SELECT ct.name,COUNT(t.id) from tour as t inner join `order` o on t.id = o.tour_id inner join customer c on o.customer_id = c.id inner join city ct on c.city_id = ct.id group by ct.name;
SELECT COUNT(t.id) from tour as t where YEAR(departuredate)='2020' and MONTH(departuredate)='3';
SELECT COUNT(t.id) from tour as t where YEAR(arrivedate)='2020' and MONTH(arrivedate)='4';