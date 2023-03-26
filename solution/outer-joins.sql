#40) Display all the departmental information for all the existing employees and if a department has no employees display it as “No employees”.
select * from sys.dept;
select * from sys.employee_data;
#there is no full outer join in mysql you need to do left join union of right join so doing join as below
select e.*,d.deptno as dept_no_from_dept from sys.dept d left join sys.employee_data e on d.deptno = e.deptno union select e.*,d.deptno as dept_no_from_dept from sys.dept d right join sys.employee_data e on d.deptno = e.deptno  ;

select * , case when deptno in (select deptno from sys.dept) then "employees" else "No employees" end as is_employee_present from (
select e.empno,e.ename,e.deptno,d.deptno as dept_no_from_dept,d.dname,d.loc from sys.dept d left join sys.employee_data e on d.deptno = e.deptno
union 
select e.empno,e.ename,e.deptno,d.deptno as dept_no_from_dept,d.dname,d.loc from sys.dept d right join sys.employee_data e on d.deptno = e.deptno
) x ;


#41) Get all the matching & non-matching records from both the tables.
select e.*,d.* from sys.dept d left join sys.employee_data e on d.deptno = e.deptno
union 
select e.*,d.* from sys.dept d right join sys.employee_data e on d.deptno = e.deptno;

#42) Get only the non-matching records from DEPT table (matching records shouldn’t be selected).
select deptno,dname,loc from (select e.deptno as emp_deptno,d.* from sys.dept d left join sys.employee_data e on d.deptno = e.deptno
union 
select e.deptno as emp_deptno,d.* from sys.dept d right join sys.employee_data e on d.deptno = e.deptno) aaa
where emp_deptno is null;

#43) Select all the employees name along with their manager names, and if an employee does not have a manager, display him as “CEO”.
select * from sys.employee_data ;
select emp.empno,emp.ename,emp.mgr,mgr.ename AS manager_name from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno;
select emp.empno,emp.ename,emp.mgr,IFNULL(mgr.ename, 'CEO') AS manager_name from sys.employee_data emp left join sys.employee_data mgr on emp.mgr = mgr.empno;

#TO IMPLEMENT USING FULL OUTER JOIN 
select  empno,emp_ename, ename from (SELECT emp.empno, emp.ename as emp_ename, emp.mgr, mgr.ename
FROM sys.employee_data emp
LEFT JOIN sys.employee_data mgr ON emp.mgr = mgr.empno
UNION
SELECT emp.empno, emp.ename as emp_ename, emp.mgr, 'CEO' AS ename
FROM sys.employee_data emp
WHERE emp.mgr IS NULL) employee_mgr_relation
where ename is not null;
