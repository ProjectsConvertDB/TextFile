-- 데이터베이스 생성 및 권한 부여
CREATE USER momento IDENTIFIED BY momento;
GRANT resource, CONNECT TO momento;

-- 글 번호 증가를 위한 시퀀스 생성
CREATE SEQUENCE seq_board;

-- 공지사항 테이블 생성
CREATE TABLE tbl_board (
  bno					NUMBER(10,0),
  title					VARCHAR2(200)				NOT NULL,
  content			VARCHAR2(2000)			NOT NULL,
  regdate			DATE,
  updatedate	DATE,
  referrals			NUMBER(10,0)					DEFAULT 0,
  views				NUMBER(10,0)					DEFAULT 0,
  fixed				CHAR(1)								DEFAULT	'0',
  deleted			CHAR(1)								DEFAULT '0',
  deldate			DATE
);

-- 기본키 지정
ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY (bno);

SELECT * FROM tbl_board;

-- 파일 업로드 테이블 생성
CREATE TABLE tbl_attach (
		uuid								varchar2(100)	,
		uploadPath					varchar2(200)	NOT NULL,
		fileName						varchar2(100)		NOT NULL,
		filetype							char(1)					DEFAULT 'I',
		bno									number(10, 0)
);

-- 기본키 외래키 생성
ALTER TABLE tbl_attach ADD CONSTRAINT pk_attach PRIMARY KEY (uuid);
ALTER TABLE tbl_attach ADD CONSTRAINT fk_board_attach FOREIGN KEY (bno) REFERENCES tbl_board(bno);
