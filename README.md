# 📊 HR Analytics SQL Project

## 📌 Project Overview

This project focuses on analyzing HR data using SQL to extract meaningful business insights. The dataset includes information about employees, recruitment, training, and employee engagement.

The goal of this project is to simulate real-world HR analytics scenarios such as attrition analysis, employee performance tracking, training effectiveness, and recruitment insights.

---

## 🗂️ Dataset Description

The project uses **4 main tables**:

### 👨‍💼 Employees

Contains core employee details:

* EmpID (Primary Key)
* Name, DepartmentType, Job Role
* StartDate, ExitDate
* EmployeeStatus (Active/Terminated)
* Performance_Score, Current_Employee_Rating
* TerminationType

---

### 😊 EmployeeEngagement

Contains employee survey data:

* Employee_ID (Foreign Key)
* Engagement_Score
* Satisfaction_Score
* Work_Life_Balance_Score

---

### 📚 EmployeeTraining

Contains training and development data:

* Employee_ID (Foreign Key)
* Training_Date
* Training_Type
* Training_Cost

---

### 🧑‍💻 Recruitment

Contains applicant data:

* Applicant_ID (Primary Key)
* Job_Title
* Years_of_Experience
* Desired_Salary
* Status
* Email

---

## 🎯 Objectives

* Analyze employee attrition trends
* Identify high-risk employees
* Evaluate department performance
* Measure training impact on performance
* Analyze recruitment funnel and hiring conversion
* Perform data cleaning and standardization

---

## 🛠️ SQL Concepts Used

* SELECT, WHERE, ORDER BY
* GROUP BY, HAVING
* INNER JOIN, LEFT JOIN
* Aggregate functions (COUNT, AVG, SUM)
* Window functions (RANK, ROW_NUMBER)
* CASE statements
* CTEs (Common Table Expressions)
* Subqueries

---

## 📊 Key Analysis & Insights

### 🔹 1. Attrition Analysis

* Identified employee exits using EmployeeStatus
* Standardized TerminationType (Voluntary, Involuntary, etc.)
* Calculated attrition rate and department-wise exits

---

### 🔹 2. Employee Performance Analysis

* Ranked employees based on ratings and performance score
* Identified top performers per department
* Categorized employees (High / Average / Low performers)

---

### 🔹 3. High-Risk Employees

* Detected employees with:

  * Low engagement score
  * Poor performance rating

---

### 🔹 4. Training Analysis

* Calculated total training cost per employee
* Compared training count vs performance
* Identified high training investment areas

---

### 🔹 5. Recruitment Analysis

* Counted applicants per job role
* Identified most demanded job titles
* Calculated conversion rate (Applicants → Employees)

---

### 🔹 6. Employee Satisfaction Insights

* Department-wise satisfaction analysis
* Identified departments with lowest satisfaction scores

---

## ⚠️ Data Challenges & Handling

* Inconsistent values in `TerminationType` (e.g., "Voluntary" vs "Resignation")
  → Resolved using CASE statements

* Some datasets had only one record per employee
  → Adjusted aggregation logic accordingly

---

## 🚀 Key Learnings

* Importance of understanding data before writing queries
* Writing business-driven SQL queries
* Using joins to combine multiple datasets
* Applying window functions for ranking and analysis
* Handling real-world data inconsistencies

---

## 📈 Future Improvements

* Build Power BI dashboard for visualization
* Add predictive analysis (attrition prediction)
* Include time-based trend analysis
* Optimize queries for performance

---

## 💡 Conclusion

This project demonstrates the ability to solve real-world HR business problems using SQL. It highlights strong understanding of data analysis, query optimization, and business thinking.

---



---
