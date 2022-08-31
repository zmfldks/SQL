#날짜 : 2022/08/31
#이름 : 이왕근
#내용 : SQL 연습문제3

#실습3-1
create database `java2_College`;
create user 'java2_admin3'@'%' identified by '1234';
grant all privileges on java2_College.* to 'java2_admin3'@'%';
flush privileges;

#실습3-2
create table `Student`(
	`stdNo`		char(8) primary key,
	`stdName`	varchar(20) not null,
    `stdHP`		char(13) not null,
    `stdYear`	tinyint not null,
    `stdAddress`	varchar(100)
);

create table `Lecture`(
	`lecNo` 	int primary key,
    `lecName`	varchar(20) not null,
    `lecCredit`	tinyint not null,
    `lecTime`	int not null,
    `lecClass`	varchar(10) default null
);

create table `Register`(
	`regStdNo`		char(8),
    `regLecNo`		decimal(5),
    `regMidScore`	tinyint,
    `regFinalScore`	tinyint,
    `regTotalScore`	tinyint,
    `regGrade`		char(1)
);

#실습3-3
insert into `student`(`stdNo`, `stdName`, `stdHP`, `stdYear`) values ('20201016', '김유신', '010-1234-1001', 3);
insert into `student` values ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `student` values ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `student` values ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `student` values ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `student` values ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` values ('159', '인지행동심리학', 3, 40, '본304');
insert into `Lecture` values ('167', '운영체제론', 3, 25, '본605');
insert into `Lecture` values ('234','중급 영문법',3,20,'본201');
insert into `Lecture` values ('239','세법개론',3,40,'본204');
insert into `Lecture` values ('248','빅데이터 개론',3,20,'본601');
insert into `Lecture` values ('253','컴퓨팅사고와 코딩',2,10,'본602');
insert into `Lecture` values ('349','사회복지 마케팅',2,50,'본301');

insert into `Register`(`regStdNo`, `regLecNo`) values('20201126','234');
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016','248');
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016','253');
insert into `Register`(`regStdNo`, `regLecNo`) values('20201126','239');
insert into `Register`(`regStdNo`, `regLecNo`) values('20210216','349');
insert into `Register`(`regStdNo`, `regLecNo`) values('20210326','349');
insert into `Register`(`regStdNo`, `regLecNo`) values('20201016','167');
insert into `Register`(`regStdNo`, `regLecNo`) values('20220416','349');


#실습3-4
select * from `lecture`;
#실습3-5
select * from `student`;
#실습3-6
select * from `register`;
#실습3-7
select * from `student` where `stdYear`=3;
#실습3-8
select * from `lecture` where `lecCredit`=2;
#실습3-9
update `register` set `regMidScore` = 36, `regFinalScore` = 42 where `regStdNo` = '20201126' and `regLecNo`= 234;
update `register` set `regMidScore` = 24, `regFinalScore` = 62 where `regStdNo` = '20201016' and `regLecNo`= 248;
update `register` set `regMidScore` = 28, `regFinalScore` = 40 where `regStdNo` = '20201016' and `regLecNo`= 253;
update `register` set `regMidScore` = 37, `regFinalScore` = 57 where `regStdNo` = '20201126' and `regLecNo`= 239;
update `register` set `regMidScore` = 28, `regFinalScore` = 68 where `regStdNo` = '20210216' and `regLecNo`= 349;
update `register` set `regMidScore` = 16, `regFinalScore` = 65 where `regStdNo` = '20210326' and `regLecNo`= 349;
update `register` set `regMidScore` = 18, `regFinalScore` = 38 where `regStdNo` = '20201016' and `regLecNo`= 167;
update `register` set `regMidScore` = 25, `regFinalScore` = 58 where `regStdNo` = '20220416' and `regLecNo`= 349;
select * from `register`;

#실습3-10
update `register` set
	`regTotalScore` = `regMidScore` + `regFinalScore`,
    `regGrade` = if(`regTotalScore` >= 90, 'A',
				 if(`regTotalScore` >= 80, 'B',	
				 if(`regTotalScore` >= 70, 'C',
                 if(`regTotalScore` >= 60, 'D', 'F'))));
select * from `register`;

#실습3-11
select * from `register` order by `regTotalScore` desc ;
#실습3-12
select * from `reguster`;
#실습3-13
#실습3-14
#실습3-15
#실습3-16
select * from `student` where `stdAddress` is null;
#실습3-17
#실습3-18
select * from `student` as a
left join `register` as b
on a.stdNo = b.regStdNo;

#실습3-19
select * from `student` as a, `register` as b
where a.stdNo = b.regStdNo;

#실습3-20
#실습3-21
#실습3-22
#실습3-23
#실습3-24
#실습3-25
#실습3-26
#실습3-27
#실습3-28
select 
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from `student` as a
join `register` as b on a.stdNo =b.regStdNo
join `lecture` as c on b.regStdNo = c.lecNo
where `regGrade` ='F';
#실습3-29
select 
	`stdNo`,
    `stdName`,
    sum(`lecCredit`) as `이수학점`
from `student` as a
join `register` as b on a.stdNo = b.regStdNo
join `lecture` as c on b.regLecNo =c.lecNo
where `regTotalScore` >= 60
group by `stdNo`;
#실습3-30
SELECT 
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`) AS `신청과목`,
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN `Register` AS b ON a.stdNo = b.regStdNo
JOIN `Lecture` AS c ON b.regLecNo = c.lecNo
GROUP BY `stdNo`;