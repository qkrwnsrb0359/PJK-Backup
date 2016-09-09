create table Board (
	num number(7) not null,		-- 내부적으로 처리될 글번호 
	writer varchar2(20) not null,		--작성자
	email varchar2(30) ,		-- 메일
	subject varchar2(50) not null,	-- 제목
	passwd varchar2(12) not null,   	 -- 비밀번호
	reg_date  date not null, 		 -- 글쓴 날짜   
	readcount   number(3) default 0,	  -- 조회수
	ref  number  not null, 		-- 그룹( 글에 대한...)
	re_step number not null,		-- 그룹 스텝
	re_level  number not null,		-- 그룹 레벨
	content  nvarchar2(2000) not null,	-- 글내용
	ip varchar2(20)  not null,   		--글 쓴 곳의 아이피
	constraint  board_num_pk  primary key(num)	
) SEGMENT creation IMMEDIATE ;

select * from board;
create sequence board_num; 
create sequence autonum;
select rownum, rowid, writer, subject from board where num=1;
select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, 
		re_level, content, ip, readcount, rownum r 
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount 
		from board order by ref desc, re_step asc) order by ref desc, re_level asc) where r>=1 and r<=2;