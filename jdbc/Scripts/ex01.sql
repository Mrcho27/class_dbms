DROP SEQUENCE SEQ_USER;

CREATE TABLE TBL_USER(
	USER_ID NUMBER,
	LOGIN_ID VARCHAR2(1000),
	PASSWORD VARCHAR2(1000),
	NAME VARCHAR2(300),
	AGE NUMBER,
	GENDER CHAR(1) DEFAULT 'N',
	BIRTH DATE,
	CONSTRAINT PK_USER PRIMARY KEY(USER_ID)
);

CREATE SEQUENCE SEQ_USER;

INSERT INTO TBL_USER
(USER_ID, LOGIN_ID, PASSWORD, NAME, AGE, GENDER, BIRTH)
VALUES(SEQ_USER.NEXTVAL, 'aaa', '1234', '홍길동', 22, 'M', '20000101');

INSERT INTO TBL_USER
(USER_ID, LOGIN_ID, PASSWORD, NAME, AGE, GENDER, BIRTH)
VALUES(SEQ_USER.NEXTVAL, 'bbb', '1234', '이유리', 24, 'F', '19990102');

INSERT INTO TBL_USER
(USER_ID, LOGIN_ID, PASSWORD, NAME, AGE, GENDER, BIRTH)
VALUES(SEQ_USER.NEXTVAL, 'ccc', '1234', '김철수', 32, 'M', '19881102');

SELECT * FROM TBL_USER;


INSERT INTO TBL_USER(USER_ID, LOGIN_ID, PASSWORD, NAME, AGE, GENDER, BIRTH)
VALUES(0, '', '', '', 0, 'N', '');

UPDATE TBL_USER
SET LOGIN_ID='', PASSWORD='', NAME='', AGE=0, GENDER='N', BIRTH=''
WHERE USER_ID=0;

SELECT USER_ID, LOGIN_ID, PASSWORD, NAME, AGE, GENDER, BIRTH
FROM TBL_USER
WHERE USER_ID = 1;


