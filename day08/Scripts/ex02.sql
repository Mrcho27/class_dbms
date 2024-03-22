/*
*EMPLOYEES 테이블에서
*부서 ID가 50인 부서는 기존 급여에서 10% 삭감
*부서 ID가 80인 부서는 기존 급여에서 10% 인상
*나머지는 그대로
*사원의 이름과 기존급여, 조정 급여를 조회
*
*/

SELECT * FROM EMPLOYEES e ;

SELECT LAST_NAME || ' ' || FIRST_NAME  이름,
	SALARY 기존급여,
	CASE 
		WHEN DEPARTMENT_ID = 50 THEN SALARY * 0.9
		WHEN DEPARTMENT_ID = 80 THEN SALARY * 1.1
		ELSE SALARY
	END 조정급여,
	DEPARTMENT_ID 
FROM EMPLOYEES e ;


SELECT LAST_NAME || ' ' || FIRST_NAME  이름,
	SALARY 기존급여,
	CASE DEPARTMENT_ID
		WHEN 50 THEN SALARY * 0.9
		WHEN 80 THEN SALARY * 1.1
		ELSE SALARY
	END 조정급여,
	DEPARTMENT_ID 
FROM EMPLOYEES e ;


/*
 * EMP테이블에서 사원들의 번호, 이름, 급여, 최종 급여를 조회
 * 최종 급여는 커미션이 존재하면 봉급과 더하고
 * 커메션이 존재하지 않으면 100을 더해준다.
 * 조회 결과는 최종급여 오름차순으로 정렬한다.
 */
SELECT * FROM EMP;

SELECT EMPNO 번호, ENAME 이름, SAL 급여,
	CASE 
		WHEN COMM IS NOT NULL THEN SAL + COMM
		WHEN COMM IS NULL THEN SAL + 100
	END "최종 급여"
FROM EMP e 
ORDER BY "최종 급여";

/*
 * EMP 테이블의 사원 정보를 가져온다.
 * 이때 SAL이 높은 순으로 정렬하고 비고 칼럼을 만든다.
 * 비고 칼럼에는 급여 순위가 1~5등이면 '상'
 * 6~10등이면 '중'
 * 나머지는 '하' 를 넣는다.
 */
SELECT ROWNUM, E.*
FROM EMP e 
ORDER BY SAL DESC;

SELECT ROWNUM, S.*
FROM (
	SELECT * FROM EMP e 
	ORDER BY SAL DESC 
)S;


SELECT ROWNUM, S.*,
	CASE 
		WHEN ROWNUM BETWEEN 1 AND 5 THEN '상'
		WHEN ROWNUM BETWEEN 6 AND 10 THEN '중'
		ELSE '하'
	END 비고
FROM (
	SELECT * FROM EMP e 
	ORDER BY SAL DESC 
)S;




















