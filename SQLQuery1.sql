CREATE DATABASE HRAnalyticsDB;
GO
USE HRAnalyticsDB;


--Employees Table
--List all employees
--Show FirstName, LastName, Title
--Get employees from a specific DepartmentType
--Find employees from a specific State
--List employees who are Active
--Show employees hired after 2020
--Find employees with Performance Score = 'Exceeds'
--Sort employees by StartDate (latest first)
--Count total employees
--Count employees by GenderCode

select
*
from employees;

select
FirstName,
LastName,
Title
from employees;

select
*
from employees
where DepartmentType='Production';

select
*
from employees
where StartDate='2018-11-16';

select
*
from employees
where EmployeeStatus='Active';

select
*
from employees
where YEAR(StartDate)>=2020;


select
*
from employees
where Performance_Score='Exceeds';

select
*
from employees
order by StartDate asc;


select
count(*)
from employees;

select
GenderCode,
count(*)
from employees
group by GenderCode;


--Recruitment Data
--List all applicants
--Show applicants with Years of Experience > 3
--Filter applicants by City
--Find applicants applying for a specific Job Title
--Sort applicants by Desired Salary (highest first)

select
*
from Recruitment

select
*
from Recruitment
where Years_of_Experience>3

select
*
from Recruitment
where City='Lake Meganmouth'


select
*
from Recruitment
where Job_Title='Pilot, airline'


select
*
from Recruitment
order by Desired_Salary desc


--Training Data
--List all training programs
--Show training with cost > 5000
--Filter training by Training Type
--Count total training sessions

select
*
from EmployeeTraining


select
*
from EmployeeTraining
where Training_Cost>500


select
Training_Type
from EmployeeTraining
group by Training_Type



select
count(*)
from EmployeeTraining



--Survey Data
--List all survey responses
--Find employees with low engagement score (< 3)
--Average satisfaction score

select
*
from EmployeeEngagement

select
*
from EmployeeEngagement
where Engagement_Score<3


select
avg(Satisfaction_Score) as avgSatScore
from EmployeeEngagement
