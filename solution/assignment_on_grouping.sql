select * from sys.employee_data;
#11) Display job-wise maximum salary.
select *,sum(coalesce(sal,0) + coalesce(Comm,0)) as total_sal from sys.employee_data group by ename order by sal desc;
select *,sum(coalesce(sal,0) + coalesce(Comm,0)) as total_sal from sys.employee_data group by empno order by sal desc;

#12) Display the departments that are having more than 3 employees under it.
select * from sys.employee_data;
select job from sys.employee_data  group by deptno having count(*) > 3;

#13) Display job-wise average salaries for the employees whose employee number is not from 7788 to 7790.
select * from sys.employee_data;
select * from sys.employee_data  group by job ;
select * from sys.employee_data  group by job  having empno not between 7788 and 7790;
select empno,ename,job,avg(sal) from sys.employee_data group by job having empno not between 7788 and 7790; #Here analyst empno is 7788 so it is getting rejected

#14) Display department-wise total salaries for all the Managers and Analysts, only if the average salaries for the same is greater than or equal to 3000.
select * from sys.employee_data;
select * from sys.employee_data group by deptno,job ;
select * from sys.employee_data where job in ('MANAGER','ANALYST') ;
select avg(sal),ename,job from sys.employee_data where job in ('MANAGER','ANALYST') group by job,deptno ;
select avg(sal),ename,job from sys.employee_data where job in ('MANAGER','ANALYST') group by job,deptno having avg(sal) >= 3000;

#Select only the duplicate records along-with their count.
select * from sys.Skills;
select *,count(*) from sys.Skills group by id,name having count(*) > 1;

#16) Select only the non-duplicate records.
select * from sys.Skills;
select * from sys.Skills group by id,name having count(*) = 1;

#17) Select only the duplicate records that are duplicated only once. 
select * from sys.Skills;
select * from sys.Skills group by id,name having count(*) = 2; #nonduplicate/distinct means count = 1 , duplicated only once means distinct + 1 time => 2 times

#18) Select only the duplicate records that are not having the id=101.
select * from sys.Skills;
select *,count(*) from sys.Skills group by id,name having count(*) > 1;
select *,count(*) from sys.Skills group by id,name having count(*) > 1 and id != 101;

#
