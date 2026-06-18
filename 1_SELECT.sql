-- 한 줄 주석입니다.
/*
 * 여러 줄 주석입니다.
 * 호호호~
 * 글자 크기 변경 : ctrl + '+' or '-'
 */

-- SELECT [컬럼명] FROM [테이블이름]
select * from employees;

select
	employee_id,
	first_name,
	last_name
from
	employees;


select
	employee_id as 사번,
	first_name as 성,
	last_name as 이름
from
	employees;


select
	employee_id,
	first_name,
	last_name,
	salary,
	salary + salary*0.1 as 성과포함급여
from
	employees;

--NULL 값의 확인 (숫자 0 이나 공백과는 다른 개념입니다.)

select
	employee_id,
	department_id,
	commission_pct 
from
	employees;

-- DISTINCT (중복 행의 제거)
select DISTINCT
	department_id
from
	employees;