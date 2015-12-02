CREATE TABLE ADMIN(
	ID VARCHAR2(20) CONSTRAINT ADMIN_ID_PK PRIMARY KEY,
	PASSWORD VARCHAR2(20)
);
INSERT INTO ADMIN VALUES('AD','AD');

CREATE TABLE ACCOUNT(
	ACCOUNT_NUM VARCHAR2(30) CONSTRAINT ACCOUNT_ACCOUNT_NUM_PK PRIMARY KEY,
	TOTAL NUMBER,
	ID VARCHAR2(20) CONSTRAINT ACCOUNT_ID_FK REFERENCES ADMIN(ID)
);

insert into account values('20151101','180000','AD');
insert into account values('20151102','220000','AD');
insert into account values('20151103','354000','AD');
insert into account values('20151104','180000','AD');
insert into account values('20151105','2730000','AD');

CREATE TABLE MEMBER(
	USERID VARCHAR2(20) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
	PASSWORD VARCHAR2(20) NOT NULL,
	NAME VARCHAR2(20),
	BIRTH VARCHAR2(20),
	GENDER VARCHAR2(10),
	EMAIL VARCHAR2(50),
	PHONE VARCHAR2(30),
	ADDR VARCHAR2(30)
);

insert into member values('a','a','hong','1991.07.17','남','pheonix0717@naver,com','010-4278-4789','서울시 광진구 화양동');
insert into member values('b','b','hwang','2000.01.11','남','ssun9900@naver,com','010-1234-1549','서울시 강남구 역삼동');
insert into member values('c','c','young','1897.09.20','여','asdfbva@naver,com','010-4200-1234','서울시 구로구 xx동');
insert into member values('d','d','admin','1120.11.11','남','snh3n@@naver,com','010-4175-0910','서울시 중곡동 yy동');

CREATE TABLE ORDER_LIST(
	ORDER_NUM VARCHAR2(30) CONSTRAINT ORDER_LIST_ORDER_NUM_PK PRIMARY KEY,
	SUM NUMBER,
	ACCOUNT_NUM VARCHAR2(30) CONSTRAINT ORDER_LIST_ACCOUNT_NUM_FK REFERENCES ACCOUNT(ACCOUNT_NUM),
	USERID VARCHAR2(30) CONSTRAINT ORDER_LIST_USERID_FK REFERENCES MEMBER(USERID)
);

insert into order_list values('20151101-0001','30000','20151101','a');
insert into order_list values('20151101-0002','20000','20151101','c');
insert into order_list values('20151101-0003','40000','20151101','d');
insert into order_list values('20151101-0004','10000','20151101','b');
insert into order_list values('20151102-0001','50000','20151102','b');
insert into order_list values('20151102-0002','70000','20151102','a');
insert into order_list values('20151102-0003','40000','20151102','c');
insert into order_list values('20151102-0004','50000','20151102','a');
insert into order_list values('20151103-0001','90000','20151103','b');
insert into order_list values('20151103-0002','10000','20151103','b');
insert into order_list values('20151103-0003','20000','20151103','a');
insert into order_list values('20151103-0004','50000','20151103','d');
insert into order_list values('20151104-0001','30000','20151104','d');
insert into order_list values('20151104-0002','30000','20151104','d');
insert into order_list values('20151104-0003','40000','20151104','c');
insert into order_list values('20151104-0004','60000','20151104','c');
insert into order_list values('20151105-0001','80000','20151105','a');
insert into order_list values('20151105-0002','10000','20151105','c');
insert into order_list values('20151105-0003','20000','20151105','a');
insert into order_list values('20151105-0004','50000','20151105','b');

CREATE TABLE CATEGORY(
	CATEGORY_ID VARCHAR2(20) CONSTRAINT CATEGORY_CATEGORY_NAME_PK PRIMARY KEY,
	CATEGORY_NAME VARCHAR2(20)
);
insert into category values('domestic','국내도서');
insert into category values('abroad','해외도서');
insert into category values('ebook','전자책');

CREATE TABLE GENRE(
	GENRE_ID VARCHAR2(20) CONSTRAINT GENRE_GENRE_ID_PK PRIMARY KEY,
	GENRE_NAME VARCHAR2(20),
	CATEGORY_ID VARCHAR2(20) CONSTRAINT GENRE_CATEGORY_NAME_FK REFERENCES CATEGORY(CATEGORY_ID)
);

