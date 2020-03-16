#### GROUP BY, HAVING

##### GROUP BY

```sql
SELECT DISTINCT department_id FROM EMPLOYEES;
SELECT department_id FROM EMPLOYEES GROUP BY department_id;
-- 위 2개의 쿼리 결과는 비슷하지만 집계함수를 활용하는데 차이가 있음

--부서별 급여 합계
SELECT department_id, SUM(salary) 
FROM EMPLOYEES
GROUP BY department_id;
--결과
--50	156400
--40	6500
--110	20308
--90	58000
--30	24900

--부서별 급여합과 사원수, 급여평균
SELECT department_id, SUM(salary), COUNT(salary), AVG(salary)
FROM employees
GROUP BY department_id;
--결과
--50	156400	45	3475.55555555556
--40	6500	1	6500
--110	20308	2	10154
--90	58000	3	19333.3333333333

--보기 금액 3자리수마다 , 적용
SELECT department_id, job_id,
TO_CHAR(SUM(salary),'999,999') 총급여,
TO_CHAR(AVG(salary),'999,999') 평균급여
FROM EMPLOYEES
GROUP BY department_id, job_id
ORDER BY department_id, job_id;
--결과
--10	AD_ASST	  4,400	   4,400
--20	MK_MAN	  13,000   13,000
--20	MK_REP	  6,000	   6,000
--30	PU_CLERK  13,900   2,780

SELECT department_id, job_id,
TO_CHAR(SUM(salary),'999,999') 총급여,
TO_CHAR(AVG(salary),'999,999') 평균급여
FROM EMPLOYEES
WHERE department_id = 80
GROUP BY department_id, job_id
ORDER BY department_id, job_id;
--결과
--80	SA_MAN	  61,000	  12,200
--80	SA_REP	 243,500	   8,397
```

##### HAVING 

```sql
--GROUP BY의 조건으로 사용
SELECT department_id, COUNT(*)
FROM EMPLOYEES
WHERE department_id IS NOT NULL
--and COUNT(*) >= 10 WHERE절에서 사용할 수 없다.
GROUP BY department_id
HAVING COUNT(*) >= 10;
--결과
--50	45
--80	34


--rollup : 그룹별 합계 정보를 추가해서 보여주는 함수(소계,합계 같이 구할 수 있음)
SELECT 
l.CITY, 
d.DEPARTMENT_NAME, 
e.JOB_ID,
COUNT(*) 사원수, 
SUM(e.salary) 총급여  
FROM EMPLOYEES e, DEPARTMENTS d,LOCATIONS l
WHERE e.department_id = d.department_id
AND d.LOCATION_ID = l.LOCATION_ID
GROUP BY rollup(l.city, d.department_name, e.job_id)
ORDER BY l.city, d.department_name, e.job_id;
--결과
--London	Human Resources		HR_REP	1	6500
--London	Human Resources		(NULL)	1	6500
--London	(NULL)				(NULL)	1	6500
--Munich	Public Relations	PR_REP	1	10000
--Munich	Public Relations	(NULL)	1	10000
--Munich	(NULL)				(NULL)	1	10000
--Oxford	Sales				SA_MAN	5	61000
--Oxford	Sales				SA_REP	29	243500


```

