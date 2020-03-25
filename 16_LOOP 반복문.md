#### LOOP 반복문

> LOOP
> 	PL/SQL 문장;
> 	EXIT 조건;
> END LOOP;

```sql
SET SERVEROUTPUT ON;
DECLARE
	num NUMBER :=0;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(num);
		num := num + 1;
		EXIT WHEN num > 10;
	END LOOP;
END;
```

#### WHILE 반복문

> WHILE 조건 LOOP
> 	실행 문장;
> END LOOP;

```sql
DECLARE
	num NUMBER := 0;
BEGIN
	WHILE num < 11 LOOP
		DBMS_OUTPUT.PUT_LINE(num);
		num := num + 1;
	END LOOP;
END;

DECLARE
	num NUMBER := 10;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(num);
		num := num - 1;
		EXIT WHEN num = -1;
	END LOOP;
END;

DECLARE
	num NUMBER := 10;
BEGIN
	WHILE num >= 0 LOOP
		DBMS_OUTPUT.PUT_LINE(num);
		num := num -1;
	END LOOP;
END;
```

#### FOR 문

반복횟수를 지정할 수 있다.

> FOR n : 카운터 횟수 IN START...END LOOP
> 	실행문장;
> END LOOP;

```sql
BEGIN
	FOR n IN 0..10 LOOP
		DBMS_OUTPUT.PUT_LINE(n);
	END LOOP;
END;

BEGIN
	FOR n IN REVERSE 0..10 LOOP
		DBMS_OUTPUT.PUT_LINE(n);
	END LOOP;
END;


--활용
--사원id를 입력받아서 사원 이름의 문자수만큼 #  찍는 pl/sql문을 작성해보자(employees테이블을 이용)
DECLARE
	emp_id employees.employee_id%TYPE := &emp_no;
	emp_name employees.last_name%TYPE;
	v_no NUMBER;
	v_char VARCHAR2(30);
BEGIN
  SELECT last_name, length(last_name) INTO emp_name, v_no
  FROM employees
  WHERE employee_id = emp_id;
  FOR i IN 1..v_no LOOP
    v_char := v_char||'#';
    DBMS_OUTPUT.PUT_LINE(v_char);    
  END LOOP;  
END;


--continue문: 보조제어문(11g부터 추가된 기능)
DECLARE
	tot NUMBER :=0;
BEGIN
	FOR i IN 1..10 LOOP
    tot := tot + 1;
    DBMS_OUTPUT.PUT_LINE('tot :'||tot);
    CONTINUE WHEN(i > 5);
    tot := tot+i;
    DBMS_OUTPUT.PUT_LINE('tot2 :'||tot);
	END LOOP;
END;
/
```

