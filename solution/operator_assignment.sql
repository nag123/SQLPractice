select * from sys.Employee_data;
#1) Display all the employees who are getting 2500 and excess salaries in department 20.
select * from sys.Employee_data where sal >= 2500 and deptno = 20;
#2) Display all the managers working in 20 & 30 department.
select * from sys.Employee_data;
select mgr from sys.Employee_data where deptno in (20,30);
select ename,mgr from sys.Employee_data where empno in (select mgr from sys.Employee_data where deptno in (20,30));

#3) Display all the managers who don’t have a manager
select * from sys.Employee_data WHERE mgr is NULL; #PRESIDENT DONT HAVE A MANAGER

select m.*,e.empno,e.mgr from sys.Employee_data m
left join sys.Employee_data e on m.empno = e.mgr
where e.empno IS NULL;							   #CLERK AND SALESMAN WERE NOT THE MANAGERS OF ANY			

select m.*,e.empno,e.mgr from sys.Employee_data m
left join sys.Employee_data e on m.empno = e.mgr
where e.empno IS NULL
and m.JOB = "MANAGER";								#ALL THE MANAGERS REPORTS TO PRESIDENT AND MANAGERS MANAGES THE ANALYST,CLERK , SALESMAN

#Display all the employees who are getting some commission with their designation is neither MANANGER nor ANALYST

#FILTER FIRST ON DESIGNATION = MANAGER OR ANALYST
SELECT * FROM sys.Employee_data WHERE JOB IN ("MANAGER","ANALYST");

SELECT * FROM sys.Employee_data WHERE JOB IN ("MANAGER","ANALYST") AND COMM IS NOT NULL; #So MANAGER AND ANALYST DOESNT GET COMMISSION

#5) Display all the ANALYSTs whose name doesn’t ends with ‘S’ 
SELECT * FROM sys.Employee_data ; #ONLY ADAMS,JONES,JAMES NAME END WITH S BUT THEY ARE NOT ANALYST
SELECT COUNT(*) FROM sys.Employee_data ; #14-3 = 11
SELECT * FROM sys.Employee_data WHERE ENAME NOT LIKE '%S';
SELECT * FROM sys.Employee_data WHERE JOB =  'ANALYST'; #BOTH SCOTT AND FORD NAME DOESNT END WITH 'S' SO WE SHOULD GET 2 RECORDS
SELECT * FROM sys.Employee_data WHERE JOB =  'ANALYST' AND ENAME NOT LIKE '%S';

#6) Display all the employees whose naming is having letter ‘E’ as the last but one character
SELECT * FROM sys.Employee_data;
SELECT * FROM sys.Employee_data where SUBSTRING(ENAME, -2, 1) = 'E'; #we should see allen,jones,turner,james,miller - 5 names

#7) Display all the employees who total salary is more than 2000.(Total Salary = Sal + Comm)
SELECT * FROM sys.Employee_data;
SELECT * FROM sys.Employee_data where coalesce(sal,0) + coalesce(Comm,0) > 2000;

#8) Display all the employees who are getting some commission in department 20 & 30.
SELECT * FROM sys.Employee_data where deptno in (20,30);
SELECT * FROM sys.Employee_data where deptno in (20,30) and comm > 0;

#9) Display all the managers whose name doesn't start with A & S
SELECT * FROM sys.Employee_data;
SELECT * FROM sys.employee_data WHERE JOB = 'MANAGER'; #we have jones,blake,clark
SELECT * FROM sys.employee_data WHERE JOB = 'MANAGER' AND ENAME NOT LIKE 'J%' AND ENAME NOT LIKE 'C%'; #just checking if the query filters jones and clark
SELECT * FROM sys.employee_data WHERE JOB = 'MANAGER' AND ENAME NOT LIKE 'A%' AND ENAME NOT LIKE 'S%'; #actual query which returns all the 3

#10) Display all the employees who earning salary not in the range of 2500 and 5000 in department 10 & 20.
SELECT * FROM sys.Employee_data where deptno in (10,20);
SELECT * FROM sys.Employee_data where deptno in (10,20) and SAL < 2500 OR SAL > 5000;

