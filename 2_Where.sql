// WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
select
	first_name,
	last_name,
	job_id
from
	employees
	where job_id = 'IT_PROG';


select 
*
from employees
where last_name = 'King';


select
*
from employees
where salary >= 15000
and salary  < 20000;


select
*
from employees
where hire_date = '1994-08-17'; -- 날짜는 ISO 형식(하이픈 연결)


-- 데이터의 행 제한(BETWEEN, IN, LIKE)
select
	*
from
	employees
where
	salary between 15000 and 20000;

-- 날짜도 BETWEEN 연산 가능!
select
	*
from
	employees
where
	hire_date between '1994-01-01' and '1994-12-31';


-- IN 연산자 (특정 값들과 비교할 때 사용)
select
	*
from
	employees
where
	job_id in ('IT_PROG', 'AD_VP', 'FI_MGR');

select
	*
from
	employees
where
	manager_id in ('101', '102', '103');

-- LIKE 연산 (지정 문자열 포함 여부)

select
	first_name, last_name , hire_date
from
	employees
where
	first_name like 'W%';

select
	first_name, last_name , hire_date
from
	employees
where
	first_name like '%t';

select
	first_name, last_name , hire_date
from
	employees
where
	first_name like '%t%';


-- 날짜 타입에서 like 사용 시에는 날짜타입을 문자열로 변경하는 TO_CHAR 사용
-- TP-CHAR(날짜컬럼, 형태)
select
	first_name, last_name , hire_date
from
	employees
where
	to_char(hire_date, 'YYYY-MM-DD') like '%01';

-- PostgresSQL 스타일 

select
	first_name, last_name , hire_date
from
	employees
where
    hire_date::TEXT like '1994%';

-- IS NULL : null 값을 찾음.
select * from employees
where commission_pct is null;

select * from employees
where commission_pct is not null;


-- and가 or보다 연산 순서가 빠름.
select
	*
from
	employees
where
	(job_id = 'IT_PROG'
	or job_id = 'FI_MGR')
	and salary >= 6000;


-- 데이터의 정렬 (select 구문의 가장 마지막에 배치, 실행도 가장 마지막에 실행)
-- ASC : 오름차 (default)
-- DESC : 내림차

select
	*
from
	employees
order by
	hire_date;


select
	first_name,
	last_name,
	job_id
from
	employees
	where job_id = 'IT_PROG'
order by first_name DESC;


select 
first_name,
salary * 12 as 연봉
from employees
order by 연봉 DESC;


































