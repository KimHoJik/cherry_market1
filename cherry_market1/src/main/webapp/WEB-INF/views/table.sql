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

-- 게시글을 저장할 테이블 
CREATE TABLE cherryboard(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE --글 작성일
);
-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE cherryboard_seq; 

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE cherryfile(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
	saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
	fileSize NUMBER NOT NULL, -- 파일의 크기 
	regdate DATE
);

CREATE SEQUENCE cherryfile_seq; 

-- 이미지 겔러리를 만들기 위한 테이블 
CREATE TABLE cherrygallery(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(100), -- 이미지에 대한 설명
	imagePath VARCHAR2(400), -- 업로드된 이미지의 경로  ex) /upload/xxx.jpg
	regdate DATE -- 이미지 업로드 날짜 
);

CREATE SEQUENCE cherrygallery_seq;

