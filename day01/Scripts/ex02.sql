--테이블 칼럼명을 별칭(별명)으로 설정하기
SELECT FIRST_NAME AS "이름",
	LAST_NAME AS "성",
	SALARY AS "봉급",
	EMPLOYEE_ID AS "사원 번호" 
FROM EMPLOYEES ;


-- AS 생략 가능
-- "" 생략 가능
-- 만약 별칭에 띄어쓰기가 포함되어 있다면 ""생략 불가능!
SELECT FIRST_NAME  이름,
	LAST_NAME  성,
	SALARY  봉급,
	EMPLOYEE_ID "사원 번호" 
FROM EMPLOYEES ;

-- 사원의 이름, 성, 봉급을 봉급 내림차순으로 정렬하여 조회
-- 별칭을 사용하기
SELECT FIRST_NAME 이름,
	LAST_NAME 성,
	SALARY 봉급
FROM EMPLOYEES e
ORDER BY 봉급 DESC ;

--연결 연산자

-- DUAL 테이블 : 다른 테이블 참조할 필요가 없이
-- 값을 확인하고 싶을 때 사용할 수 있는 테이블
SELECT 10 || 20 FROM DUAL;

-- 문자열 연결도 가능
SELECT '안녕' || '하세요' 연습 FROM DUAL;

-- 테이블의 칼럼끼리 연결 가능
SELECT FIRST_NAME  || LAST_NAME 사원이름
FROM EMPLOYEES e ;

-- 날짜 타입도 연결 가능
SELECT HIRE_DATE || '안녕'
FROM EMPLOYEES e ;

-- [실습]
-- 사원의 이름과 메일주소를 조회한다.
-- 사원 이름 : FIRST_NAME과 LAST_NAME이 띄어쓰기로 이어져 있다.
-- 메일 주소 : 사원이메일@koreait.com 이다.
-- 칼럼 별칭 부여해서 조회하기
SELECT FIRST_NAME || ' ' || LAST_NAME "사원 이름",
	EMAIL || '@koreait.com' "메일 주소"
FROM EMPLOYEES e ;

-- 산술연산자
SELECT EMPLOYEE_ID ,
	EMPLOYEE_ID  +10,
	EMPLOYEE_ID  -10,
	EMPLOYEE_ID  *2,
	EMPLOYEE_ID  /2
FROM EMPLOYEES e ;

-- [실습]
-- 직원의 이름, 봉급, 인상 봉급, 감축 봉급을 조회
-- 이름은 성과 함께 띄어쓰기로 연결되어 있다.
-- 인상 봉급은 기존 봉급의 10% 증가
-- 감축 봉급은 기존 봉급의 10% 감소
-- 결과를 기존 봉급 오름차순으로 정렬하여 조회

SELECT FIRST_NAME || ' ' ||LAST_NAME  이름,
	SALARY 봉급,
	SALARY *1.1 "인상 봉급",
	SALARY *0.9 "감축 봉급"
FROM EMPLOYEES e 
ORDER BY 봉급 ;

-- 날짜타입의 산술 연산

-- 1. 날짜와 숫자
SELECT HIRE_DATE ,
	HIRE_DATE +10,
	HIRE_DATE -10
FROM EMPLOYEES e ;

-- SYSDATE
-- 현재 날짜와 시간정보를 가지고 있으며
-- 오라클에서 기본적으로 제공한다.
SELECT SYSDATE FROM DUAL;

-- 날짜와 날짜의 연산
-- 날짜 - 날짜 : 몇일이 지났는지 결과로 나온다.
-- 연산의 결과는 숫자 타입이다.
SELECT HIRE_DATE ,
	SYSDATE ,
	SYSDATE - HIRE_DATE 
--	SYSDATE  + HIRE_DATE 오류 난다.
FROM EMPLOYEES e ;

-- 날짜와 숫자의 연산에서 기본적으로 숫자는 일 수를 의미
-- 시간, 분 다위로 연산하고 싶다면 일(24h)로 환산해야 함 
SELECT SYSDATE,
	SYSDATE + 0.5,
	SYSDATE - 12/24, -- 12시간
	SYSDATE - 1/24, -- 1시간
	SYSDATE - 30/60/24 -- 30분
FROM DUAL;

