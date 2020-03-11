/*
    Ŀ��(Cursor) : �������� ���ؼ� ��ȯ�Ǵ� ������� �����ϴ� �޸� ����
    Fetch : Ŀ���� ���ϴ� ������� �����ϴ� ��
    
    - Ŀ���� ����
      1)�����(Explicit) Ŀ�� : ����ڰ� �����ؼ� ���� �� ����ϴ� SQLĿ��
        �ַ� �������� ���� ó���ϰ��� �� ��� ���.
      2)������(implicit) Ŀ�� : ����Ŭ���� �ڵ����� �������ִ� SQLĿ��  
        ����ڴ� ���� ������ �� �� ����.
    - Ŀ���� �Ӽ�
      %Found - �Ҵ��� ���ڵ尡 �ִ� ��� true ��ȯ
      %isOpen - Ŀ���� ���� ������ ��� true ��ȯ
      %NotFound - �Ҵ��� ���ڵ尡 ���� ��� true ��ȯ
      %RowCount - ī���� ������ �Ѵ�. ���� ���� ��� 0, ��ġ�߻��Ҷ� ���� 1�� ������.
      
    - Ŀ���� ó���ܰ�(����� ��)
      1. ����� Ŀ�� ����          -> Cursor Ŀ���̸�
      2. ����� Ŀ�� ����          -> Open Ŀ���̸�
      3. Ŀ������ ������ ����      -> Fetch Ŀ���̸�
      4. Ŀ�� ����                -> Close Ŀ���̸�
*/

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
    
    DBMS_OUTPUT.PUT_LINE('���    �̸�    �޿�');
    
    LOOP
        FETCH cu1 INTO emp_id, emp_name, emp_salary;
        EXIT WHEN cu1%notFound;
        dbms_output.put_line(emp_id||'    '||emp_name||'    '||emp_salary);    
        
    END LOOP;
    CLOSE cu1;
END;
/*
���
���    �̸�    �޿�
201    Hartstein    13000
202    Fay    6000
*/
    
SET SERVEROUTPUT ON;

/*
Ŀ���� �ݺ��� (for��)
    ��� ����
    FOR ���ڵ� ���� IN Ŀ���̸� LOOP
        ����� Ŀ���� OPEN, FETCH�� �ڵ����� ����
        ���� �����
    END LOOP; �������� ���� ������ �ڵ������� Ŀ���� ���� ��.
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