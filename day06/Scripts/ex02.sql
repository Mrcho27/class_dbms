-- 서브쿼리

-- PLAYER 테이블에서 전체 평균 키와 포지션별 평균 키 구하기

-- 전체 선수 평균 키는 결과가 1개의 행이다.
SELECT AVG(HEIGHT) FROM PLAYER; 

-- 포지션 별 평균 키는 결과가 4개의 행이다.
SELECT "POSITION", AVG(HEIGHT)
FROM PLAYER
GROUP BY "POSITION";

-- 1개의 행과 4개의 행의 결과를 한번에 조회하는건 일반적으로
-- 불가능하다.(표는 직사각형이어야 하니까)
-- 그래서 적은수의 행을 복제하여 4개의 행으로 맞추어 조회하면
-- 가능하다.
-- 단, 서브쿼리의 행의 수가 메인쿼리보다 적어야만 가능하다.

SELECT "POSITION", AVG(HEIGHT) "그룹별 평균 키",
	(SELECT AVG(HEIGHT) FROM PLAYER) "전체 평균 키"
FROM PLAYER
GROUP BY "POSITION";


SELECT "POSITION", AVG(HEIGHT) "그룹별 평균 키",
	(SELECT HEIGHT FROM PLAYER) "전체 평균 키"
FROM PLAYER
GROUP BY "POSITION";

-- PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 중 POSITION이
-- GK인 선수를 조회하기 SUB쿼리 사용하기

SELECT *FROM PLAYER
WHERE TEAM_ID = 'K01' AND "POSITION" ='GK';
--이렇게 조회하면 되지만 서브쿼리로 연습하기

SELECT *FROM PLAYER
WHERE TEAM_ID = 'K01';

SELECT *FROM PLAYER
WHERE "POSITION" = 'GK';

-- SELECT를 통해 조회되는 결과도 하나의 테이블이라고 볼 수 있다.(결과 테이블)
-- 결과 테이블에서 다시 조회를 하고 싶으면 FROM절 서브쿼리를 사용하면 된다.
SELECT *
FROM (
	SELECT *FROM PLAYER
	WHERE TEAM_ID = 'K01'
)
WHERE "POSITION" = 'GK';

-- PLAYER테이블에서 평균 몸무게보다 더 많이 나가는 선수들 조회
SELECT AVG(WEIGHT) FROM PLAYER;

SELECT * FROM PLAYER
WHERE WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);

------------------------------------------------------
SELECT "POSITION", 
	AVG(HEIGHT) "평균 키", 
	AVG(WEIGHT) "평균 몸무게"
FROM PLAYER
WHERE "POSITION" IS NOT NULL
GROUP BY "POSITION";

SELECT *
FROM (
	SELECT "POSITION", 
		AVG(HEIGHT) "평균 키", 
		AVG(WEIGHT) "평균 몸무게"
	FROM PLAYER
	WHERE "POSITION" IS NOT NULL
	GROUP BY "POSITION"
)
WHERE "평균 키" > 180;


SELECT FIRST_NAME  || ' ' || LAST_NAME 이름,
	SALARY ,
	PHONE_NUMBER 
FROM EMPLOYEES
WHERE SALARY > 10000;

SELECT 이름, SALARY
FROM (
	SELECT FIRST_NAME  || ' ' || LAST_NAME 이름,
		SALARY ,
		PHONE_NUMBER 
	FROM EMPLOYEES
	WHERE SALARY > 10000
)
WHERE 이름 LIKE '%a%';

-- PLAYER 테이블에서 정남일 선수가 소속된 팀의 선수들 조회
SELECT TEAM_ID  FROM PLAYER
WHERE PLAYER_NAME  = '정남일';

SELECT * FROM PLAYER
WHERE TEAM_ID  = (
	SELECT TEAM_ID  FROM PLAYER
	WHERE PLAYER_NAME  = '정남일'
);


-- PLAYER 테이블에서 평균 키보다 작은 선수 조회
SELECT AVG(HEIGHT) FROM PLAYER;

SELECT *FROM PLAYER
WHERE HEIGHT < (SELECT AVG(HEIGHT) FROM PLAYER);

-- SCHEDULE 테이블에서 경기 일정이
-- 20120501 ~ 20120502 사이에 있는 경기장 전체 정보 조회
SELECT *FROM SCHEDULE ;

