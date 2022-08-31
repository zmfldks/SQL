#날짜 : 2022/08/25
#이름 : 이왕근
#내용 : 제 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`seq`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT NOT NULL
);




#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, NOW());
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');


INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);






#실습 4-3
select * from `Member` where `name` <> '김유신';
select * from `Member` where `pos` = '차장' and dep = 101;
select * from `Member` where `pos` = '차장' or dep = 101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘수';
select * from `Member` where `pos` = '사원' or `pos` = '대리';
select * from `Member` where `pos` in('사원', '대리');
select * from `Member` where `dep` in(101, 102, 103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale` between 50000 and 100000;

#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` asc;
select * from `Sales` order by `sale` desc;
select * from `Sales` 
where `sale` > 50000 
order by `year`, `month`, `sale` desc;
select * from `Sales` order by `rdate` asc;

#실습 4-5
select * from `Sales` limit 3;
select * from `Sales` limit 0, 3;
select * from `Sales` limit 1,2;
select * from `Sales` limit 5,3;
select * from `Sales` order by `sale` desc limit 3,5;
select * from `Member` order by `rdate` asc;



#실습 4-6
select sum(`sale`) as `매출총합` from `Sales`;
 select count(`seq`) as `갯수` from `Sales`;
 select substring(`hp`, 10, 4) as `휴대폰 끝자리` from `Member`;

insert into `Member` values ('b101', '을지문덕', '010-5555-1234', '사장', '107', now()); 



#실습 4-7
select sum(`sale`) as `2018년도 1월 매출총합` from `Sales` where `year`=2018 and `month`=1;

#실습 4-8
select sum(`sale`) as `총합`, avg(`sale`) as `평균` from `Sales` where `year`=2019 and `month`=2 and `sale`>= 50000;

#실습 4-9
select min(`sale`) as `최저`, max(`sales`) as `최고` from `slaes` where `year`=2020;

#실습 4-10
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;
select `uid`, count(*) as `건수` from `Sales group by uid`;
select `uid`, sum(slae) as `합계` from `Sales group by uid`;
select `uid`, avg(sale) as `평균` from `Sales group by uid`;

select
	`uid`,
    `year`,
    sum(`sale`) as `합계`
from `Sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc;



#실습 4-11
select `uid`, sum(`sale`) as `합계` from `Sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `Sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;



#실습 4-12
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
update `Sales2` set `year` = `year` + 3;

select * from `Sales` union select * from `Sales2`;
(select * from `Sales`) union (select * from `Sales2`);

select `uid`, `year`, `sale` from `Sales`
union
select `uid`, `year`, `sale` from `Sales2`


SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year` UNION
SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales2`
GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;


#실습 4-13
select * from `Sales` inner join `Member` on `Sales`, `uid` = `Member`, `uid`;
select * from `Member` inner join `Department` on `Member`, `dep` = `Department`, `depNo`;

select * from `Sales` as a
join `Member` as b
on a.uid = b.uid;

select * from `Sales` as a, `Member` as b where a.uid =b.uid;

select 
	`seq`,
	`uid`,
    `sale`,
    `name`,
    `pos`
from `Sales` as a
join `Member` as b
using (`uid`);

select * from `Sales` as a
join `Member` as b on a.uid = b.uid
join `Department` as c on b.dep = c.depNo;




#실습 4-14
select * from `Sales` as a left join `Member` as b on a.uid = b.uid; 
select * from `Sales` as a right join `Member` as b on a.uid = b.uid; 
select a.seq, a.uid, `sale`, `name`, `pos` from Sales as a left join Member as b using(uid);
select a.seq, a.uid, `sale`, `name`, `pos` from Sales as a right join Member as b using(uid);


#실습 4-15
select  
	`uid`,
    a.`name`,
    `pos`,
    b.`name`
from `Member` as a 
join `Department` as b
on a.dep = b.depNo;

#실습 4-16
select  
	sun(`sale`) as `2019 매출합`
from `Sales`as a
join `Member` as b
on a.uid = b.uid
where `name` = '김유신' and `year` = 2019;


#실습 4-17
select 
	b.`name`,
    c.`name`,
    b.`pos`,
    a.`year`,
    sum(`sale`) as `매출합`
from `Sales` as a
join `Member` b on a.uid = b.uid
join `Department` c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a`uid`
having `매출합` >= 100000
order by `매출합` desc;

