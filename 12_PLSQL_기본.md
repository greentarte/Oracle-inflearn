#### PL/SQL (Procedural language/SQL)

> 오라클에서 제공하는 프로그래밍 언어로 일반 프로그래밍 언어적인 요소를 다 가지고 있고,
> 데이터베이스 업무를 처리하기 위한 최적화된 언어

##### 기본구조

- 선언부(Declare)  : 모든 변수나 상수를 선언하는 부분

- 실행부(Executable) : BEGIN ~ END / 제어문, 반복문, 함수정의 등의 로직을 기술하는 부분

- 예외처리부(Exception) : 실행도중에 에러 발생시 해결하기 위한 명령들을 기술하는 부분

  Decalre, Begin, Exception 키워드들은  ;을 붙이지 않는다. 나머지 문장들은 ;으로 처리한다.

- 익밍블록(Anonymous PL/SQL Block) : 주로 일회성으로 사용할 경우 많이 사용

- 저장 블록(Stored PL/SQL Block) : 서버에 저장해 놓고 주기적으로 반복해서 사용

```plsql
SET SERVEROUTPUT ON;

DECLARE
	cnt INTEGER;
BEGIN
	cnt := cnt +1; --할당 '=' 이아니라 ':='
	IF cnt IS NULL THEN
		DBMS_OUTPUT.PUT_LINE('결과 : cnt는 널이다');
    END IF;
END;

DECLARE
	empNo NUMBER(20);
	empName VARCHAR2(10);
BEGIN
	SELECT employee_id, first_name INTO empNo, empName
	FROM employees
	WHERE employee_id = 124;
	DBMS_OUTPUT.PUT_LINE(empNo||' '||empName);
END;


```

