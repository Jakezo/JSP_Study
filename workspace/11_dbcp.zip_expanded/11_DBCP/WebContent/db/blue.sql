/* database xe �븞�쑉硫� �뜑釉뷀겢由� �빐蹂닿린.. */
DROP TABLE BLUE;
CREATE TABLE BLUE
(
	NO NUMBER PRIMARY KEY,
	WRITER VARCHAR2(100),
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(4000),
	FILENAME VARCHAR2(300),
	POSTDATE DATE
);
/* �떆���뒪留뚮뱾湲�... */
DROP SEQUENCE BLUE_SEQ;
CREATE SEQUENCE BLUE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

