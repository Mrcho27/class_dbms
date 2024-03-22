
-- SQL문 주요 특징
-- 하나의 명령어 단위로 실행된다.
-- 대문자와 소문자 구분을 하지 않는다.
SELECT first_name FROM employees;

-- SELECT ~ FROM
-- 테이블에서 데이터를 조회할 때 사용하는 명령어

-- 사용 방법
-- SELECT 컬럼명 FROM 테이블명;

SELECT FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES;
-- 현재 HR 계정으로 접속하였기 때문에 HR.은 생략가능


/*
 * [실습] 
 * 직원의 성, 이름, 휴대전화번호, 이메일주소, 사원번호를 한번에 조회하기
 * (순서대로 조회되어야한다.)
 */
SELECT FIRST_NAME, 
	LAST_NAME, 
	PHONE_NUMBER, 
	EMAIL, 
	EMPLOYEE_ID 
FROM EMPLOYEES;

-- 모든 컬럼 조회하기
-- * : 모든, ALL
SELECT * FROM EMPLOYEES;

-- 정렬해서 조회하기
-- ORDER BY 절
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY ASC;
-- ORDER BY 정렬하겠다.
-- SALARY 칼럼을 기준으로
-- ASC 오름차순

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC; -- 내림차순

-- 직원의 이름, 성 고용일을 고용일 순서로 정렬하여 조회하기
SELECT FIRST_NAME , LAST_NAME , HIRE_DATE 
FROM EMPLOYEES 
ORDER BY HIRE_DATE ;
-- 날짜 칼럼으로도 정렬이 가능하다!

-- 직원의 이름, 성을 성 순서대로 정렬하여 조회하기
-- 문자열 칼럼으로도 정렬이 가능하다!
SELECT FIRST_NAME ,LAST_NAME 
FROM EMPLOYEES 
ORDER BY LAST_NAME DESC;

-- 여러개의 컬럼을 기준으로 정렬할 경우
-- 칼럼 순서에 맞게 첫 번째 칼럼으로 정렬된 후
-- 같은 값이 나오면 두 번째 칼럼으로 정렬된다.
SELECT FIRST_NAME ,SALARY , HIRE_DATE 
FROM EMPLOYEES
ORDER BY SALARY ASC, HIRE_DATE DESC ;

SELECT JOB_ID 
FROM EMPLOYEES e ;

--DISTINCT : 해당 칼럼에서 중복되는 값을 제외시킨다.
SELECT DISTINCT JOB_ID
FROM EMPLOYEES e ;

-- 여러 칼럼을 동시에 작성할 경우 두 칼럼이 모두 중복되는 경우에만
-- 중복처리가 된다.
SELECT DISTINCT JOB_ID , HIRE_DATE 
FROM EMPLOYEES e ;

-- 정렬 기준으로 삼은 컬럼을 꼭 조회할 필요는 없다.
SELECT FIRST_NAME , LAST_NAME  
FROM EMPLOYEES e 
ORDER BY SALARY ;









