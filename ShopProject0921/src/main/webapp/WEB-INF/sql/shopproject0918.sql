--------------------------------------------------------
--  파일이 생성됨 - 일요일-9월-18-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence NOTICENO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NOTICENO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTICEREPLYNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NOTICEREPLYNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NTPHOTONO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "NTPHOTONO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRPHOTONO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PRPHOTONO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNA_QNO
--------------------------------------------------------

   CREATE SEQUENCE  "QNA_QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "CART" 
   (	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE), 
	"QUANTITY" NUMBER, 
	"GUESTTELNO" VARCHAR2(200 BYTE), 
	"COLORNO" VARCHAR2(200 BYTE), 
	"SIZENO" VARCHAR2(200 BYTE), 
	"CARTDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table COLOR
--------------------------------------------------------

  CREATE TABLE "COLOR" 
   (	"COLORNO" VARCHAR2(200 BYTE), 
	"COLORNAME" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table GUEST
--------------------------------------------------------

  CREATE TABLE "GUEST" 
   (	"GUESTTELNO" VARCHAR2(200 BYTE), 
	"GUESTPW" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table GUESTORDER
--------------------------------------------------------

  CREATE TABLE "GUESTORDER" 
   (	"GUESTORDERNO" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"ORDERQUANTITY" NUMBER, 
	"PRICESUM" NUMBER, 
	"POSTNO" VARCHAR2(200 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"ADDRESSDETAIL" VARCHAR2(200 BYTE), 
	"GUESTTELNO" VARCHAR2(200 BYTE), 
	"GUESTNAME" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table GUESTREFUND
--------------------------------------------------------

  CREATE TABLE "GUESTREFUND" 
   (	"REFUNDNO" VARCHAR2(200 BYTE), 
	"GUESTORDERNO" VARCHAR2(200 BYTE), 
	"REFUNDREASON" VARCHAR2(200 BYTE), 
	"REASONPHOTO" VARCHAR2(200 BYTE), 
	"GUESTTELNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MANAGER
--------------------------------------------------------

  CREATE TABLE "MANAGER" 
   (	"MANAGERID" VARCHAR2(40 BYTE), 
	"PW" VARCHAR2(40 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"MEMBERID" VARCHAR2(200 BYTE), 
	"PW" VARCHAR2(200 BYTE), 
	"MEMBERNAME" VARCHAR2(200 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"BIRTHDATE" DATE, 
	"MEMBERTELNO" VARCHAR2(200 BYTE), 
	"WITHDRAW" VARCHAR2(200 BYTE), 
	"GENDER" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBERORDER
--------------------------------------------------------

  CREATE TABLE "MEMBERORDER" 
   (	"MEMBERORDERNO" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE), 
	"ORDERQUANTITY" NUMBER, 
	"PRICESUM" NUMBER, 
	"POSTNO" VARCHAR2(200 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"ADDRESSDETAIL" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBERREFUND
--------------------------------------------------------

  CREATE TABLE "MEMBERREFUND" 
   (	"REFUNDNO" VARCHAR2(200 BYTE), 
	"MEMBERORDERNO" VARCHAR2(200 BYTE), 
	"REFUNDREASON" VARCHAR2(200 BYTE), 
	"REASONPHOTO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NOTICE" 
   (	"NOTICENO" VARCHAR2(200 BYTE), 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(3500 BYTE), 
	"WRITER" VARCHAR2(200 BYTE), 
	"WDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table NOTICEPHOTO
--------------------------------------------------------

  CREATE TABLE "NOTICEPHOTO" 
   (	"PHOTONO" VARCHAR2(200 BYTE), 
	"PHOTOPATH" VARCHAR2(200 BYTE), 
	"NOTICENO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table NOTICEREPLY
--------------------------------------------------------

  CREATE TABLE "NOTICEREPLY" 
   (	"NOTICENO" VARCHAR2(200 BYTE), 
	"REPLYFORNO" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"RDATE" DATE, 
	"WRITER" VARCHAR2(200 BYTE), 
	"REPLYNO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODREVIEWREPLY
--------------------------------------------------------

  CREATE TABLE "PRODREVIEWREPLY" 
   (	"REVIEWNO" VARCHAR2(200 BYTE), 
	"MANAGERWRITER" VARCHAR2(200 BYTE), 
	"REVIEWREPLYCONTENT" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"CATEGORYNO" VARCHAR2(200 BYTE), 
	"SIZENO" VARCHAR2(200 BYTE), 
	"PRODUCTNAME" VARCHAR2(200 BYTE), 
	"RECEIVNGDATE" DATE, 
	"PRODUCTSTOCK" NUMBER, 
	"INQUANTITY" NUMBER, 
	"COST" NUMBER, 
	"PRICE" NUMBER, 
	"COLORNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCTCATEGORY
--------------------------------------------------------

  CREATE TABLE "PRODUCTCATEGORY" 
   (	"CATEGORYNO" VARCHAR2(200 BYTE), 
	"CATEGORYNAME" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCTINQUIRY
--------------------------------------------------------

  CREATE TABLE "PRODUCTINQUIRY" 
   (	"PRODUCTINQNO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE), 
	"PRODUCTINQCONT" VARCHAR2(200 BYTE), 
	"PRODINQRE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCTPHOTO
--------------------------------------------------------

  CREATE TABLE "PRODUCTPHOTO" 
   (	"PRODUCTPHOTONO" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"PHOTOPATH" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCTREVIEW
--------------------------------------------------------

  CREATE TABLE "PRODUCTREVIEW" 
   (	"REVIEWNO" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE), 
	"BUYWRITER" VARCHAR2(200 BYTE), 
	"PRODUCTSCORE" NUMBER, 
	"PRODUCTCONTENT" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"QNO" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE), 
	"QNACONTENT" VARCHAR2(200 BYTE), 
	"TITLE" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QNAREPLY
--------------------------------------------------------

  CREATE TABLE "QNAREPLY" 
   (	"QNO" VARCHAR2(200 BYTE), 
	"QNARECONTENT" VARCHAR2(200 BYTE), 
	"WRITER" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SIZES
--------------------------------------------------------

  CREATE TABLE "SIZES" 
   (	"SIZENO" VARCHAR2(200 BYTE), 
	"SIZEKIND" VARCHAR2(200 BYTE), 
	"PRODUCTNO" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table WISHLIST
--------------------------------------------------------

  CREATE TABLE "WISHLIST" 
   (	"PRODUCTNAME" VARCHAR2(200 BYTE), 
	"MEMBERID" VARCHAR2(200 BYTE), 
	"COLORNO" VARCHAR2(20 BYTE), 
	"SIZENO" VARCHAR2(20 BYTE), 
	"WISHDATE" DATE, 
	"STOCK" NUMBER
   ) ;
REM INSERTING into CART
SET DEFINE OFF;
Insert into CART (PRODUCTNO,MEMBERID,QUANTITY,GUESTTELNO,COLORNO,SIZENO,CARTDATE) values ('P0001','A0001',3,null,null,null,null);
Insert into CART (PRODUCTNO,MEMBERID,QUANTITY,GUESTTELNO,COLORNO,SIZENO,CARTDATE) values ('P0003','heshah@naver.com',5,null,null,null,null);
Insert into CART (PRODUCTNO,MEMBERID,QUANTITY,GUESTTELNO,COLORNO,SIZENO,CARTDATE) values ('P0002','A0001',12,null,null,null,null);
Insert into CART (PRODUCTNO,MEMBERID,QUANTITY,GUESTTELNO,COLORNO,SIZENO,CARTDATE) values ('P0003','A0001',5,null,null,null,null);
REM INSERTING into COLOR
SET DEFINE OFF;
Insert into COLOR (COLORNO,COLORNAME,PRODUCTNO) values ('0','black','P0001');
Insert into COLOR (COLORNO,COLORNAME,PRODUCTNO) values ('255','white','P0002');
Insert into COLOR (COLORNO,COLORNAME,PRODUCTNO) values ('1','blue','P0003');
REM INSERTING into GUEST
SET DEFINE OFF;
REM INSERTING into GUESTORDER
SET DEFINE OFF;
REM INSERTING into GUESTREFUND
SET DEFINE OFF;
REM INSERTING into MANAGER
SET DEFINE OFF;
Insert into MANAGER (MANAGERID,PW) values ('M0001','123456');
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (MEMBERID,PW,MEMBERNAME,ADDRESS,BIRTHDATE,MEMBERTELNO,WITHDRAW,GENDER) values ('A0001','123456','김철수','서울시',to_date('80/08/19','RR/MM/DD'),'010-1234-1234','N','M');
Insert into MEMBER (MEMBERID,PW,MEMBERNAME,ADDRESS,BIRTHDATE,MEMBERTELNO,WITHDRAW,GENDER) values ('A0002','123456','홍길동','경기도',to_date('97/02/01','RR/MM/DD'),'010-2345-6789','N','M');
Insert into MEMBER (MEMBERID,PW,MEMBERNAME,ADDRESS,BIRTHDATE,MEMBERTELNO,WITHDRAW,GENDER) values ('T0001',null,'Tester01',null,null,null,null,null);
Insert into MEMBER (MEMBERID,PW,MEMBERNAME,ADDRESS,BIRTHDATE,MEMBERTELNO,WITHDRAW,GENDER) values ('heshah@naver.com',null,'황상혁',null,null,null,null,null);
REM INSERTING into MEMBERORDER
SET DEFINE OFF;
Insert into MEMBERORDER (MEMBERORDERNO,PRODUCTNO,MEMBERID,ORDERQUANTITY,PRICESUM,POSTNO,ADDRESS,ADDRESSDETAIL) values ('MO001','P0001','A0001',10,26000,'12300','서울시','OO구 OO동');
Insert into MEMBERORDER (MEMBERORDERNO,PRODUCTNO,MEMBERID,ORDERQUANTITY,PRICESUM,POSTNO,ADDRESS,ADDRESSDETAIL) values ('MO001','P0001','A0001',50,123000,'12300','서울시','OO구 OO동 asdfasdfasdfasdfasdfasdfafsd');
Insert into MEMBERORDER (MEMBERORDERNO,PRODUCTNO,MEMBERID,ORDERQUANTITY,PRICESUM,POSTNO,ADDRESS,ADDRESSDETAIL) values ('MO001','P0001','A0001',50,123000,'12300','서울 asdfasdfasdfasdfasdfasdfafsddfasd시','OO구 OO동 asdfasdfasdfasdfasdfasdfafsd');
REM INSERTING into MEMBERREFUND
SET DEFINE OFF;
REM INSERTING into NOTICE
SET DEFINE OFF;
REM INSERTING into NOTICEPHOTO
SET DEFINE OFF;
REM INSERTING into NOTICEREPLY
SET DEFINE OFF;
REM INSERTING into PRODREVIEWREPLY
SET DEFINE OFF;
REM INSERTING into PRODUCT
SET DEFINE OFF;
Insert into PRODUCT (PRODUCTNO,CATEGORYNO,SIZENO,PRODUCTNAME,RECEIVNGDATE,PRODUCTSTOCK,INQUANTITY,COST,PRICE,COLORNO) values ('P0002','1100','100','하얀색 후드티',to_date('22/08/05','RR/MM/DD'),100,20,12000,15000,'255');
Insert into PRODUCT (PRODUCTNO,CATEGORYNO,SIZENO,PRODUCTNAME,RECEIVNGDATE,PRODUCTSTOCK,INQUANTITY,COST,PRICE,COLORNO) values ('P0001','1100','100','검정 반팔 티셔츠',to_date('22/09/01','RR/MM/DD'),10,100,5000,12000,'0');
Insert into PRODUCT (PRODUCTNO,CATEGORYNO,SIZENO,PRODUCTNAME,RECEIVNGDATE,PRODUCTSTOCK,INQUANTITY,COST,PRICE,COLORNO) values ('P0003','1200','95','청바지',to_date('22/08/23','RR/MM/DD'),25,15,13000,15000,'1');
REM INSERTING into PRODUCTCATEGORY
SET DEFINE OFF;
REM INSERTING into PRODUCTINQUIRY
SET DEFINE OFF;
REM INSERTING into PRODUCTPHOTO
SET DEFINE OFF;
Insert into PRODUCTPHOTO (PRODUCTPHOTONO,PRODUCTNO,PHOTOPATH) values ('27','P0003','img/product/blue_jean_1.jpg');
Insert into PRODUCTPHOTO (PRODUCTPHOTONO,PRODUCTNO,PHOTOPATH) values ('24','P0001','img/product/black_t_shirt.jpg');
Insert into PRODUCTPHOTO (PRODUCTPHOTONO,PRODUCTNO,PHOTOPATH) values ('25','P0001','img/product/black_t_shirt2.jpg');
Insert into PRODUCTPHOTO (PRODUCTPHOTONO,PRODUCTNO,PHOTOPATH) values ('26','P0002','img/product/hood_t1.jpg');
REM INSERTING into PRODUCTREVIEW
SET DEFINE OFF;
REM INSERTING into QNA
SET DEFINE OFF;
Insert into QNA (QNO,MEMBERID,QNACONTENT,TITLE) values ('6','A0001','ㅁㄴㅇㄹㅁㄴㅇㄹㅁㅇ','ㅁㄴㅇㄹㅁㅇ');
Insert into QNA (QNO,MEMBERID,QNACONTENT,TITLE) values ('7','A0001','ㅁㄴㅇㄹㅁㄴㅇㄹㅁㅇ','ㅁㄴㅇㄹㅁㅇ');
Insert into QNA (QNO,MEMBERID,QNACONTENT,TITLE) values ('8','A0001','asddfqwer','ㄴㅇㅁㄼqwer');
Insert into QNA (QNO,MEMBERID,QNACONTENT,TITLE) values ('9','A0001','asdfasdf','adsf');
REM INSERTING into QNAREPLY
SET DEFINE OFF;
Insert into QNAREPLY (QNO,QNARECONTENT,WRITER) values ('6','테스트 qna reply','A0001');
REM INSERTING into SIZES
SET DEFINE OFF;
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('85','XS','P0001');
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('90','S','P0002');
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('95','M','P0003');
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('100','L','P0004');
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('105','XL','P0005');
Insert into SIZES (SIZENO,SIZEKIND,PRODUCTNO) values ('110','XXL','P0006');
REM INSERTING into WISHLIST
SET DEFINE OFF;
