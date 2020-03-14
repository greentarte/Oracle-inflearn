#### 데이터 정의어(DDL) :  테이블이나 관계의 구조를 생성,변경, 삭제하는데 사용하며 CREATE, ALTER, DROP

#### 데이터 조작어(DML) : 테이블에 데이터를 검색, 삽입, 수정, 삭제에사용하며 SELECT, INSERT, DELETE, UPDATE

#### 데이터 제어어(DML) : 데이터의 사용권한관리 GRANT, REVOKE



#### DML 

SELECT [ ALL | DISTINCT ] 컬럼1, 컬럼2, 컬럼3

FROM 테이블

WHERE 검색조건

GROUP BY 컬럼

HAVING 그룹조건

ORDER BY 컬럼[ ASC | DESC]

;

[예제 테이블이 없는경우 온라인 스크립트 사용](https://livesql.oracle.com/apex/livesql/file/content_GV8MU6SITA2V3VYI179FAJUCY.html)

```plsql
--01 현재 접속한 계정이 소유하고 있는 모든 테이블
SELECT * FROM TAB; 

--02 테이블 컬럼 설명
DESC employees;


--03 ALIAS 사용
SELECT employee_id AS "사원ID", salary AS "연봉" 
FROM employees;
--03 결과
--100	24000
--101	17000

--04 WHERE절 조건
SELECT employee_id, last_name 
FROM employees 
WHERE last_name = 'Smith';
--04 결과
--159	Smith
--171	Smith

--05 DISTINCT 중복제거 
SELECT DISTINCT job_id 
FROM employees;
--05 결과
--AD_VP
--FI_ACCOUNT
--PU_CLERK
--SH_CLERK

--06 비교(>=,<=)
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary >= 5000;
--06 결과
--Steven	King	24000
--Neena		Kochhar	17000
--Lex		De Haan	17000
--Alexander	Hunold	9000
--Bruce		Ernst	6000
--06 날짜비교
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_Date >='04/01/01';
--Neena		Kochhar		2005/09/21
--Alexander	Hunold		2006/01/03
--Bruce		Ernst		2007/05/21
--David		Austin		2005/06/25
--Valli		Pataballa	2006/02/05

--07 AND
SELECT first_name, last_name, job_id, department_id 
FROM employees 
WHERE department_id = 50 AND job_id ='SH_CLERK';
--07 결과
--Winston	Taylor		SH_CLERK	50
--Jean		Fleaur		SH_CLERK	50
--Martha	Sullivan	SH_CLERK	50
--Girard	Geoni		SH_CLERK	50

--08 OR
SELECT first_name, last_name, manager_id, department_id 
FROM employees 
WHERE department_id =50 OR manager_id = 100;
--08 결과
--Neena		Kochhar		100	90
--Lex		De Haan		100	90
--Den		Raphaely	100	30
--Matthew	Weiss		100	50

--09 NOT과 <> 표현방식은 다르지만 효과는 같다
SELECT first_name, last_name, department_id FROM employees WHERE NOT(department_id =50);
SELECT first_name, last_name, department_id FROM employees WHERE department_id <>50;
--09 결과
--Steven	King	90
--Neena		Kochhar	90
--Lex		De Haan	90
--Alexander	Hunold	60

--10 LIKE
-- %대상, 대상%, %대상%, __대상__
-- first_name이 D로 시작하는 것
SELECT first_name, last_name 
FROM employees
WHERE first_name LIKE 'D%';
--David		Austin
--Diana		Lorentz
--Daniel	Faviet
--Den		Raphaely

-- first_name이 d로 끝나는 것
SELECT first_name, Last_name 
FROM employees
WHERE first_name LIKE '%d';
--David		Austin
--Gerald	Cambrault
--David		Bernstein
--David		Lee

-- a앞에 2글자가 있고 시작하는 것
SELECT first_name, last_name 
FROM employees
WHERE first_name LIKE '__a%';
--Diana		Lorentz
--Adam		Fripp
--Shanta	Vollman
--Clara		Vishney

--11 NULL 조건 사용
SELECT first_name, last_name, commission_pct FROM employees
WHERE commission_pct IS NULL;
--Steven	King		(NULL)
--Neena		Kochhar		(NULL)
--Lex		De	Haan	(NULL)	
--Alexander	Hunold		(NULL)	

SELECT first_name, last_name, commission_pct FROM employees
WHERE commission_pct IS NOT NULL;
--John		Russell		0.4
--Karen		Partners	0.3
--Alberto	Errazuriz	0.3
--Gerald	Cambrault	0.3
--Eleni		Zlotkey		0.2

--12 오름차순 ORDER BY 사용시 기본은 오름차순(ASC)
SELECT employee_id, last_name FROM employees
ORDER BY employee_Id;
--100	King
--101	Kochhar
--102	De Haan
--103	Hunold

-- 내림차순 DESC
SELECT employee_id, last_name FROM employees
ORDER BY employee_id DESC;
--206	Gietz
--205	Higgins
--204	Baer
--203	Mavris

-- 4000 <= salary <= 8000 
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary >=4000 AND salary <=8000;
--Bruce	Ernst		6000
--David	Austin		4800
--Valli	Pataballa	4800
--Diana	Lorentz		4200

-- 4000 <= salary <= 8000  BETWEEN은 양 끝값을 포함한다.
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary BETWEEN 4000 AND 8000;
--Bruce	Ernst		6000
--David	Austin		4800
--Valli	Pataballa	4800
--Diana	Lorentz		4200

SELECT first_name, last_name, salary 
FROM employees 
WHERE salary = 6500 OR salary = 7700 OR salary = 13000;
--Ismael	Sciarra		7700
--Shanta	Vollman		6500
--Michael	Hartstein	13000
--Susan		Mavris		6500

-- OR을 많이 사용하는 경우 IN을 사용
SELECT first_name, last_name, salary 
FROM employees
WHERE salary IN (6500, 7700, 13000);
--Ismael	Sciarra		7700
--Shanta	Vollman		6500
--Michael	Hartstein	13000
--Susan		Mavris		6500
















```