-- 행 골라내기
-- 전체 사원 중에 봉급이 10,000 이상인 직원 정보만 조회
SELECT FIRST_NAME ,LAST_NAME ,SALARY 
FROM EMPLOYEES e 
WHERE SALARY >= 10000
ORDER BY SALARY ;

--[실습]
-- 직원의 이름, 성을 조회한다.
-- 단, 이름이 David인 직원만 골라서 조회
SELECT FIRST_NAME ,LAST_NAME 
FROM EMPLOYEES e 
WHERE FIRST_NAME = 'David';

-- 별칭을 설정할 경우
-- 명령어들의 순서를 잘 생각해야한다.
SELECT FIRST_NAME 이름,	-- 3. 각 칼럼에 별칭을 붙여서 조회
	LAST_NAME 성,
	SALARY 봉급
FROM EMPLOYEES e 		-- 1. EMPLOYEES 테이블에서
WHERE SALARY  >= 10000	-- 2. 봉급을 찾아서 10000 이상만
ORDER BY 봉급;			-- 4. 봉급 오름차순으로 정렬

-------------------------------------------------------

-- SQL 연산자

/*
 * 사원 테이블에서 
 * 봉급이 10000이상, 12000 이하인 직원의
 * 이름, 성, 봉급을 봉급 오름차순으로 조회
 */

SELECT FIRST_NAME ,LAST_NAME ,SALARY 
FROM EMPLOYEES e 
WHERE SALARY BETWEEN 10000 AND 12000
ORDER BY SALARY ;

/*
 * 사원 테이블에서 봉급이 10000 또는 11000 또는 12000인 직원의
 * 이름, 성, 봉급을 봉급 오름차순으로 정렬하여 조회 
 */

SELECT FIRST_NAME, LAST_NAME ,SALARY 
FROM EMPLOYEES e 
WHERE  SALARY IN(10000, 11000, 12000)
ORDER BY SALARY ;

-- LIKE
-- % : ~아무거나
-- _ : 자릿수

SELECT FIRST_NAME 
FROM EMPLOYEES e 
WHERE  FIRST_NAME LIKE 'D%';

SELECT FIRST_NAME 
FROM EMPLOYEES e 
WHERE  FIRST_NAME LIKE '____e';

SELECT FIRST_NAME 
FROM EMPLOYEES e 
WHERE  FIRST_NAME LIKE '%e%';

SELECT FIRST_NAME 
FROM EMPLOYEES e 
WHERE  FIRST_NAME LIKE '%e_n%';

-- NULL :값이 없음을 나타내는 값
-- NULL은 연산하면 결과가 NULL이다.
SELECT NULL + 10 FROM DUAL;

-- 사원테이블에서 커미션이 NULL인 직원의
-- 이름, 성, 커미션을 조회
SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT  IS NULL;



SELECT FIRST_NAME , LAST_NAME , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT  IS NOT NULL;

------------------------------------------------

-- ANY(a, b, c,...) : a, b, c중 아무거나 만족하면
SELECT SALARY
FROM EMPLOYEES e 
WHERE SALARY = ANY(10000, 11000, 12000);

-- ALL(a, b, c,...) : a, b, c를 모두 만족하면
SELECT SALARY
FROM EMPLOYEES e 
WHERE SALARY > ALL(10000, 11000, 12000);

-- 논리연산자
/*
 * 사원 테이블에서
 * 부서가 영업부서이면서, 봉급이 10000 이상인 직원들의
 * 이름, 성, 봉급, 부서id를 봉급 오름차순으로 조회
 */
SELECT FIRST_NAME , LAST_NAME , SALARY , DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 80 AND SALARY >= 10000
ORDER BY SALARY ;


SELECT FIRST_NAME ,LAST_NAME ,SALARY 
FROM EMPLOYEES e 
WHERE SALARY >= 10000 AND SALARY <=12000
ORDER BY SALARY ;

SELECT FIRST_NAME ,SALARY 
FROM EMPLOYEES e 
WHERE NOT FIRST_NAME LIKE 'David'

---------------------------------------------------
CREATE TABLE TBL_MEMBER(
	NAME VARCHAR2(1000),
	AGE NUMBER
);

SELECT * FROM TBL_MEMBER tm ;

INSERT INTO TBL_MEMBER(NAME,AGE)
VALUES('김철수',20);

