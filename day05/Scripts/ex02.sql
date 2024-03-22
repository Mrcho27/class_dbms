
/*
* 집계 함수 : 결과 행이 1개
* 주의 사항 : NULL은 포함시키지 않는다. WHERE절에서는 사용이 불가능하다.
* 
* AVG() : 평균
* MAX() : 최대값
* MIN() : 최소값
* SUM() : 총 합
* COUNT() : 개수 
*/

SELECT AVG(HEIGHT) FROM PLAYER;
SELECT MAX(HEIGHT) FROM PLAYER;
SELECT MIN(HEIGHT) FROM PLAYER;
SELECT SUM(HEIGHT) FROM PLAYER;
SELECT COUNT(HEIGHT) FROM PLAYER;

SELECT *FROM PLAYER;

SELECT COUNT(NVL(HEIGHT,0)) FROM PLAYER p ;


SELECT COUNT(HEIGHT),SUM(HEIGHT)
FROM PLAYER;

SELECT PLAYER_NAME  FROM PLAYER p; 

/*
 * GROUP BY : ~별 (예 : 포지션 별 평균키)
 * 
 * GROUP BY 칼럼명 HAVING 조건식
 * 
 */
-- PLAYER테이블에서 포지션 종류 조회 -> 4개의 포지션
SELECT DISTINCT "POSITION" FROM PLAYER p ;

-- 오류 발생
-- GROUP BY로 포지션을 그룹화하면 4개의 포지션이 나오게된다.
-- 4개의 행으로 데이터를 표현해야하는데
-- 선수들의 모든 정보를 4개행으로 표현하는것은 말이 안된다.
SELECT * FROM PLAYER p 
GROUP BY "POSITION" ;

-- 포지션을 GROUP BY로 묶어준다면
-- 묶어주는 포지션 칼럼을 조회하는게 좋다.
SELECT "POSITION" FROM PLAYER p 
GROUP BY "POSITION" ;

-- GROUP BY는 결과행을 1개만 반환하는 집계함수와 자주 쓰인다.
-- 아래 SQL문은 포지션별 평균키를 조회한다.
SELECT "POSITION",AVG(HEIGHT) FROM PLAYER p 
GROUP BY "POSITION" ;




