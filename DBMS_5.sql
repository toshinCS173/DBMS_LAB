create database toshin_airline;
use toshin_airline;
create table FLIGHTS(flno int(20),from varchar(25),to varchar(25),distance int(20),departs time,arrives time,price int,
primary key(flno)
);

create table Flights(
flno int,
source varchar(15),
dest varchar(15),
dist int,
departs time,
arrives time,
price int,
primary key(flno)
);

create table Aircraft(
aid int,
aname varchar(10),
cruisingrange int,
primary key(aid)
);

create table employee(
eid int,
ename varchar(15),
salary int,
primary key(eid)
);

create table Certified(
eid int,
aid int,
foreign key(eid) references employee(eid),
foreign key(aid) references Aircraft(aid)
);


insert into Flights values(01,'Pune','Bangalore',500,10-00-00,13-30-00,5000);
insert into Flights values(02,'Chennai','Bangalore',600,11-15-00,14-30-00,5500);
insert into Flights values(03,'Bangalore','Kolkata',850,17-30-00,20-00-00,12000);
insert into Flights values(04,'Delhi','Chennai',1000,10-00-00,17-30-00,15000);
insert into Flights values(05,'Bangalore','Pune',500,14-00-00,15-30-00,5000);
insert into Flights values(06,'Bangalore','Frankfurt',500,14-00-00,15-30-00,10000);
insert into Flights values(07,'Bangalore','Frankfurt',500,14-00-00,15-30-00,245000);

insert into Aircraft values(001,'Air India',500);
insert into Aircraft values(002,'indigo',800);
insert into Aircraft values(003,'Air India',580); 
insert into Aircraft values(004,'Spice Jet',800);
insert into Aircraft values(005,'Indigo',800);
insert into Aircraft values(006,'Boeing',800);

insert into Employee values (10,'Shraddha',250000);
insert into Employee values (20,'June',250000);
insert into Employee values (30,'Jona',10000);
insert into Employee values (40,'Tejas',30000);
insert into Employee values (50,'Shubhan',250000);
insert into Employee values (60,'Shubhan',2500);

insert into Certified values(10,001);
insert into Certified values(20,002);
insert into Certified values(30,003);
insert into Certified values(10,005);
insert into Certified values(40,004);
insert into Certified values(50,005);
insert into Certified values(10,003);
insert into Certified values(10,002);
insert into Certified values(20,006);

select 
select e.eid, max(a.cruisingrange) from employee e, Aircraft a, Certified c having count(c.eid)>3;

select e.ename from Employee e where e.salary < (select min(f.price) from Flights f where f.source='Bangalore' AND f.dest='Frankfurt' );

select a.aname, avg(e.salary) from Aircraft a,Certified c, Employee e where a.aid=c.aid
AND a.cruisingrange>1000
group by a.aid,a.aname;

select distinct e.ename from Employee e,Aircraft a, Certified c where e.eid=c.eid
AND c.aid=a.aid
AND a.aname='Boeing';