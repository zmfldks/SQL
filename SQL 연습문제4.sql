# 날짜 : 2022/09/01
# 이름 : 이왕근
# 내용 : SQL 연습문제4

#실습 4-1

#실습 4-2
create table `Customer`(
	`custId`	int auto_increment primary key,
    `name` 		char(10) not null,
    `address` 	varchar(20) default null,
    `phone` 	char(13) default null
);

create table `Book`(
	`bookId`	int primary key,
    `bookName`	varchar(20) not null,
    `publisher`	varchar(20) not null,
    `price` 	int default null
);

create table `Order`(
	`orderId` 	int auto_increment primary key,
    `custId` 	int not null,
    `bookId`	int not null,
    `salePrice` int not null,
    `orderDate` date
);

#실습 4-3
insert into `Customer` values ('1', '박지성', '영국 맨체스타', '000-5000-0001');
insert into `Customer` values ('2', '김연아', '대한민국 서울', '000-6000-0001');
insert into `Customer` values ('3', '장미란', '대한민국 강원도', '000-7000-0001');
insert into `Customer` values ('4', '추신수', '미국 클리블랜드', '000-8000-0001');
insert into `Customer`(`custId`, `name`, `address`) values ('5', '박세리', '대한민국 대전');

insert into `Book` values ('1', '축구의 역사', '굿스포츠', 7000);
insert into `Book` values ('2', '축구아는 여자', '나무수', 13000);
insert into `Book` values ('3', '축구의 이해', '대한미디어', 22000);
insert into `Book` values ('4', '골프 바이블', '대한미디어', 35000);
insert into `Book` values ('5', '피겨 교본', '굿스포츠', 8000);
insert into `Book` values ('6', '역도 단계별기술', '굿스포츠', 6000);
insert into `Book` values ('7', '야구의 추억', '이상미디어', 20000);
insert into `Book` values ('8', '야구를 부탁해', '이상미디어', 13000);
insert into `Book` values ('9', '올림픽 이야기', '삼성당', 7500);
insert into `Book` values ('10', 'Olympic Champions', 'Pearson', 13000);

insert into `Order` values('1', 1, 1, 6000, '2014-07-01');
insert into `Order` values('2', 1, 3, 21000, '2014-07-03');
insert into `Order` values('3', 2, 5, 8000, '2014-07-03');
insert into `Order` values('4', 3, 6, 6000, '2014-07-04');
insert into `Order` values('5', 4, 7, 20000, '2014-07-05');
insert into `Order` values('6', 1, 2, 12000, '2014-07-07');
insert into `Order` values('7', 4, 8, 13000, '2014-07-07');
insert into `Order` values('8', 3, 10, 12000, '2014-07-08');
insert into `Order` values('9', 2, 10, 7000, '2014-07-09');
insert into `Order` values('10', 3, 8, 13000, '2014-07-10');

#실습 4-4
select `custId`, `name`, `address` from `Customer`;
#실습 4-5
select `bookName`, `Price` from `book`;
#실습 4-6
select `price`, `bookName` from `book`;
#실습 4-7
select * from `book`;
#실습 4-8
select `publisher` from `book`;
#실습 4-9
select distinct `publisher` from `book`;
#실습 4-10
select * from `book` where `price`>=20000;
#실습 4-11
select * from `book` where `price`<=19999;
#실습 4-12
select * from `book` where `price`>=10000 and `price`<=20000;
#실습 4-13
select * from `book` where `price`>=15000 and `price`<=30000;
#실습 4-14
select * from `book` where `bookId`=2 or `bookId`=3 or `bookId`=5;
select * from `book` where `bookId`in(2,3,5);
#실습 4-15
select * from `book` where mod(`bookId`, 2)=0;
select * from `book` where `bookId` % 2 =0;
#실습 4-16
select * from `customer` where `name` like '박%';
#실습 4-17
select * from `customer` where `address` like '대한민국%';
#실습 4-18
select * from `Customer` where `phone` is not null;
#실습 4-19
select * from `book` where `publisher` in('굿스포츠','대한미디어');
#실습 4-20
select `publisher` from `book` where `bookName` = '축구의 역사';
#실습 4-21
select `publisher` from `book` where `bookName` like '축구%';
#실습 4-22
select * from `book` where `bookName`like '_구%';
#실습 4-23
select * from `book` where `bookName` like '%축구%' and `price`>=20000;
#실습 4-24
select * from `book` order by `bookName`;
#실습 4-25
select * from `book` order by `price`, `bookName`;
#실습 4-26
select * from `book` order by `price`desc, `publisher` asc;
#실습 4-27
select * from `book` order by `price` desc limit 3;
#실습 4-28
select * from `book` order by `price`asc limit 3;
#실습 4-29
select sum(`salePrice`) as `총판매액` from `Order`;
#실습 4-30
select 
sum(`salePrice`) as `총판매액`, 
avg(`salePrice`) as `평균값`, 
min(`salePrice`) as `최저가`, 
max(`salePrice`) as `최고가` from `Order`;
#실습 4-31
select count(*) as `판매건수` from `Order`;
#실습 4-32
select `bookId`, replace(`bookName`, '야구', '농구') as `bookName`, `publisher`, `price` from `book` ;
#실습 4-33
select `custId`, count(*) as `수량` from `order` where `salePrice` >=8000 group by `custId` having `수량`>=2;
#실습 4-34
select * from `customer`as a join `order` as b on a.custId = b.custId;
#실습 4-35
#실습 4-36
#실습 4-37
#실습 4-38
#실습 4-39
#실습 4-40
#실습 4-41

#실습 4-42
#실습 4-43
#실습 4-44
#실습 4-45
#실습 4-46
