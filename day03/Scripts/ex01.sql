CREATE TABLE USERS(
	NAME VARCHAR2(1000),
	AGE NUMBER
);

-- 테이블 수정

-- 테이블 이름 수정
ALTER TABLE USERS RENAME TO TBL_USER;
-- 칼럼 추가
ALTER TABLE TBL_USER ADD(GENDER CHAR(1));

-- 칼럼명 수정
ALTER TABLE TBL_USER RENAME COLUMN NAME TO NICKNAME;

-- 칼럼 삭제
ALTER TABLE TBL_USER DROP COLUMN GENDER;

--칼럼 타입 수정
ALTER TABLE TBL_USER MODIFY(NICKNAME VARCHAR2(300));

--TRUNCATE 사용하기
INSERT INTO TBL_USER
VALUES('A',11);

INSERT INTO TBL_USER
VALUES('B',22);

TRUNCATE TABLE TBL_USER ;

DELETE FROM TBL_USER; 

SELECT *FROM TBL_USER ;

--DROP 사용하기
DROP TABLE TBL_USER;

/*
 * [실습]
 * 자동차 테이블 생성
 * - 자동차 번호
 * - 브랜드
 * - 출시 날짜
 * - 색상
 * - 가격
 */
CREATE TABLE CAR(
	CARNUMBER NUMBER,
	BRAND VARCHAR2(1000),
	CARDATE VARCHAR2(1000),
	COLOR VARCHAR2(1000),
	PRICE NUMBER
);

ALTER TABLE CAR ADD CONSTRAINT PK_CAR PRIMARY KEY(CAR_ID);
/*
 * ALTER TABLE CAR : 테이블을 수정하겠다. CAR테이블
 * ADD CONSTRAINT : 제약조건을 추가하겠다.
 * PK_CAR : 제약조건의 이름 설정
 * PRIMARY KEY(CAR_ID) : PK라는 제약조건을 (CAR_ID)칼럼에
 */

ALTER TABLE CAR DROP CONSTRAINT PK_CAR;

---------------------------------
DROP TABLE CAR;

-- 테이블 생성할 때 제약조건을 추가할 수 있다.
-- 제약조건의 이름을 설정하지 않으면 오라클이 자동으로 만들어준다.
CREATE TABLE CAR(
	CAR_ID NUMBER PRIMARY KEY,
	BRAND VARCHAR2(1000),
	CAR_DATE DATE,
	COLOR VARCHAR2(1000),
	PRICE NUMBER
);

-- 제약조건의 이름을 설정하지 않으면 나중에 제약조건 관리가 힘들기 때문에
-- 이름을 설정해주는 것이 좋다.
-- PK_테이블명 으로 이름을 지어주면 우리가 직접 확인하지 않아도
-- PK를 관리하기 편하다.
CREATE TABLE CAR(
	CAR_ID NUMBER CONSTRAINT PK_CAR PRIMARY KEY,
	BRAND VARCHAR2(1000),
	CAR_DATE DATE,
	COLOR VARCHAR2(1000),
	PRICE NUMBER
);

/*
 * [실습]
 * 동물 테이블 생성
 * 고유 번호
 * 종류
 * 나이
 * 먹이(문자열)
 */
CREATE TABLE ANIMAL(
	ANIMAL_ID NUMBER,
	KIND VARCHAR2(300),
	AGE NUMBER,
	FEED VARCHAR2(300)
);
-- 제약조건 추가(PK)
ALTER  TABLE ANIMAL ADD CONSTRAINT PK_ANIMAL PRIMARY KEY(ANIMAL_ID)

-- 제약조건 삭제(PK)
ALTER TABLE ANIMAL  DROP CONSTRAINT PK_ANIMAL;

-- 칼럼 추가(성별)
ALTER TABLE ANIMAL ADD(GENDER CHAR(1));

-- 칼럼 이름 수정(고유 번호)
ALTER TABLE ANIMAL RENAME COLUMN ANIMAL_ID TO ANIMAL_ID2;

-- 칼럼 삭제(먹이)
ALTER TABLE ANIMAL DROP COLUMN FEED;

-- 칼럼 수정(종류 칼럼의 자료형을 변경)
ALTER TABLE ANIMAL MODIFY(KIND NUMBER);

-- 동물 테이블 삭제
DROP TABLE ANIMAL; 

SELECT *FROM ANIMAL;

----------------------------------------------------------
CREATE TABLE PRODUCT(
	PRODUCT_ID NUMBER CONSTRAINT PK_PRODUCT PRIMARY KEY,
	NAME VARCHAR2(1000),
	PRICE NUMBER
);

INSERT INTO PRODUCT(PRODUCT_ID, NAME, PRICE)
VALUES(1,'아이패드 에어',10000);

-- 오류
-- 상품 ID는 PK라서 중복허용이 안된다!!
INSERT INTO PRODUCT(PRODUCT_ID, NAME, PRICE)
VALUES(1,'갤럭시 워치',20000);

-- 오류 발생
-- PK 칼럼에는 NULL을 허용하지 않는다!!
INSERT INTO PRODUCT(PRODUCT_ID, NAME, PRICE)
VALUES(NULL,'갤럭시 워치',20000);











