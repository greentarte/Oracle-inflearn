#### 커서(Cursor) : 쿼리문에 의해서 반환되는 결과값을 저장하는 메모리 공간 
#### Fetch : 커서에 원하는 결과값을 추출하는 것
    
- 커서의 종류
    1. 명시적(Explicit) 커서 : 사용자가 선언해서 생성 후 사용하는 SQL커서 주로 여러개의 행을 처리하고자 할 경우 사용.
    2. 묵시적(implicit) 커서 : 오라클에서 자동으로 선언해주는 SQL커서 사용자는 생성 유무를 알 수 없다.
- 커서의 속성
    1. %Found - 할당할 레코드가 있는 경우 true 반환
    2. %isOpen - 커서가 오픈 상태일 경우 true 반환
    3. %NotFound - 할당할 레코드가 없는 경우 true 반환
    4. %RowCount - 카운터 역할을 한다. 오픈한 됬을경우 0, 패치발생할때 마다 1씩 증가함.
      
- 커서의 처리단계(명시적 컷)
    1. 명시적 커서 선언          -> Cursor 커서이름
    2. 명시적 커서 오픈          -> Open 커서이름
    3. 커서에서 데이터 추출      -> Fetch 커서이름
    4. 커서 종류                -> Close 커서이름

```sql
DECLARE
    emp_id      NUMBER(4);
    emp_name    VARCHAR2(10);
    emp_salary  NUMBER(10);
    
    CURSOR cu1 IS
        SELECT employee_id, last_name, salary
        FROM employees
        WHERE department_id = 20;
        
BEGIN
    OPEN cu1;
    
    DBMS_OUTPUT.PUT_LINE('사번    이름    급여');
    
    LOOP
        FETCH cu1 INTO emp_id, emp_name, emp_salary;
        EXIT WHEN cu1%notFound;
        dbms_output.put_line(emp_id||'    '||emp_name||'    '||emp_salary);    
        
    END LOOP;
    CLOSE cu1;
END;
/*
결과
사번    이름    급여
201    Hartstein    13000
202    Fay    6000
*/
    
SET SERVEROUTPUT ON;

/*
커서와 반복문 (for문)
    사용 형식
    FOR 레코드 네임 IN 커서이름 LOOP
        명시적 커서의 OPEN, FETCH가 자동으로 수행
        실행 문장들
    END LOOP; 루프문을 빠져 나갈때 자동적으로 커서가 종료 함.
*/

DECLARE 
    CURSOR emp_cur IS
        SELECT employee_id, last_name
        FROM employees;
BEGIN
    FOR emp_rec IN emp_cur LOOP
        dbms_output.put_line(emp_rec.employee_id||'   '||emp_rec.last_name);
    END LOOP;        
END;    


DECLARE
    emp employees%ROWTYPE;
    
    CURSOR cur1 IS
        SELECT employee_id, last_name, salary
        FROM employees;
        
BEGIN
    FOR emp IN cur1 LOOP
    EXIT WHEN cur1%notFound;
    dbms_output.put_line(emp.employee_id||'   '||emp.last_name||'   '||emp.salary);
    END LOOP;
END;



BEGIN
 FOR emp in (select employee_id, last_name, salary from employees)
 LOOP 
    dbms_output.put_line(emp.employee_id||'   '||emp.last_name||'   '||emp.salary);
 END LOOP;
END;
```
