##### DDL : Data Definition Language

##### CREATE, DROP, ALTER

```sql
--테이블 설명
DESC employees;

--테이블 생성
CREATE TABLE employees2(
     employee_id  NUMBER(10),
     name VARCHAR2(20),
     salary NUMER(7,2)
     );
     
--CITAS
CREATE TABLE employees3
AS
SELECT * FROM employees2;

--COLUMN 추가
ALTER TABLE employees2 ADD (
    manager_id VARCHAR2(10)
    );
--COLUMN TYPE 변경    
ALTER TABLE employees2 MODIFY (
    manager_id varchar2(20)
    );   

--COLUMN 삭제
ALTER TABLE employees2 DROP COLUMN manager_id;    

--테이블 삭제
DROP TABLE employees2;

--테이블 데이터 전체 삭제(delete보다 빠름)
TRUNCATE TABLE employees3;


```

#### DML : SELECT DELETE, INSERT, UPDATE

```sql
-- 연습용 테이블 생성
CREATE TABLE sample (
    deptNo NUMBER(20),
    deptName VARCHAR2(15),
    deploc VARCHAR2(15),
    depManager VARCHAR2(10)
);

--임의 값 대입
INSERT INTO sample(deptNo, deptName, deploc, depManager)
VALUES(10, '기획실', '서울', '홍길동');
INSERT INTO sample
VALUES(20, '전산실', '부산', '김말똥');
INSERT INTO sample
VALUES(30, '영업부', '광주', null);

--특정 로우의 컬럼값 변경
UPDATE sample SET deptNo = 50
WHERE deptNo = 30;
UPDATE sample SET DEPLOC = '인천'
WHERE deptName = '영업부';

--특정 로우 삭제
DELETE sample
WHERE DEPTNAME = '영업부';

--UPDATE,DELETE,INSERT 한 부분 실제 테이블 반영
COMMIT;
--UPDATE,DELETE,INSERT 한 부분 원복
ROLLBACK;

```