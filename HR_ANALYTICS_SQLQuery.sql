SELECT *
FROM hr_analytics


SELECT COUNT(EmpID) AS Total_employees
FROM hr_analytics


SELECT SUM(EmployeeCount) AS Total_employees
FROM hr_analytics


--Attrition by Job Satisfaction
SELECT COUNT(EmpID) AS total_emps, JobSatisfaction
FROM hr_analytics
WHERE Attrition = 1
GROUP BY JobSatisfaction
ORDER BY total_emps DESC


--Identify High-Performing Employees:
--Find employees with the highest performance ratings.
SELECT TOP 10 EmpID, PerformanceRating
FROM hr_analytics
ORDER BY PerformanceRating DESC


SELECT COUNT(*) AS Emp_count, PerformanceRating
FROM hr_analytics
GROUP BY PerformanceRating

--Attrition by Gender--
SELECT SUM(EmployeeCount) AS Emp_Count, Gender
FROM hr_analytics
WHERE Attrition = 1
GROUP BY Gender


--Attrition by Job Role--
SELECT SUM(EmployeeCount) AS Emp_Count, JobRole
FROM hr_analytics
WHERE Attrition = 1
GROUP BY JobRole
ORDER BY Emp_Count DESC


--Attrition by Salary--
SELECT SUM(EmployeeCount) AS Emp_Count, SalarySlab
FROM hr_analytics
WHERE Attrition = 1
GROUP BY SalarySlab
ORDER BY Emp_Count DESC


--Department wise Avg,Max and Min Salary
SELECT Department, AVG(MonthlyIncome) AS Avg_Sal, MAX(MonthlyIncome) AS Max_Sal, 
		MIN(MonthlyIncome) AS Min_Sal
FROM hr_analytics
GROUP BY Department


----Department wise Avg,Max and Min SalaryHike
SELECT Department, AVG(PercentSalaryHike) AS Avg_SalHike, MAX(PercentSalaryHike) AS Max_SalHike,
		MIN(PercentSalaryHike) AS Min_SalHike
FROM hr_analytics
GROUP BY Department


--Identify total number of male and female employees whose Marital Status is Married and haven't received
--promotion in the last 2 years
SELECT SUM(EmployeeCount) AS Emp_Count, Gender
FROM hr_analytics
WHERE Attrition = 1 AND MaritalStatus = 'Married' AND YearsSinceLastPromotion = 2
GROUP BY Gender 


--Employees with Max perfromance rating but no promotion for 4 years and above
SELECT *
FROM hr_analytics
WHERE PerformanceRating = (select max(PerformanceRating) from hr_analytics)
		AND YearsSinceLastPromotion >= 4
		AND Attrition = 1


--Employees working overtime but given min salary hike and are more than 5 years with company
SELECT *
FROM hr_analytics
WHERE OverTime = 1
		AND PercentSalaryHike = (select min(PercentSalaryHike) from hr_analytics)
		AND YearsAtCompany > 5
		AND Attrition = 1


--Employee attrition count by years at company
SELECT SUM(EmployeeCount) AS Emp_Count, YearsAtCompany
FROM hr_analytics
WHERE Attrition = 1
GROUP BY YearsAtCompany
ORDER BY Emp_Count DESC


--Attrition by Age Group
SELECT SUM(EmployeeCount) AS Emp_Count, AgeGroup
FROM hr_analytics
WHERE Attrition = 1
GROUP BY AgeGroup
ORDER BY Emp_Count DESC
