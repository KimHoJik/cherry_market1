-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	num NUMBER PRIMARY KEY,
	id VARCHAR2(100) NOT NULL,
	name VARCHAR2(100),
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
	addr VARCHAR2(100),
	regdate DATE
);
CREATE SEQUENCE users_seq;
--상품 정보 저장 테이블
CREATE TABLE goods(
	num NUMBER PRIMARY KEY,
	id VARCHAR2(100),
	price NUMBER,
	title VARCHAR2(100),
	regdate DATE,
	isSaled NUMBER,
	category VARCHAR2(30),
	viewCount NUMBER,
	imagepath VARCHAR2(1000),
	explain	VARCHAR2(4000)
	);
CREATE SEQUENCE goods_seq;
--찜목록 정보 저장 테이블
create table wishlist(num number,id varchar2(100),regdate date);
--오픈쳇 로그
create table openchatlog(id varchar2(100),ocregdate number,occomment varchar2(400));

create table perchatlog(num number,saller varchar2(100),buyer varchar2(100),talker varchar2(100),pccomment varchar2(400),regdate number)

create table perchatlist(num number,saller varchar2(100),buyer varchar2(100),lastcomment varchar2(400),lastregdate number)