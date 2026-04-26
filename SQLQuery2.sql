--2. INTERMEDIATE QUERIES (GROUP BY, JOINS)

--🔹 Aggregations
--Count employees by DepartmentType
--Average Current Employee Rating per department
--Average Engagement Score per employee
--Total training cost per employee
--Count applicants per Job Title

select
DepartmentType,
count(*) as NumberOfEmploye
from employees
group by DepartmentType;

select
DepartmentType,
count(*) as NumberOfEmploye,
avg(Current_Employee_Rating) as avgRating
from employees
group by DepartmentType;

SELECT
    Employee_ID,
    AVG(Engagement_Score) AS AvgEngagement
FROM EmployeeEngagement
GROUP BY Employee_ID;


SELECT
    Employee_ID,
    SUM(Training_Cost) AS TotalTrainingCost
FROM EmployeeTraining
GROUP BY Employee_ID;

select
Job_Title,
count(*) as applications
from Recruitment
group by Job_Title;



--🔹 JOINS (Very Important)
--Join Employees + Survey → show engagement per employee
--Join Employees + Training → show training history
--Join Employees + Training → total training cost per employee
--Join Employees + Survey → avg satisfaction by department
--Join Recruitment + Employees → hired vs applied analysis


select
e.EmpID,
s.Engagement_Score
from employees as e
inner join EmployeeEngagement as s
on e.EmpID=s.Employee_ID


select
e.EmpID,
t.Training_Date
from employees as e
inner join EmployeeTraining as t
on e.EmpID=t.Employee_ID
group by e.EmpID,t.Training_Date
order by e.EmpID,t.Training_Date

select
e.EmpID,
sum(t.Training_Cost) as totalTrainingCost
from employees as e
inner join EmployeeTraining as t
on e.EmpID=t.Employee_ID
group by e.EmpID



select
e.DepartmentType,
avg(s.Satisfaction_Score) as avgScore
from employees as e
inner join EmployeeEngagement as s
on e.EmpID=s.Employee_ID
group by DepartmentType


SELECT
    r.Applicant_ID,
    r.First_Name,
    r.Status,
    e.EmpID
FROM Recruitment r
LEFT JOIN Employees e
ON r.Email = e.ADEmail;