insert into genre values('fiction','소설','domestic');
insert into genre values('essay','수필','abroad');
insert into genre values('it','공학','domestic');

CREATE TABLE OPTION2(
	OPTION_ID VARCHAR2(20) CONSTRAINT OPTION2_OPTION_NAME_PK PRIMARY KEY,
	OPTION_NAME VARCHAR2(30)
);

insert into option2 values('md','MD의 선택');
insert into option2 values('free','무료배송');

CREATE TABLE STOCK(
	STOCK_SEQ NUMBER CONSTRAINT STOCK_STOCK_SEQ_PK PRIMARY KEY,
	COUNT NUMBER
);
insert into stock values('1','1');
insert into stock values('2','2');
insert into stock values('3','3');
insert into stock values('4','4');
insert into stock values('5','5');

CREATE TABLE EVENT(
	EVENT_ID VARCHAR2(30) CONSTRAINT EVENT_EVENT_ID_PK PRIMARY KEY,
	EVENT_NAME VARCHAR2(30),
	TERM VARCHAR2(30)
);
insert into event values('random','선착순증정이벤트','2010.11.11~12.03');
insert into event values('resverve','예약판매이벤트','2013.12.01~12.25');

CREATE TABLE SEL_MEMBER(
	USERID_EVENT VARCHAR2(50) CONSTRAINT SEL_MEMBER_USERID_EVENT_PK PRIMARY KEY,
	USERID VARCHAR2(20) CONSTRAINT SEL_MEMBER_USERID REFERENCES MEMBER(USERID),
	EVENT_ID VARCHAR2(30) CONSTRAINT SEL_MEMBER_EVENT_ID REFERENCES EVENT(EVENT_ID)
);
insert into sel_member values('arandom','a','random');
insert into sel_member values('areserve','a','resverve');
insert into sel_member values('creserve','c','resverve');
insert into sel_member values('dreserve','d','resverve');

CREATE TABLE BOOK(
	BOOK_ID VARCHAR2(20) CONSTRAINT BOOK_BOOK_ID_PK PRIMARY KEY,
	BOOK_NAME VARCHAR2(30),
	PRICE NUMBER,
	WRITER VARCHAR2(20),
	GRADE NUMBER,
	EVENT_ID VARCHAR2(30) CONSTRAINT BOOK_EVENT_ID_FK REFERENCES EVENT(EVENT_ID),
	STOCK_SEQ NUMBER CONSTRAINT BOOK_STOCK_SEQ_FK REFERENCES STOCK(STOCK_SEQ),
	OPTION_BOOK VARCHAR2(30),
	GENRE_ID VARCHAR2(20) CONSTRAINT BOOK_GENRE_ID_FK REFERENCES GENRE(GENRE_ID)
);

insert into book values('java','자바의 정석','15000','저자1','5.7','random','3','free','it');
insert into book values('html','HTML의 정석','30000','저자2','9.7','resverve','2','md','essay');
insert into book values('jsp','JSP의 정석','19000','저자3','5.9','resverve','5','md','fiction');
insert into book values('c','C언어의 정석','25000','저자4','7.7','random','4','free','it');
insert into book values('matlab','MATLAB의 정석','35000','저자5','1.7','random','4','free','fiction');

CREATE TABLE ORDER_BOOK(
	BOOK_ID VARCHAR2(20) CONSTRAINT ORDER_BOOK_BOOK_ID_FK REFERENCES BOOK(BOOK_ID),
	ORDER_NUM VARCHAR2(30) CONSTRAINT ORDER_BOOK_ORDER_NUM_FK REFERENCES ORDER_LIST(ORDER_NUM),
	COUNT NUMBER
);
insert into order_book values('java','20151101-0001','3');
insert into order_book values('matlab','20151101-0001','1');
insert into order_book values('java','20151101-0003','2');
insert into order_book values('html','20151102-0001','3');
insert into order_book values('c','20151102-0002','3');
insert into order_book values('c','20151104-0001','3');
insert into order_book values('java','20151104-0002','3');
insert into order_book values('jsp','20151103-0001','3');

commit;

--오늘자 날짜의 주문목록
select * from order_list where account_num='20151102'; 
--아이디에 따른 주문목록
select * from order_list where userid='a';
--이름에 따른 오늘 주문목록.
select * from member m
join order_list o 
on m.userid=o.userid 
join account a
on o.account_num=a.account_num
where o.userid='a' and a.account_num='20151101';


select * from order_book;
select * from order_book where book_id='java';
select * from order_list 











