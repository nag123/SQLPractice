#44) Get all the employees who work in the same departments as of SCOTT
#STEP 1 : FIND THE DEPTMENT OF SCOTT
select * FROM sys.employee_data;
select deptno from sys.employee_data where ename = 'SCOTT';
#USING SUB QUERIES
select * from sys.employee_data where deptno = (select deptno from sys.employee_data where ename = 'SCOTT') ;
#USING SELF JOIN
select EMP_DATA.* from sys.employee_data EMP_DATA join sys.employee_data SCOTT_DATA
 on EMP_DATA.deptno = SCOTT_DATA.deptno 
 and SCOTT_DATA.ename = "SCOTT";
 
#45) Display all the employees who have joined before their managers.
#STEP 1 : first employee , their manager and their hiredate
select * from (select emp.empno,emp.ename,emp.hiredate,emp.mgr,mgr.ename AS manager_name,mgr.hiredate as mgr_hiredate ,emp.hiredate < mgr.hiredate as joined_before_manager_date
from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno) employee_details;

#step 2 : filter out the dates that are not 0 and select all the employees so display the empno,ename details
select empno,ename from (select emp.empno,emp.ename,emp.hiredate,emp.mgr,mgr.ename AS manager_name,mgr.hiredate as mgr_hiredate ,emp.hiredate < mgr.hiredate as joined_before_manager_date
from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno) employee_details
where joined_before_manager_date > 0 ;

#self join query
SELECT emp.empno, emp.ename
FROM sys.employee_data emp
LEFT JOIN sys.employee_data mgr ON emp.mgr = mgr.empno
WHERE emp.hiredate < mgr.hiredate;

#46) List all the employees who are earning more than their managers.
#STEP 1 : EMPLOYEE EARNING MORE SAL THAN MANAGER WITH NEW COLUMN
select * from (select emp.empno,emp.ename,emp.sal,emp.mgr,mgr.ename AS manager_name,mgr.sal as mgr_sal ,emp.sal >  mgr.sal as more_sal_employee
from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno) employee_details;

select EMPNO,ENAME from (select emp.empno,emp.ename,emp.sal,emp.mgr,mgr.ename AS manager_name,mgr.sal as mgr_sal ,emp.sal >  mgr.sal as more_sal_employee
from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno) employee_details
WHERE more_sal_employee > 0 ;

#self join query
SELECT emp.empno, emp.ename
FROM sys.employee_data emp
LEFT JOIN sys.employee_data mgr ON emp.mgr = mgr.empno
WHERE emp.sal > mgr.sal;

#47) Fetch all the employees who are earning same salaries.
select * FROM sys.employee_data;

#step 1 : select emp with condition
SELECT *
FROM sys.employee_data emp1
 JOIN sys.employee_data emp2 
ON emp1.sal = emp2.sal and emp1.empno != emp2.empno;

#step 2 : select required columns
SELECT emp1.empno,emp1.ename
FROM sys.employee_data emp1
JOIN sys.employee_data emp2 
ON emp1.sal = emp2.sal and emp1.empno <> emp2.empno;

#48) Select all the employees who are earning same as SMITH.
SELECT * FROM sys.employee_data ;
#STEP1 : GET SMITH earning and inner query
select ename from sys.employee_data where sal = (select sal from sys.employee_data where ename = 'SMITH');

#using self join
SELECT e1.ename 
FROM sys.employee_data e1 
JOIN sys.employee_data e2 
ON e1.sal = e2.sal 
WHERE e2.ename = 'SMITH';

#49) Display employee name , his date of joining, his manager name & his manager's date of joining.
#self  -> left join
select * from sys.employee_data;

SELECT emp.ename,emp.hiredate,mgr.ename,mgr.hiredate
FROM sys.employee_data emp
LEFT JOIN sys.employee_data mgr ON emp.mgr = mgr.empno;