INSERT INTO TBL_MEMBER
VALUES('홍길동',24);

-- 특정 칼럼만 골라서 INSERT 할 수 있다.
INSERT INTO TBL_MEMBER(NAME)
VALUES('김영희');

INSERT INTO TBL_MEMBER
VALUES('이유리');

---------------------------------
INSERT INTO TBL_MEMBER(AGE,NAME)
VALUES(11,'아무무');

INSERT INTO TBL_MEMBER
VALUES(11,'아무무');

-- UPDATE 쿼리를 날릴때 WHERE를 생략하면
-- 해당 칼럼의 전체 데이터가 수정된다.
-- WHERE절을 사용하여 특정 행만 수정되도록 해야한다.
UPDATE TBL_MEMBER  
SET NAME = '홍길동'
WHERE AGE = 24;

-- 삭제
-- DELETE를 사용할 때 WHERE로 특정 행을 지정하지 않으면
-- 전체 데이터가 삭제된다.

DELETE FROM TBL_MEMBER
WHERE NAME = '김철수';

DELETE FROM TBL_MEMBER;

SELECT * FROM TBL_MEMBER tm ;

CREATE  TABLE TBL_STUDENT(
	STUDENT_ID NUMBER,
	NAME VARCHAR2(1000),
	MATH NUMBER,
	ENG NUMBER,
	KOR NUMBER,
	GRADE VARCHAR2(1000)
); 

SELECT * FROM  TBL_STUDENT;

/*
[실습]
학생 테이블에 데이터를 추가한다.
학생번호, 이름, 수학, 영어, 국어
1, '김철수', 90, 90, 90
2, '홍길동', 70, 25, 55
3, '이유리', 89, 91, 77
4, '김웅이', 48, 100, 92
5, '신짱구', 22, 13, 9
*/
INSERT INTO TBL_STUDENT(STUDENT_ID,NAME,MATH,ENG,KOR)
VALUES (5, '신짱구', 22, 13, 9);

SELECT * FROM TBL_STUDENT;
/*
 * [실습]
 * 전체 학생들의 이름과 평균점수 조회 (별칭 넣기)
 */
SELECT NAME 이름,
	(MATH + ENG  + KOR) /3 평균
FROM TBL_STUDENT ts; 
/*
 * [실습]
 * 학생의 평균점수를 구하고 학점을 수정하기
 * A : 90점 이상
 * B : 80점 이상 90점 미만 
 * C : 50점 이상 80점 미만
 * F : 50점 미만
 */
UPDATE TBL_STUDENT 
SET GRADE = 'A'
WHERE (MATH + ENG  + KOR) /3 >= 90;

UPDATE TBL_STUDENT 
SET GRADE = 'B'
WHERE (MATH + ENG  + KOR) /3 BETWEEN 80 AND 89;

UPDATE TBL_STUDENT 
SET GRADE = 'C'
WHERE (MATH + ENG  + KOR) /3 BETWEEN 50 AND 79;

UPDATE TBL_STUDENT 
SET GRADE = 'F'
WHERE (MATH + ENG  + KOR) /3 < 50 ;

SELECT * FROM TBL_STUDENT ts ;


/*
[실습]
학점이 잘 들어갔는지 확인하기 위해서
학생 번호, 이름, 평균, 학점 조회하기 (별칭 넣기)
*/
SELECT STUDENT_ID "학생 번호",
   NAME 이름,
   ROUND((MATH + ENG + KOR)/3, 2)  평균, --ROUND() 반올림처리
   GRADE 학점
FROM TBL_STUDENT ts ;

/*
[실습]
학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점 미만이 아니고
학점이 B이상인 학생만 학생 번호, 이름, 학점 출력하기
*/
SELECT STUDENT_ID ,NAME ,GRADE 
FROM TBL_STUDENT
WHERE 
	NOT(MATH <50 OR
	KOR <50 OR
	ENG < 50) 
	AND 
	GRADE IN('A','B');

/*
[실습]
학생의 수학, 영어, 국어 점수 중
한 과목이라도 30점 미만이면 퇴학시키기(DB에서 삭제)
*/
DELETE FROM TBL_STUDENT
WHERE 
	MATH <30 OR 
	ENG <30 OR 
	KOR <30;

SELECT *FROM TBL_STUDENT;













