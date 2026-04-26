--3. ADVANCED QUERIES (Window Functions, CASE, Subqueries)
--🔹 Window Functions
--Rank employees by Performance Score
--Top 5 employees per department
--Running total of training cost per employee
--Rank applicants by Desired Salary



select
rank() over(order by Performance_Score,Current_Employee_Rating,StartDate),
*
from employees;

with ranking as (
select
rank() over(partition by DepartmentType order by Current_Employee_Rating,Performance_Score,StartDate) as rt,
DepartmentType,
EmpID
from employees
)
select
*
from ranking
where rt<5;

select
Employee_ID,
sum(Training_Cost) over(ORDER BY Employee_ID rows between Unbounded Preceding and Current Row)
from EmployeeTraining;

select
rank() over(order by Desired_Salary),
*
from Recruitment



--CASE Statements
--Categorize employees:
--High Performer
--Average
--Low Performer

select
*,
CASE
	when Current_Employee_Rating<=2 then 'Low Performer'
	when Current_Employee_Rating=3 then 'Average'
	when Current_Employee_Rating>=4 then 'High Performer'
END as employeCategory
from employees;


--Subqueries
--Employees with above-average rating
--Departments with highest avg performance
--Employees who spent more than avg training cost

with avgRatingQ as(
select
*,
avg(Current_Employee_Rating) over() as avgRating
from employees
)
select
*
from avgRatingQ
where avgRating<Current_Employee_Rating;


with avgRatingQ as(
select
DepartmentType,
avg(Current_Employee_Rating) as avgRating
from employees
group by DepartmentType
)
select
*
from avgRatingQ
order by avgRating desc;


with avgCostQ as (
select
*,
avg(Training_Cost) over() as avgCost
from EmployeeTraining
)
select
*
from avgCostQ
where Training_Cost>avgCost;

--4. REAL-WORLD BUSINESS QUERIES (Very Important)
--HR Analytics
--1. Attrition Analysis

select
TerminationType,
count(*) as total
from employees
group by TerminationType
order by total desc

--2. Average Tenure of Employees

select
avg(DATEDIFF(MONTH,StartDate,ISNULL(ExitDate, GETDATE()))) as avgMonthEmpl
from employees

--3. High Risk Employees (Low engagement + low performance)

select
*
from EmployeeEngagement as s
inner join employees as e
on s.Employee_ID=e.EmpID
where s.Engagement_Score<=2 and e.Performance_Score in ('Needs Improvement','PIP')

--4. Top Performing Departments

SELECT
    e.DepartmentType,
    AVG(e.Current_Employee_Rating) AS AvgRating
FROM Employees e
GROUP BY e.DepartmentType
ORDER BY AvgRating DESC;


--5. Training vs Performance

SELECT
    e.EmpID,
    COUNT(t.Training_Cost) AS TrainingCount,
    AVG(e.Current_Employee_Rating) AS Rating
FROM Employees e
LEFT JOIN EmployeeTraining t
ON e.EmpID = t.Employee_ID
GROUP BY e.EmpID;

--6. Conversion Rate (Applicants → Employees)

SELECT
    COUNT(DISTINCT e.EmpID) * 1.0 /
    COUNT(DISTINCT r.Applicant_ID) AS ConversionRate
FROM Recruitment r
LEFT JOIN Employees e
ON r.Email = e.ADEmail;


--7. Most Demanded Job Roles

SELECT TOP 1
    Job_Title,
    COUNT(*) AS Applications
FROM Recruitment
GROUP BY Job_Title
ORDER BY Applications DESC;

--8. Department with Lowest Satisfaction
select top 1
e.DepartmentType,
avg(s.Satisfaction_Score) as SatScore
from employees as e
inner join EmployeeEngagement as s
on e.EmpID=s.Employee_ID
group by e.DepartmentType
order by SatScore asc;

--9. Total Training Cost by Department
select
e.DepartmentType,
sum(t.Training_Cost) as toalCost
from EmployeeTraining as t
inner join employees as e
on t.Employee_ID=e.EmpID
group by e.DepartmentType;

