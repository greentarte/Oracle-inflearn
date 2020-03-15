#### 날짜함수

##### SYSDATE

```sql
SELECT sysdate FROM dual;
--결과 2020/03/15 오후 8:21:24
```

##### MONTH_BETWEEN 개월 수 차이(단위 개월수)

```sql
SELECT first_name, last_name, MONTHS_BETWEEN(SYSDATE, hire_date)
FROM EMPLOYEES
WHERE department_id = 50;
--결과
--Matthew	Weiss		187.930599985066
--Adam		Fripp		179.188664501195
--Payam		Kaufling	202.47898708184
--Shanta	Vollman		173.188664501195
--Kevin		Mourgos		147.995116114098
```

##### ADD_MONTH 개월 수 더하기

```sql
SELECT ADD_MONTHS(SYSDATE, 7) FROM dual;
--결과 2020/10/15 오후 8:25:44
```

##### NEXT_DAY 다가올 요일

```sql
SELECT NEXT_DAY(SYSDATE, 'sunday') FROM dual;
SELECT NEXT_DAY(SYSDATE, '일요일') FROM dual;
--결과 2020/03/31 오후 8:26:16
```

##### LAST_DAY 해당월의 마지막 날

```sql
SELECT LAST_DAY(SYSDATE) FROM dual;
```

##### TO_CHAR 문자형으로 변경

```sql
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd') FROM dual;
--결과 2020/03/15
```

##### TO_DATE DATE형으로 변경

```sql
SELECT TO_DATE('2015/03/04','yyyy/mm/dd') FROM dual;
--결과 2015/03/04
```

##### NVL 널값을 다른 데이터로 변경

```sql
SELECT first_name, last_name, NVL(commission_pct, 0) commission FROM EMPLOYEES;
--결과 NULL을 0으로 변경해서 표시
--Steven	King	0
--Neena		Kochhar	0
--Lex		De Haan	0
--Alexander	Hunold	0
```

##### DECODE SWITCH문의 역할

```sql
SELECT department_id, DECODE(department_id, 20, '마케팅부', 60, '전산', 90,'경영부', '부서')
FROM EMPLOYEES;
--결과 department_id가 20이면 마케팅부로 표현, 60이면 전사으로 표현, 90이면 부서로 표현, 나머지 부서로 표현
--90	경영부
--30	부서
--20	마케팅부
--60	전산
```

##### CASE elseif 문과 같은 역할

```sql
SELECT first_name, department_id, 
  CASE WHEN department_id = 20 THEN '마케팅부'
       WHEN department_id = 60 THEN '전산실'
       WHEN department_id = 90 THEN '경영부'
       ELSE '' 
       END "부서명"
FROM EMPLOYEES;  
--결과 department_id가 20이면 마케팅부, 60이면 전산실, 90이면 경여부로 펴현
--Lex		90	경영부
--Alexander	60	전산실
--Michael	20	마케팅부
```

