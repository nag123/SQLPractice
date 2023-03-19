 #19)Display all the employees who are earning more than all the managers.
 select * from sys.employee_data;
 select * from sys.employee_data where job = "MANAGER";
 select max(sal) from sys.employee_data where job = "MANAGER"; #2975
 select * from sys.employee_data where sal > (select max(sal) from sys.employee_data where job = "MANAGER");
 
#20)Display all the employees who are earning more than any of the managers.
SELECT * FROM sys.Employee_data ;
 SELECT SAL FROM sys.Employee_data WHERE JOB = 'MANAGER';#2450,2850,2975
 SELECT * FROM sys.Employee_data WHERE SAL > ANY(SELECT SAL FROM Employee_data WHERE JOB = 'MANAGER');
 
 #21)Select employee number, job & salaries of all the Analysts who are earning more than any of the managers
 SELECT * FROM sys.Employee_data ;
 SELECT empno,job,sal FROM sys.Employee_data WHERE JOB = 'ANALYST'; #2450,2850,2975
  SELECT empno,job,sal FROM sys.Employee_data WHERE JOB = 'ANALYST' and sal > ANY(select sal from sys.Employee_data where job = 'MANAGER');
  
  #22)Select all the employees who work in DALLAS.
 SELECT * FROM sys.Employee_data ;
 SELECT * FROM sys.DEPT;
select * from sys.employee_data where deptno in (SELECT DEPTNO FROM sys.DEPT where LOC = 'DALLAS');

#23)Select department name & location of all the employees working for CLARK.
 SELECT * FROM sys.Employee_data ;
 select *  FROM sys.DEPT;
 select EMPNO from sys.employee_data where ename = 'CLARK'; #7782
 select * from sys.employee_data where mgr =  7782;
SELECT deptno,loc FROM sys.DEPT where deptno in (select  deptno from sys.employee_data where mgr =  ( select EMPNO from sys.employee_data where ename = 'CLARK'));

#24)Select all the departmental information for all the managers
select * from sys.DEPT where deptno in (select deptno from sys.employee_data where JOB = "MANAGER");

#25)Display the first maximum salary
select max(sal) from sys.employee_data;

#26)Display the second maximum salary. 
select *, dense_rank() over(order by sal desc)r from sys.employee_data; #give your rank you want to give based on rank using column r
select * from (select *, dense_rank() over(order by sal desc)r from sys.employee_data) n where r= 2;

#27)Display the third maximum salary.
select *, dense_rank() over(order by sal desc)r from sys.employee_data; #If the question is based on minimum salary change the order to asc in the dense_rank over
select * from (select *, dense_rank() over(order by sal desc)r from sys.employee_data) n where r= 3;

#28)Display all the managers & clerks who work in Accounts and Marketing departments.
select deptno from sys.dept where dname in ('ACCOUNTING','SALES');
select * from sys.employee_data where job in ('MANAGER','CLERK');
select * from sys.employee_data where job in ('MANAGER','CLERK') and deptno in (10,30);
select * from sys.employee_data where job in ('MANAGER','CLERK') and deptno in ("select deptno from sys.dept where dname in ('ACCOUNTING','SALES')");
#remember not to use double quotes in subquery of mysql , which gives wrong value , So the correct solution would be 
select * from sys.employee_data where job in ('MANAGER','CLERK') and deptno in (select deptno from sys.dept where dname in ('ACCOUNTING','SALES'));

#29)Display all the salesmen who are not located at DALLAS.
select deptno from sys.dept where loc = 'DALLAS'; #deptno 20 is for dallas ,10,30,40 -> remaining location
select * from sys.employee_data where JOB = 'SALESMAN' and deptno not in (select deptno from sys.dept where loc = 'DALLAS');

#30) Get all the employees who work in the same departments as of SCOTT.
select * from sys.employee_data ;
select deptno from sys.employee_data where ename = 'SCOTT' ; #so scott works in deptno = 20
select * from sys.employee_data where deptno in (select deptno from sys.employee_data where ename = 'SCOTT');

#31) Select all the employees who are earning same as SMITH.
select * from sys.employee_data;
select sal from sys.employee_data;
select sal from sys.employee_data where ename = 'SMITH';
select * from sys.employee_data where sal = (select sal from sys.employee_data where ename = 'SMITH');

#32) Display all the employees who are getting some commission in marketing department where the employees have joined only on weekdays.
#lets split the question and solve one by one
SELECT * FROM sys.Employee_data; 
SELECT *,WEEKDAY(HIREDATE) FROM sys.Employee_data ;# 5,6 were saturday and sunday -> 0 to 4 => monday to friday
#where the employees have joined only on weekdays.
SELECT * FROM sys.Employee_data WHERE WEEKDAY(HIREDATE) NOT IN (5, 6);
#who are getting some commission in marketing department
select DEPTNO from sys.dept where dname = 'SALES'; #30
select * from sys.employee_data where deptno in (select DEPTNO from sys.dept where dname = 'SALES') and (comm != 0 and comm is not null) ;

#33) Display all the employees who are getting more than the average salaries of all the employees.
# average salaries of all the employees.
select * from sys.employee_data;
select avg(sal) from sys.employee_data; #2073.2143 -> 8 employees having less than avg , 6 more than avg
select * from sys.employee_data where sal > (select avg(sal) from sys.employee_data);

