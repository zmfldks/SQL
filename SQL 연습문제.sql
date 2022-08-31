#날짜 : 2022/08/29
#이름 : 이왕근
#내용 : SQL 연습문제1

#실습 1-1
create database `java2_shop`;
create user 'java2_admin1'@'%' identified by '1234';
grant all privileges on `java2_shop`.* to 'java2_admin1'@'%';
flush privileges;

#실습 1-2
create table `Customer`(
	`custId` varchar(10) primary key,
    `name`	 varchar(10) not null,
	`hp`	 char(13) default null,
    `addr`	 varchar(100) default null,
    `rdate`	 date not null
);
create table `Product`(
	`prodNo`	int auto_increment primary key,
    `prodName`	varchar(10) not null,
    `stock` 	int default 0,
	`price` 	int default null,
    `company` 	varchar(20) not null
);


create table `Order`(
	`orederNo` 		int auto_increment primary key,
    `oredrId` 		varchar(10) not null,
    `orderProduct`	int not null,
    `orderCount` 	int default 1,
    `orderDate` 	datetime not null
);

#실습 1-3
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
INSERT INTO `Customer`(`custId`, `name`, `rdate`) VALUES ('c105', '이성계', '2022-01-05');
INSERT INTO `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
INSERT INTO `Customer`(`custId`, `name`, `rdate`) VALUES ('c107', '허준', '2022-01-05');
INSERT INTO `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
INSERT INTO `Customer` VALUES ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
INSERT INTO `Customer` VALUES ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, 1800, '농심');
insert into `Product`(`prodNo`, `prodName`, `stock`, `company`) values (5, '죠리퐁', 2200, '크라운');
insert into `Product` values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

insert into `Order` values (1, 'c102', 3, 2, now());
insert into `Order` values (2, 'c101', 4, 1, now());
insert into `Order` values (3, 'c108', 1, 1, now());
insert into `Order` values (4, 'c109', 6, 5, now());
insert into `Order` values (5, 'c102', 2, 1, now());
insert into `Order` values (6, 'c101', 7, 3, now());
insert into `Order` values (7, 'c110', 1, 2, now());
insert into `Order` values (8, 'c104', 2, 4, now());
insert into `Order` values (9, 'c102', 1, 3, now());
insert into `Order` values (10, 'c107', 6, 1, now());

#실습 1-4
select * from `Customer`
#실습 1-5
select * from `Customer`;
#실습 1-6
select `prodNo`, `ProdName`, `price`, `company` from `Product`
#실습 1-7
select `company` from `Product`;
#실습 1-8
select distinct `company` from `Product`

#실습 1-9
select `prodName`, `price` from `Product`;
#실습 1-10
select `prodName`, `price` + 500 as `조정단가` from `Product`;
#실습 1-11
select `predName`, `stock`, `price` from `Product`
#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order`
#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order`  and
#실습 1-14
select * from `Product` where
#실습 1-15
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';
#실습 1-16
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '__';
#실습 1-17
select * from `Customer` where `hp` is null;
#실습 1-18
select * from `Customer` where `addr` is not null;
#실습 1-19
select * from `Customer`
#실습 1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;
#실습 1-21
select  from `Product`;
#실습 1-22
select  as `재고량 합계` from `Product` where `company` = '농심';
#실습 1-23
select count(`custId`) as `고객수` from `Customer`;
#실습 1-24
select count(distinct `company`) as `제조업체 수` from `Product`;
#실습 1-25
select 
	`orderProduct` as `주문 상품번호`,
	sum(`orderCount`) as `총 주문수량`
from `Order` group by `orderProduct`;
#실습 1-26
#실습 1-27
#실습 1-28
#실습 1-29
select a.`orderId`, b.`prodName` from `Order` as a 
join `Product` as b
on a.orderProduct = b.prodNo
where `orderId`='c102'
#실습 1-30
select * from `Order` where substr(`orderDate`, 1, 10) = '2022-07-03'; 