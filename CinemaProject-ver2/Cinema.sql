--------------------------------------------------------
--  파일이 생성됨 - 금요일-9월-23-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CINEMA_PK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CINEMA_PK_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 20221003 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNO
--------------------------------------------------------

   CREATE SEQUENCE  "QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SCREEN_PK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCREEN_PK_SEQ"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 20222003 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence movie_code
--------------------------------------------------------

   CREATE SEQUENCE  "movie_code"  MINVALUE 1 MAXVALUE 99999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ADMIN
--------------------------------------------------------

  CREATE TABLE "ADMIN" 
   (	"ADMIN_ID" VARCHAR2(200 BYTE), 
	"ADMIN_PASSWD" VARCHAR2(200 BYTE), 
	"ADMIN_NAME" VARCHAR2(200 BYTE), 
	"ADMIN_GRADE" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table BOOKED_SEATS
--------------------------------------------------------

  CREATE TABLE "BOOKED_SEATS" 
   (	"BOOKINGCODE" VARCHAR2(200 BYTE), 
	"SEATCODE" VARCHAR2(200 BYTE), 
	"SCREENCODE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table BOOKING
--------------------------------------------------------

  CREATE TABLE "BOOKING" 
   (	"BOOKINGCODE" VARCHAR2(200 BYTE), 
	"USER_EMAIL" VARCHAR2(200 BYTE), 
	"TIMECODE" VARCHAR2(200 BYTE), 
	"SCREENCODE" VARCHAR2(200 BYTE), 
	"MCODE" VARCHAR2(200 BYTE), 
	"TOTALPRICE" NUMBER(*,0), 
	"BOOKINGDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table CINEMA
--------------------------------------------------------

  CREATE TABLE "CINEMA" 
   (	"CINEMACODE" NUMBER(10,0), 
	"CINEMANAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table GRADENAME
--------------------------------------------------------

  CREATE TABLE "GRADENAME" 
   (	"GRADE" NUMBER(3,0), 
	"GRADE_NAME" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"USER_EMAIL" VARCHAR2(1000 BYTE), 
	"USER_PASSWD" VARCHAR2(1000 BYTE), 
	"USER_NAME" VARCHAR2(1000 BYTE), 
	"USER_NICK" VARCHAR2(1000 BYTE), 
	"USER_TEL" VARCHAR2(20 BYTE), 
	"USER_ADDRESS" VARCHAR2(1000 BYTE), 
	"USER_POINT" NUMBER(5,0), 
	"USER_BIRTH" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MOVIEDB
--------------------------------------------------------

  CREATE TABLE "MOVIEDB" 
   (	"MCODE" VARCHAR2(200 BYTE), 
	"TITLE" VARCHAR2(60 BYTE), 
	"TITLEENG" VARCHAR2(60 BYTE), 
	"DIRECTORNM" VARCHAR2(60 BYTE), 
	"DIRECTORENNM" VARCHAR2(60 BYTE), 
	"ACTORNM" VARCHAR2(200 BYTE), 
	"ACTORENNM" VARCHAR2(200 BYTE), 
	"COMPANY" VARCHAR2(150 BYTE), 
	"NATION" VARCHAR2(60 BYTE), 
	"GENRE" VARCHAR2(100 BYTE), 
	"RATING" VARCHAR2(60 BYTE), 
	"RUNTIME" VARCHAR2(30 BYTE), 
	"REPRLSDATE" DATE, 
	"KEYWORDS" VARCHAR2(200 BYTE), 
	"PLOTTEXT" VARCHAR2(1500 BYTE), 
	"KMDBURL" VARCHAR2(450 BYTE), 
	"TRAILER" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT" 
   (	"COMMENT_NO" NUMBER, 
	"CONTENT" VARCHAR2(200 BYTE), 
	"COMMENT_DATE" DATE DEFAULT sysdate, 
	"MCODE" VARCHAR2(200 BYTE), 
	"USER_EMAIL" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT_HATE
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT_HATE" 
   (	"COMMENT_NO" NUMBER, 
	"USER_EMAIL" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MOVIE_COMMENT_LIKE
--------------------------------------------------------

  CREATE TABLE "MOVIE_COMMENT_LIKE" 
   (	"COMMENT_NO" NUMBER, 
	"USER_EMAIL" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MOVIE_FILE
--------------------------------------------------------

  CREATE TABLE "MOVIE_FILE" 
   (	"MCODE" VARCHAR2(200 BYTE), 
	"FNO" NUMBER, 
	"PATH" VARCHAR2(150 BYTE), 
	"MAINPOSTER" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table PERFORMANCE_SEAT
--------------------------------------------------------

  CREATE TABLE "PERFORMANCE_SEAT" 
   (	"SEATCODE" VARCHAR2(200 BYTE), 
	"TIMECODE" VARCHAR2(200 BYTE), 
	"SEATSTATUS" NUMBER, 
	"SCREENCODE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"QNO" NUMBER, 
	"QNA_TITLE" VARCHAR2(100 BYTE), 
	"QNA_AREA" VARCHAR2(50 BYTE), 
	"USER_EMAIL" VARCHAR2(1000 BYTE), 
	"QNA_QUIRYTYPE" NUMBER, 
	"QNA_CONTENT" VARCHAR2(2000 BYTE), 
	"RESPONSE" VARCHAR2(2000 BYTE), 
	"QNA_DATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table QNAQUIRYTYPE
--------------------------------------------------------

  CREATE TABLE "QNAQUIRYTYPE" 
   (	"QUIRY_NO" NUMBER, 
	"QUIRYTYPE" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table RATING
--------------------------------------------------------

  CREATE TABLE "RATING" 
   (	"MCODE" VARCHAR2(200 BYTE), 
	"SCORE" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table SCREEN
--------------------------------------------------------

  CREATE TABLE "SCREEN" 
   (	"SCREENCODE" VARCHAR2(200 BYTE), 
	"CINEMACODE" NUMBER(10,0), 
	"SCREENNAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SCREEN_MOVIE
--------------------------------------------------------

  CREATE TABLE "SCREEN_MOVIE" 
   (	"SCREENCODE" VARCHAR2(200 BYTE), 
	"MCODE" VARCHAR2(200 BYTE), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------

  CREATE TABLE "SEAT" 
   (	"SEATCODE" VARCHAR2(200 BYTE), 
	"SCREENCODE" VARCHAR2(200 BYTE), 
	"SEATTYPE" VARCHAR2(200 BYTE), 
	"SEATNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table TIME
--------------------------------------------------------

  CREATE TABLE "TIME" 
   (	"TIMECODE" VARCHAR2(200 BYTE), 
	"STARTTIME" VARCHAR2(200 BYTE), 
	"ENDTIME" VARCHAR2(200 BYTE), 
	"MOVIEDATE" DATE, 
	"MOVIECOINT" NUMBER(*,0), 
	"SCREENCODE" VARCHAR2(200 BYTE), 
	"MCODE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table WATCHLIST
--------------------------------------------------------

  CREATE TABLE "WATCHLIST" 
   (	"USER_EMAIL" VARCHAR2(200 BYTE), 
	"MCODE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for View QNA_VIEW
--------------------------------------------------------

  CREATE OR REPLACE VIEW "QNA_VIEW" ("QNO", "QNA_TITLE", "QNA_AREA", "QNA_WRITER", "QUIRYTYPE", "QNA_CONTENT", "RESPONSE") AS 
  select q.qno, q.qna_title, q.qna_area, q.qna_writer, qq.quiryType, q.qna_content, q.response
from qna q, qnaQuiryType qq
where q.qna_quirytype = qq.quiry_no
;
REM INSERTING into ADMIN
SET DEFINE OFF;
Insert into ADMIN (ADMIN_ID,ADMIN_PASSWD,ADMIN_NAME,ADMIN_GRADE) values ('admin','1234','admin',0);
Insert into ADMIN (ADMIN_ID,ADMIN_PASSWD,ADMIN_NAME,ADMIN_GRADE) values ('tester','1234','tester',1);
Insert into ADMIN (ADMIN_ID,ADMIN_PASSWD,ADMIN_NAME,ADMIN_GRADE) values ('tester2','1234','tester2',1);
Insert into ADMIN (ADMIN_ID,ADMIN_PASSWD,ADMIN_NAME,ADMIN_GRADE) values ('tester3','1234','tester3',1);
Insert into ADMIN (ADMIN_ID,ADMIN_PASSWD,ADMIN_NAME,ADMIN_GRADE) values ('tester4','1234','tester4',1);
REM INSERTING into BOOKED_SEATS
SET DEFINE OFF;
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('1','20224005','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('1','20224006','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('2','20224007','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('4','20224008','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('5','20224001','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('5','20224003','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('5','20224004','20222001');
Insert into BOOKED_SEATS (BOOKINGCODE,SEATCODE,SCREENCODE) values ('7','20224002','20222001');
REM INSERTING into BOOKING
SET DEFINE OFF;
REM INSERTING into CINEMA
SET DEFINE OFF;
Insert into CINEMA (CINEMACODE,CINEMANAME) values (20221001,'신촌');
Insert into CINEMA (CINEMACODE,CINEMANAME) values (20221002,'강남');
REM INSERTING into GRADENAME
SET DEFINE OFF;
Insert into GRADENAME (GRADE,GRADE_NAME) values (0,'총괄 관리자');
Insert into GRADENAME (GRADE,GRADE_NAME) values (1,'관리자');
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('test','test','test','test','01012345678','03967/서울 마포구 성미산로 51/105동 202호',1000,null);
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('test1','test','test1','test123',null,'null/null/null',1000,null);
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('A0001234@naver.com','123456q1!','A001','A001',null,'04071/서울 마포구 독막로 2/합정',1000,to_date('22/09/13','RR/MM/DD'));
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('test0002@google.com','123456q1!','test001','test002',null,'03900/서울 마포구 가양대로 1/301호',1000,null);
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('test0001@naver.com','123456q1!','test12','test12','01051513353','03967/서울 마포구 성미산로 51/105동 202호',1000,null);
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('test1234@naver.com','123456q1!','test1234','test1212',null,'03721/서울 서대문구 봉원사2길 10-2/604호',1000,to_date('22/08/24','RR/MM/DD'));
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('1234qwer@hanmail.net','123456q1!','qwer','qw22','01056454545','10488/경기 고양시 덕양구 수원문산고속도로 49/고양',1000,to_date('09/03/12','RR/MM/DD'));
Insert into MEMBER (USER_EMAIL,USER_PASSWD,USER_NAME,USER_NICK,USER_TEL,USER_ADDRESS,USER_POINT,USER_BIRTH) values ('asdf1234@naver.com','123456q1!','qweasd','123qwe','01041414141','03967/서울 마포구 성미산로 51/홍대',1000,to_date('22/08/31','RR/MM/DD'));
REM INSERTING into MOVIEDB
SET DEFINE OFF;
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('7',' 내 사랑 싸이보그','Not Quite Human 2','Eric Luke',null,'제이 언더우드 ,알랜 디크 ,로빈 리블리 ,그렉 뮬라비 ,','Jay Underwood ,Alan Thicke ,Robyn Lively ,Greg Mullavy ,','Resnick / Margellos Productions,Walt Disney Televi','미국','코메디,SF,가족',null,'91',null,null,'인조인간 칩 칼슨은 대학에서 인간학을 공부하던 중 친구로부터 여자 사귀는 법을 배운다. 드디어 매력적인 여자와 데이트를 하는데, 그녀 역시 도무지 인간 같지가 않다. 그녀는 간교한 과학자들이 칩의 컴퓨터에 바이러스를 투입하기 위해 만들어 낸 인조인간임이 밝혀지고 사랑의 덫의 걸린 칩은 그녀를 구해내기 위해 기상천외한 방식으로 적의 소탕작전을 벌인다.','null',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('6',' 여호','Gone to Earth','마이클 파웰','Michael Powell','제니퍼 존스 ,데이빗 파라 ,시릴 쿠삭 ,시빌 손디크 ,에드워드 채프만 ,에스몬드 나이트 ,휴 그리피스 ,','Jennifer Jones ,David Farrar ,Cyril Cusack ,Sybil Thorndike ,Edward Chapman ,Esmond Knight ,Hugh Griffith ,','Vanguard Films,London Film Productions','영국','드라마',null,'110',null,'짚시,여우,삼각관계','헤이젤은 모든 살아있는 생물을 사랑하는 순진한 시골소녀이다. 특히 애완동물 여우를 좋아한다. 그러나 여우를 사냥하는 시골의 대지주인 잭은 그녀를 갈망한다. 그녀가 지방의 목사와 결혼한 후에도 그의 끊임없는 애정구애는 멈추질 않는다.','null',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('20220001','mtitle1','mtitleeng1','123','123','123','123','123','123','123','123','123',to_date('22/07/01','RR/MM/DD'),'123','123','123',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('20220002','mtitle2','mtitleeng2','123','123','123','123','123','123','123','123','123',to_date('22/07/01','RR/MM/DD'),'123','123','123',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('20220003','mtitle3','mtitleeng3','123','123','123','123','123','123','123','123','123',to_date('22/07/01','RR/MM/DD'),'123','123','123',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('20220004','mtitle4','mtitleeng4','123','123','123','123','123','123','123','123','123',to_date('22/07/01','RR/MM/DD'),'123','123','123',null);
Insert into MOVIEDB (MCODE,TITLE,TITLEENG,DIRECTORNM,DIRECTORENNM,ACTORNM,ACTORENNM,COMPANY,NATION,GENRE,RATING,RUNTIME,REPRLSDATE,KEYWORDS,PLOTTEXT,KMDBURL,TRAILER) values ('20220005','mtitle5','mtitleeng5','123','123','123','123','123','123','123','123','123',to_date('22/07/01','RR/MM/DD'),'123','123','123',null);
REM INSERTING into MOVIE_COMMENT
SET DEFINE OFF;
REM INSERTING into MOVIE_COMMENT_HATE
SET DEFINE OFF;
REM INSERTING into MOVIE_COMMENT_LIKE
SET DEFINE OFF;
REM INSERTING into MOVIE_FILE
SET DEFINE OFF;
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('16',1,'c:\fileUpload\idx_playSkyard.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('20220001',3,'c:\fileUpload\roomimg.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('20220001',2,'c:\fileUpload\idx_playSkyard.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('20220001',4,'c:\fileUpload\idx_playForestPark.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('20220001',1,'c:\fileUpload\idx_playLibrary.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('6',1,'c:\fileUpload\idx_playSkyard.jpg',null);
Insert into MOVIE_FILE (MCODE,FNO,PATH,MAINPOSTER) values ('6',2,'c:\fileUpload\idx_playSkyard.jpg',null);
REM INSERTING into PERFORMANCE_SEAT
SET DEFINE OFF;
REM INSERTING into QNA
SET DEFINE OFF;
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (3,'42t2rvbfsdbdfbdfg','gyunggi','test0002@google.com',3,'bh52btw','어어어아랑ㅌ챂',to_date('22/09/16','RR/MM/DD'));
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (6,'dfbfdbfsd','gyunggi','test1234@naver.com',1,'afweqfedv','ekfekkf',to_date('22/09/16','RR/MM/DD'));
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (2,'sdfsdvs','seoul','test1234@naver.com',2,'dfbdfbfdbdfb','안녕하세요',to_date('22/09/16','RR/MM/DD'));
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (21,'sdfdsfsdfsdfsdfsdfsd','seoul','test0001@naver.com',3,'3513tfg34ge','gkdldy',to_date('22/09/20','RR/MM/DD'));
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (22,'asfsdgadghe5t4','gyunggi','test0001@naver.com',1,'sdgsdg43g4','안녕하세요',to_date('22/09/20','RR/MM/DD'));
Insert into QNA (QNO,QNA_TITLE,QNA_AREA,USER_EMAIL,QNA_QUIRYTYPE,QNA_CONTENT,RESPONSE,QNA_DATE) values (23,'sdfsdvsdfvdfsgsvb','seoul','test0001@naver.com',1,'rewrvewvrwe',null,to_date('22/09/21','RR/MM/DD'));
REM INSERTING into QNAQUIRYTYPE
SET DEFINE OFF;
Insert into QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) values (1,'일반문의');
Insert into QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) values (2,'불만');
Insert into QNAQUIRYTYPE (QUIRY_NO,QUIRYTYPE) values (3,'제안');
REM INSERTING into RATING
SET DEFINE OFF;
REM INSERTING into SCREEN
SET DEFINE OFF;
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222001',20221001,'1관');
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222002',20221001,'2관');
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222003',20221001,'3관');
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222004',20221002,'1관');
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222005',20221002,'2관');
Insert into SCREEN (SCREENCODE,CINEMACODE,SCREENNAME) values ('20222006',20221002,'3관');
REM INSERTING into SCREEN_MOVIE
SET DEFINE OFF;
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'3',null,null);
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values ('20222001','20220001',to_date('22/09/10','RR/MM/DD'),to_date('22/09/30','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values ('20222002','20220002',to_date('22/07/01','RR/MM/DD'),to_date('22/08/10','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values ('20222004','20220003',to_date('22/07/01','RR/MM/DD'),to_date('22/08/10','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values ('20222005','20220004',to_date('22/07/01','RR/MM/DD'),to_date('22/08/10','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'2',null,null);
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'4',to_date('22/09/10','RR/MM/DD'),to_date('22/09/25','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'6',to_date('22/09/10','RR/MM/DD'),to_date('22/09/25','RR/MM/DD'));
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'7',null,null);
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'16',null,null);
Insert into SCREEN_MOVIE (SCREENCODE,MCODE,STARTDATE,ENDDATE) values (null,'17',null,null);
REM INSERTING into SEAT
SET DEFINE OFF;
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224001','20222001','A','1');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224002','20222001','A','2');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224003','20222001','A','3');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224004','20222001','A','4');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224005','20222001','A','5');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224006','20222001','A','6');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224007','20222001','A','7');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224008','20222001','A','8');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224009','20222001','A','9');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224010','20222001','A','10');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224011','20222002','B','1');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224012','20222002','B','2');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224013','20222002','B','3');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224014','20222002','B','4');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224015','20222002','B','5');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224016','20222002','B','6');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224017','20222002','B','7');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224018','20222002','B','8');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224019','20222002','B','9');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224020','20222002','B','10');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224021','20222003','C','1');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224022','20222003','C','2');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224023','20222003','C','3');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224024','20222003','C','4');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224025','20222003','C','5');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224026','20222003','C','6');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224027','20222003','C','7');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224028','20222003','C','8');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224029','20222003','C','9');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224030','20222003','C','10');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224031','20222004','D','1');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224032','20222004','D','2');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224033','20222004','D','3');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224034','20222004','D','4');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224035','20222004','D','5');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224036','20222004','D','6');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224037','20222004','D','7');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224038','20222004','D','8');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224039','20222004','D','9');
Insert into SEAT (SEATCODE,SCREENCODE,SEATTYPE,SEATNO) values ('20224040','20222004','D','10');
REM INSERTING into TIME
SET DEFINE OFF;
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223001','08:10','10:00',to_date('22/07/02','RR/MM/DD'),1,'20222001','20220001');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223002','10:30','12:20',to_date('22/07/02','RR/MM/DD'),2,'20222001','20220001');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223003','14:10','16:00',to_date('22/07/02','RR/MM/DD'),3,'20222001','20220001');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223004','08:30','10:20',to_date('22/07/02','RR/MM/DD'),1,'20222002','20220002');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223005','10:40','12:30',to_date('22/07/02','RR/MM/DD'),2,'20222002','20220002');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223006','14:00','15:50',to_date('22/07/02','RR/MM/DD'),3,'20222002','20220002');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223007','08:30','10:20',to_date('22/07/02','RR/MM/DD'),1,'20222003','20220003');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223008','10:40','12:30',to_date('22/07/02','RR/MM/DD'),2,'20222003','20220003');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223009','14:00','15:50',to_date('22/07/02','RR/MM/DD'),3,'20222003','20220003');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223010','08:30','10:20',to_date('22/07/02','RR/MM/DD'),1,'20222004','20220004');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223011','10:40','12:30',to_date('22/07/02','RR/MM/DD'),2,'20222004','20220004');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223012','14:00','15:50',to_date('22/07/02','RR/MM/DD'),3,'20222004','20220004');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223013','08:30','10:20',to_date('22/07/02','RR/MM/DD'),1,'20222005','20220005');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223014','10:40','12:30',to_date('22/07/02','RR/MM/DD'),2,'20222005','20220005');
Insert into TIME (TIMECODE,STARTTIME,ENDTIME,MOVIEDATE,MOVIECOINT,SCREENCODE,MCODE) values ('20223015','14:00','15:50',to_date('22/07/02','RR/MM/DD'),3,'20222005','20220005');
REM INSERTING into WATCHLIST
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SCREEN_MOVE1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCREEN_MOVE1" ON "SCREEN_MOVIE" ("MCODE") 
  ;
--------------------------------------------------------
--  DDL for Index BOOKED_SEATS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOOKED_SEATS_PK" ON "BOOKED_SEATS" ("BOOKINGCODE", "SEATCODE", "SCREENCODE") 
  ;
--------------------------------------------------------
--  DDL for Index SCREEN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCREEN_PK" ON "SCREEN" ("SCREENCODE") 
  ;
--------------------------------------------------------
--  DDL for Index SCREEN_MOVE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCREEN_MOVE" ON "SCREEN_MOVIE" ("SCREENCODE", "MCODE") 
  ;
--------------------------------------------------------
--  DDL for Index MOVIEDB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOVIEDB_PK" ON "MOVIEDB" ("MCODE") 
  ;
--------------------------------------------------------
--  DDL for Index PERFORMANCE_SEAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERFORMANCE_SEAT" ON "PERFORMANCE_SEAT" ("SEATCODE", "TIMECODE") 
  ;
--------------------------------------------------------
--  DDL for Index CINEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA_PK" ON "CINEMA" ("CINEMACODE") 
  ;
--------------------------------------------------------
--  DDL for Index PERFORMANCE_SEAT1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERFORMANCE_SEAT1" ON "PERFORMANCE_SEAT" ("SEATCODE", "TIMECODE", "SCREENCODE") 
  ;
--------------------------------------------------------
--  Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD PRIMARY KEY ("BOOKINGCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table GRADENAME
--------------------------------------------------------

  ALTER TABLE "GRADENAME" ADD PRIMARY KEY ("GRADE") ENABLE;
--------------------------------------------------------
--  Constraints for Table QNAQUIRYTYPE
--------------------------------------------------------

  ALTER TABLE "QNAQUIRYTYPE" ADD PRIMARY KEY ("QUIRY_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TIME
--------------------------------------------------------

  ALTER TABLE "TIME" ADD PRIMARY KEY ("TIMECODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" ADD PRIMARY KEY ("SEATCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD PRIMARY KEY ("USER_EMAIL") ENABLE;
--------------------------------------------------------
--  Constraints for Table PERFORMANCE_SEAT
--------------------------------------------------------

  ALTER TABLE "PERFORMANCE_SEAT" ADD CONSTRAINT "PERFORMANCE_SEAT" PRIMARY KEY ("SEATCODE", "TIMECODE", "SCREENCODE") ENABLE;
  ALTER TABLE "PERFORMANCE_SEAT" MODIFY ("SCREENCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_COMMENT
--------------------------------------------------------

  ALTER TABLE "MOVIE_COMMENT" ADD PRIMARY KEY ("COMMENT_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table ADMIN
--------------------------------------------------------

  ALTER TABLE "ADMIN" ADD PRIMARY KEY ("ADMIN_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table BOOKED_SEATS
--------------------------------------------------------

  ALTER TABLE "BOOKED_SEATS" ADD CONSTRAINT "BOOKED_SEATS_PK" PRIMARY KEY ("BOOKINGCODE", "SEATCODE", "SCREENCODE") ENABLE;
  ALTER TABLE "BOOKED_SEATS" MODIFY ("SCREENCODE" NOT NULL ENABLE);
  ALTER TABLE "BOOKED_SEATS" MODIFY ("SEATCODE" NOT NULL ENABLE);
  ALTER TABLE "BOOKED_SEATS" MODIFY ("BOOKINGCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RATING
--------------------------------------------------------

  ALTER TABLE "RATING" ADD PRIMARY KEY ("MCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table CINEMA
--------------------------------------------------------

  ALTER TABLE "CINEMA" ADD CONSTRAINT "CINEMA_PK" PRIMARY KEY ("CINEMACODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIEDB
--------------------------------------------------------

  ALTER TABLE "MOVIEDB" MODIFY ("MCODE" NOT NULL ENABLE);
  ALTER TABLE "MOVIEDB" ADD CONSTRAINT "MOVIEDB_PK" PRIMARY KEY ("MCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD PRIMARY KEY ("QNO") ENABLE;
--------------------------------------------------------
--  Constraints for Table SCREEN
--------------------------------------------------------

  ALTER TABLE "SCREEN" ADD CONSTRAINT "SCREEN_PK" PRIMARY KEY ("SCREENCODE") ENABLE;
--------------------------------------------------------
--  Constraints for Table SCREEN_MOVIE
--------------------------------------------------------

  ALTER TABLE "SCREEN_MOVIE" ADD CONSTRAINT "SCREEN_MOVE" PRIMARY KEY ("MCODE") ENABLE;
  ALTER TABLE "SCREEN_MOVIE" MODIFY ("MCODE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "WATCHLIST" ADD PRIMARY KEY ("USER_EMAIL") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOKING
--------------------------------------------------------

  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_EMAIL_FK" FOREIGN KEY ("USER_EMAIL")
	  REFERENCES "MEMBER" ("USER_EMAIL") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE")
	  REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_TIMECODE_FK" FOREIGN KEY ("TIMECODE")
	  REFERENCES "TIME" ("TIMECODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOOKING" ADD CONSTRAINT "BOOKING_mcode_FK" FOREIGN KEY ("MCODE")
	  REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QNA
--------------------------------------------------------

  ALTER TABLE "QNA" ADD CONSTRAINT "QNA_QUIRYTYPE_FK" FOREIGN KEY ("QNA_QUIRYTYPE")
	  REFERENCES "QNAQUIRYTYPE" ("QUIRY_NO") ON DELETE SET NULL ENABLE;
  ALTER TABLE "QNA" ADD CONSTRAINT "QNA_WRITER_FK" FOREIGN KEY ("USER_EMAIL")
	  REFERENCES "MEMBER" ("USER_EMAIL") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SCREEN
--------------------------------------------------------

  ALTER TABLE "SCREEN" ADD CONSTRAINT "SCREEN_CINEMACODE_FK" FOREIGN KEY ("CINEMACODE")
	  REFERENCES "CINEMA" ("CINEMACODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SEAT" ADD CONSTRAINT "SEAT_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE")
	  REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIME
--------------------------------------------------------

  ALTER TABLE "TIME" ADD CONSTRAINT "TIME_SCREENCODE_FK" FOREIGN KEY ("SCREENCODE")
	  REFERENCES "SCREEN" ("SCREENCODE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "TIME" ADD CONSTRAINT "TIME_mcode_FK" FOREIGN KEY ("MCODE")
	  REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "WATCHLIST" ADD CONSTRAINT "WL_mcode_FK" FOREIGN KEY ("MCODE")
	  REFERENCES "MOVIEDB" ("MCODE") ON DELETE CASCADE ENABLE;
