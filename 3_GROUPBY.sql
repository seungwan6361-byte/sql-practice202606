
-- 집계 함수 (aggregate function)
-- AVG, MAX, MIN, SUM, COUNT
-- 여러 행을 묶어서 한 번에 함수를 적용
-- 그룹화를 따로 하지 않는다면 그룹은 테이블 전체가 됩니다.

select
	AVG(salary),
	MAX(salary),
	MIN(salary),
	SUM(salary),
	COUNT(salary)
from
	employees;


select
	count(*)
from
	employees;

select
	count(first_name)
from
	employees;

select
	count(commission_pct) -- null 이 아닌 행의 수
from
	employees;

select
	count(manager_id ) -- null은 카운팅 되지 않습니다.
from
	employees;



-- 부서별로 그룹화, 집계함수 사용
select
	department_id,
	AVG(salary),
	COUNT(*)
from
	employees
group by
	department_id;


-- group by 절을 사용할 때 group 절에 묶이지 않은 컬럼은 조회할 수 없습니다.
select
	job_id,
	department_id,
	AVG(salary),
	COUNT(*)
form employees
group by
	department_id; -- 에러

	select
	job_id,
	department_id,
	AVG(salary),
	COUNT(*)
from
	employees
group by
	department_id,
	job_id
order by department_id;	


-- GROUP BY를 통해 그룹화 할 때, 조건을 지정할 경우 HAVING을 사용
-- WHERE은 일반 조건절, GROUP BY보다 먼저 진행됩니다.
select
	department_id,
	AVG(salary),
	COUNT(*)
from
	employees
group by
	department_id
having
	AVG(salary) > 7000;


-- 부서 아이디가 50이상인 사원을 부서별로 그룹화 시키고
-- 그룹 급여 평균 5000인상만 조회
-- SQL 실행 순서: FROM ->  WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
select
	department_id,
	AVG(salary) as 평균급여
from
	employees
where
	department_id >= 50
group by
	department_id
having
	AVG(salary) >= 5000
order by
	평균급여 desc;

/*
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절사 하세요.
 */

select 
department_id,
TRUNC(AVG(salary + salary*commission_pct), 2) as avg_salary,
SUM(salary + salary*commission_pct) as total_salary,
COUNT(*) as count
from employees
where commission_pct is not null
group by department_id;


























































