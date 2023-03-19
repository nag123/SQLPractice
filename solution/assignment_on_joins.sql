#EQUI JOIN
#34)Display all the managers & clerks who work in Accounts and Marketing departments
#PART 1 : WHO WORKS IN ACCOUNTS AND MARKETING DEPT
select * from sys.dept where dname in ('ACCOUNTING','SALES'); #10,30
#using subquery method
SELECT e.* FROM sys.employee_data where job in ('MANAGER','CLERK') AND DEPTNO IN (select DEPTNO from sys.dept where dname in ('ACCOUNTING','SALES'));
#using join method
select e.* from sys.employee_data e join sys.dept d on e.deptno = d.deptno where dname in ('ACCOUNTING','SALES') and job in ('MANAGER','CLERK');
/*NOTE : In general, JOIN operations are more efficient than subqueries. This is because subqueries are executed for each row in the outer query, 
while JOIN operations create a temporary table that can be used multiple times. 
However, the actual efficiency of a query depends on many factors such as
 the size of the tables, the presence of indexes, the complexity of the WHERE clause, and the specific database engine being used.
 
In the case of the two queries you provided, it's possible that the JOIN query may be more efficient than the subquery version,
 especially if there are indexes on the relevant columns. 
 */
 #35)Display all the salesmen who are not located at DALLAS.
 SELECT * FROM SYS.EMPLOYEE_DATA E JOIN SYS.DEPT D ON E.DEPTNO = D.DEPTNO AND LOC != 'DALLAS';
  SELECT * FROM SYS.EMPLOYEE_DATA E JOIN SYS.DEPT D ON E.DEPTNO = D.DEPTNO where LOC != 'DALLAS';
  
/*QUEST TIME : BOTH THE CODE GIVES THE SAME RESULT . HOWEVER TELL ME WHICH QUERY IS MORE EFFICIENT ???? TAKE 2 MINUTES TO THINK BEFORE ANSWERING*/

/*ANSWER ::: 
In terms of performance, the first query is generally more efficient because it uses the "AND" operator to filter results based on both the department location and department number,
 which can lead to fewer rows being joined together.
 
 In contrast, the second query uses the "WHERE" clause to filter results based only on the department location after the join, 
 which can result in more rows being joined and potentially slower performance. 
*/
#36)Select department name & location of all the employees working for CLARK.
#Select department name & location of all the employees  -> JOIN IT
select e.*,d.LOC from sys.employee_data e join sys.dept d on e.deptno = d.deptno ;
#EMPLOYEE WORKING FOR CLARK
select empno from sys.employee_data where ENAME = 'CLARK';
#Select department name & location of all the employees working for CLARK.
select e.*,d.LOC from sys.employee_data e join sys.dept d on e.deptno = d.deptno  where e.mgr = (select empno from sys.employee_data where ENAME = 'CLARK');

#FOR BLAKE WE SHOULD GET 5 EMPLOYEES -> JUST VALIDATING FOR CONFIRMATION
select e.*,d.LOC from sys.employee_data e join sys.dept d on e.deptno = d.deptno  where e.mgr = (select empno from sys.employee_data where ENAME = 'BLAKE');

#37)Select all the departmental information for all the managers
SELECT E.*,D.DNAME,D.LOC FROM SYS.EMPLOYEE_DATA E JOIN SYS.DEPT D ON E.DEPTNO = D.DEPTNO AND E.JOB = 'MANAGER';

#38)Select all the employees who work in DALLAS
SELECT E.*,D.DNAME,D.LOC FROM SYS.EMPLOYEE_DATA E JOIN SYS.DEPT D ON E.DEPTNO = D.DEPTNO AND D.LOC = 'DALLAS';

#39) Delete the records from the DEPT table that don’t have matching records in EMP
SELECT * FROM SYS.DEPT;
SELECT * FROM SYS.EMPLOYEE_DATA; #NO EMPLOYEE BELONG TO DEPTNO = 40

#LETS DO THE SELECT AND THE DELETE THEN
#USING SUBQUERIES 
SELECT * FROM SYS.DEPT
WHERE NOT EXISTS
(SELECT * FROM SYS.employee_data EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);

#USING JOINS
select * from sys.dept where deptno not in ( SELECT e.deptno FROM SYS.employee_data E join SYS.DEPT d on E.DEPTNO = d.deptno );

#deleting
#METHOD 1 : USING SUBQUERIES 
delete FROM SYS.DEPT
WHERE NOT EXISTS
(SELECT * FROM SYS.employee_data EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);

#METHOD 2 : USING JOINS
DELETE FROM sys.dept 
WHERE deptno NOT IN (SELECT derived.deptno FROM 
                     (SELECT e.deptno FROM SYS.employee_data e 
                      JOIN SYS.DEPT d ON e.DEPTNO = d.DEPTNO) AS derived)