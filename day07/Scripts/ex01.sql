/* JOIN
 * 
 * EMP 테이블의 사원정보와 DEPT 테이블의 지역을 한번에 조회
 */

-- 조인을 사용할 때 테이블간 관계와 정보를 확인한다.
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 두 테이블간 관계에서 DEPTNO을 FK로 사용하고 있으므로
-- DEPTNO을 비교하여 등가 조인을 사용할 수 있다.

-- ON절의 조건에 정확히 일치하는 행만 서로 합쳐진다.
SELECT *  
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- JOIN을 해서 조회된 결과 테이블에서
-- 원하는 정보만 SELECT 해준다.
SELECT E.*, D.LOC  
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

---------------------------------------------
SELECT * FROM SCHEDULE s;
SELECT * FROM STADIUM s ;

SELECT s.STADIUM_ID, s.STADIUM_NAME ,s2.SCHE_DATE 
FROM STADIUM s JOIN SCHEDULE s2 
ON s.STADIUM_ID = s2.STADIUM_ID ;

----------------------------------------------------
-- [실습]
-- PLAYER 테이블에서 송종국 선수가 속한 팀의 전화번호 조회

-- 1. 테이블 데이터와 테이블간 관계 확인하기
SELECT *FROM PLAYER p ;
SELECT *FROM TEAM t ;

-- 2. 일단 합치기
SELECT * FROM TEAM t INNER JOIN PLAYER p 
ON T.TEAM_ID = P.TEAM_ID ;

-- 3. 필요한 데이터만 뽑아내기
SELECT T.TEAM_NAME , T.TEL  FROM TEAM t INNER JOIN PLAYER p 
ON T.TEAM_ID = P.TEAM_ID 
WHERE P.PLAYER_NAME = '송종국';

-- 4. 효율적인지 생각해보기
-- WHERE를 안쓰고 ON으로 해결하는게 효율이 좋다.
-- ON만 사용하여 해결 가능한지 생각한다.
SELECT T.TEAM_NAME , T.TEL  
FROM TEAM t INNER JOIN PLAYER p 
ON P.PLAYER_NAME = '송종국' AND T.TEAM_ID = P.TEAM_ID ;

-- 팀 아이디를 SELECT로 조회하려고 하면 오류가 발생한다.
-- 양쪽 테이블 모두 TEAM_ID가 존재하기 때문에 어느 테이블의
-- TEAM_ID인지 컴퓨터가 알 수 없다.(모호성)
-- 그렇기 때문에 테이블 별칭으로 소속을 알려줘야한다.

SELECT T.TEAM_ID ,T.TEAM_NAME , T.TEL  
FROM TEAM t INNER JOIN PLAYER p 
ON P.PLAYER_NAME = '송종국' AND T.TEAM_ID = P.TEAM_ID ;


-- JOBS테이블에서 JOB_TITLE과 EMPLOYEES테이블에서 EMAIL, 성, 이름 조회
SELECT * FROM JOBS j ;
SELECT * FROM EMPLOYEES e ;

SELECT E.FIRST_NAME , E.LAST_NAME , E.EMAIL 
FROM JOBS j JOIN EMPLOYEES e 
ON J.JOB_ID = E.JOB_ID ;


-- EMPLOYEES 테이블에서 HIREDATE가 2003~2005년까지인 사원의 정보와 부서명 조회
SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;

SELECT *
FROM EMPLOYEES e 
WHERE HIRE_DATE BETWEEN '2003-01-01' AND '2005-12-31';

SELECT *FROM EMPLOYEES e 
WHERE TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2003' AND '2005'; 

SELECT TO_CHAR(SYSDATE, 'YYYY') FROM DUAL;

SELECT E.*,D.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID 
WHERE TO_CHAR(E.HIRE_DATE, 'YYYY') BETWEEN '2003' AND '2005';

SELECT E.*,D.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d 
ON TO_CHAR(E.HIRE_DATE, 'YYYY') BETWEEN '2003' AND '2005'
	AND E.DEPARTMENT_ID  = D.DEPARTMENT_ID ;


-- EMP테이블에서 ENAME에 L이 포함되는 사원들의 DNAME과 LOC 조회 
SELECT * FROM EMP e ;
SELECT * FROM DEPT d ;

SELECT E.ENAME , D.DNAME , D.LOC 
FROM EMP e JOIN DEPT d 
ON E.ENAME LIKE '%L%' AND E.DEPTNO = D.DEPTNO ;

--------------------------------------------------------

-- 축구 선수들 중에서 각 팀별로 키가 가장 큰 선수들의 전체 정보 조회
SELECT * FROM PLAYER p ;

SELECT TEAM_ID, MAX(HEIGHT)
FROM PLAYER p 
GROUP BY TEAM_ID ;

SELECT *
FROM PLAYER p JOIN (
	SELECT TEAM_ID, MAX(HEIGHT) HEIGHT 
	FROM PLAYER p 
	GROUP BY TEAM_ID
) S
ON P.TEAM_ID = S.TEAM_ID AND P.HEIGHT = S.HEIGHT;

-- 위 문제를 JOIN 없이 풀기
-- (A, B) IN (C,D) : A = C AND B = D

SELECT * FROM PLAYER p 
WHERE (TEAM_ID, HEIGHT) IN (
	SELECT TEAM_ID, MAX(HEIGHT)
	FROM PLAYER p 
	GROUP BY TEAM_ID);

-- EMP 테이블의 SAL을 이용, SALGRADE 테이블 참고
-- 모든 사원의 정보를 SALGRADE 등급별로 분류한다.
SELECT * FROM EMP e ;
SELECT * FROM SALGRADE s ;

-- 비등가 조인 (조건에 =를 사용하지 않는다.)
SELECT E.EMPNO , E.ENAME , E.SAL ,S.GRADE  
FROM EMP e JOIN SALGRADE s 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL ;

/*
 * EMP테이블에서 각 사원의 매니저 이름 조회
 */

SELECT *FROM EMP e ;

-- 자기자신을 JOIN하는 것을 SELF JOIN이라고 한다.
SELECT E.EMPNO 사원번호, E.ENAME 사원이름,
	M.EMPNO 매니저번호, M.ENAME 매니저이름
FROM EMP E JOIN EMP M
ON E.MGR = M.EMPNO;

----------------------------------------











