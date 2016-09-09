select * from tab;
select * from  MEMBER;

create table Members (
	id varchar2(20) not null primary key,
	passwd varchar2(20) not null,
	name varchar2(15) not null,
	jumin1 varchar2(6) not null,
	jumin2 varchar2(7) not null,
	email varchar2(30),
	blog varchar2(50),
	reg_date date not null
)SEGMENT CREATION IMMEDIATE;

select * from members;