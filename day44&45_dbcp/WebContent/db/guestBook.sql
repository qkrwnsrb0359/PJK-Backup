select * from dept2;

create table guestBook (
	num number,
	name varchar2(50) not null,
	email varchar2(50),
	home varchar2(50),
	contents varchar2(2000) not null
)SEGMENT CREATION IMMEDIATE;

select * from guestBook;
select rowid, rownum from GUESTBOOK;

--insert into guestBook(num,.....) values();

create sequence book_num;
drop sequence book_num;

select count(num) from guestbook;

select name, email, home, contents 
from guestBook 
where num > 0 and num <= 5 order by num desc;