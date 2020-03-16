#### JOIN

```sql
--INNER JOIN 내부 조인 oracle만 가능 DEPARTMENT_ID를 조건으로 JOIN을 함
SELECT emp.first_name, emp.last_name, emp.email, 
      dep.department_name
FROM employees emp, departments dep
WHERE emp.DEPARTMENT_ID = dep.DEPARTMENT_ID;
--결과
--Steven	King	SKING		Executive
--Neena		Kochhar	NKOCHHAR	Executive
--Lex		De Haan	LDEHAAN		Executive
--Alexander	Hunold	AHUNOLD		IT

SELECT emp.first_name, emp.last_name, emp.email,
       emp.department_id, dep.department_name,
       emp.job_id, job.job_title, loc.city
FROM employees emp,
     departments dep,
     jobs job,
     locations loc
WHERE emp.department_id = dep.department_id
  AND emp.job_id = job.job_id
  AND dep.location_id = loc.location_id
  AND loc.city = 'Seattle';
--결과
--Steven	King	SKING		90	Executive		AD_PRES	President						Seattle
--Neena		Kochhar	NKOCHHAR	90	Executive		AD_VP	Administration Vice President	Seattle
--Lex		De Haan	LDEHAAN		90	Executive		AD_VP	Administration Vice President	Seattle
--Jennifer	Whalen	JWHALEN		10	Administration	AD_ASST	Administration Assistant		Seattle


--셀프 조인 같은 테이블로 조인해서 사용
--같은 테이블의 매니저ID를 이름을 바꾸기 위해서 셀프조인
SELECT emp1.EMPLOYEE_ID, emp1.first_name, 
       emp2.employee_id 상사id,
       emp2.first_name 상사이름
FROM employees emp1, employees emp2
WHERE emp1.MANAGER_ID = emp2.employee_id;
--101	Neena	100	Steven
--102	Lex		100	Steven
--114	Den		100	Steven
--120	Matthew	100	Steven
--121	Adam	100	Steven

--OUTER JOIN
SELECT emp.employee_id,
       emp.first_name,
       emp.department_id,
       dep.department_name,
       loc.city
FROM employees emp, departments dep, locations loc
WHERE emp.department_id = dep.department_id (+)
AND   dep.location_id = loc.location_id (+);
--결과
--179	Charles		80		Sales				Oxford
--204	Hermann		70		Public 	Relations	Munich
--178	Kimberely	(NULL)	(NULL)				(NULL)		



```