-- 문자 비교로 결과가 잘 나오는지 확인
SELECT MIN(SCHE_DATE) 
FROM SCHEDULE
WHERE SCHE_DATE >= '20120501';


SELECT STADIUM_ID 
FROM SCHEDULE
WHERE SCHE_DATE BETWEEN '20120501' AND '20120502';

SELECT *
FROM STADIUM 
WHERE STADIUM_ID = 'B01' OR STADIUM_ID  = 'B04';

-- STADIUM_ID와 비교하는 대상이 여러개다.
-- 우리는 STADIUM_ID = 'B01' OR STADIUM_ID  = 'B04 OR....
-- 이런식으로 비교를 해야한다. 그러나 서브쿼리를 사용하는 경우
-- 우리가 직접 OR를 작성하는게 불가능하다.
-- 이럴 때는 IN을 활용한다.

SELECT *
FROM STADIUM
WHERE STADIUM_ID IN (
	SELECT STADIUM_ID 
	FROM SCHEDULE
	WHERE SCHE_DATE BETWEEN '20120501' AND '20120502'
);

-- PLAYER 테이블에서 NICKNAME이 NULL인 선수들을
-- 정태민 선수의 닉네임으로 변경하기
SELECT NICKNAME FROM PLAYER
WHERE PLAYER_NAME ='정태민';

SELECT * FROM PLAYER
WHERE NICKNAME IS NULL;

UPDATE PLAYER 
SET NICKNAME = (
	SELECT NICKNAME FROM PLAYER
	WHERE PLAYER_NAME ='정태민'
)
WHERE NICKNAME IS NULL;

SELECT *FROM PLAYER;

-- EMPLOYEES 테이블에서 평균 급여보다 낮은 사원들의 급여를
-- 20% 인상

-- 2100
SELECT MIN(SALARY) FROM EMPLOYEES ; 

SELECT AVG(SALARY) FROM EMPLOYEES ; 

UPDATE EMPLOYEES 
SET SALARY = SALARY * 1.2
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);


-- PLAYER 테이블에서 평균 키보다 큰 선수들을 삭제
SELECT AVG(HEIGHT) FROM PLAYER;

DELETE FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);

SELECT MAX(HEIGHT)  FROM PLAYER p ;




ROLLBACK;

-- ROWNUM
-- 결과 행 앞에 1부터 1씩 증가하는 값을 붙여준다.
-- ROWNUM은 그냥 칼럼처럼 사용하면 된다.

-- *을 다른 칼럼과 함께 조회하게 되면 소속을 명시해야한다.
-- 그러므로 테이블에 별칭을 부여하고 해당 별칭을 *에 명시해준다.

SELECT ROWNUM, e.* FROM EMPLOYEES e;

SELECT E.EMPLOYEE_ID ,E.EMPLOYEE_ID , e.* FROM EMPLOYEES e;

/*
 * EMPLOYEES 테이블에서 SALARY를 내림차순으로 정렬한 후
 * ROWNUM을 붙여서 조회한다.
 */

SELECT ROWNUM,E.* 
FROM EMPLOYEES e 
ORDER BY SALARY DESC;

SELECT * 
FROM EMPLOYEES e 
ORDER BY SALARY DESC;

SELECT ROWNUM, S.*
FROM (
	SELECT * 
	FROM EMPLOYEES e 
	ORDER BY SALARY DESC
) S;

-- 연봉 1위부터 5위까지 조회
SELECT ROWNUM, S.*
FROM (
	SELECT * 
	FROM EMPLOYEES e 
	ORDER BY SALARY DESC
) S
WHERE ROWNUM BETWEEN 1 AND 5; --ROWNUM은 시작이 무조건 1


SELECT ROWNUM, S.*
FROM (
	SELECT * 
	FROM EMPLOYEES e 
	ORDER BY SALARY DESC
) S
WHERE ROWNUM <= 10;

SELECT *
FROM (
	SELECT ROWNUM RNUM, S.*
	FROM (
		SELECT * 
		FROM EMPLOYEES e 
		ORDER BY SALARY DESC
	) S
	WHERE ROWNUM <= 10
)
WHERE RNUM >5;











