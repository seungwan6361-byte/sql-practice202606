
create table dept (
dept_no BIGSERIAL,
dept_name VARCHAR(14),
loca VARCHAR(15), -- 타 DBMS는 ()안의 숫자가 byte크기, postgres는 글자 수
dept_date TIMESTAMP default NOW(),
dept_bonus NUMERIC(8)
);

select * from dept;

insert into dept
(dept_name, loca, dept_bonus)
values('test', '서울특별시', 4000000);