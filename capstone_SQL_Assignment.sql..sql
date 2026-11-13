CREATE SCHEMA capstone;
USE capstone;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM employees;
SELECT * FROM employees LIMIT 10;
DESCRIBE employees;
SELECT
    MIN(CAST(salary AS DECIMAL(10,2))) AS lowest_salary,
    MAX(CAST(salary AS DECIMAL(10,2))) AS highest_salary,
    AVG(CAST(salary AS DECIMAL(10,2))) AS average_salary
FROM employees;
SELECT emp_name, salary, job_id
FROM employees
ORDER BY CAST(salary AS DECIMAL(10,2)) DESC
LIMIT 5;
SELECT
    department_id,
    COUNT(*) AS employee_count,
    AVG(CAST(salary AS DECIMAL(10,2))) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;
SELECT
    department_id,
    AVG(CAST(salary AS DECIMAL(10,2))) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 5;
SELECT emp_name, salary, job_id, department_id
FROM employees
ORDER BY CAST(salary AS DECIMAL(10,2)) DESC
LIMIT 1;
SELECT
    job_id,
    COUNT(*) AS employee_count,
    AVG(CAST(salary AS DECIMAL(10,2))) AS average_salary
FROM employees
GROUP BY job_id
ORDER BY average_salary DESC;
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;
SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
SELECT emp_name, salary, job_id, department_id
FROM employees
WHERE CAST(salary AS DECIMAL(10,2)) >
      (SELECT AVG(CAST(salary AS DECIMAL(10,2))) FROM employees)
ORDER BY CAST(salary AS DECIMAL(10,2)) DESC;
SELECT emp_name, salary, job_id, department_id
FROM employees
WHERE CAST(salary AS DECIMAL(10,2)) <
      (SELECT AVG(CAST(salary AS DECIMAL(10,2))) FROM employees)
ORDER BY CAST(salary AS DECIMAL(10,2)) ASC;
SELECT COUNT(*) AS below_average_count
FROM employees
WHERE CAST(salary AS DECIMAL(10,2)) <
      (SELECT AVG(CAST(salary AS DECIMAL(10,2)))
       FROM employees);
       SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY employee_count DESC;
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))), 2) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC;
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))), 2) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
SELECT
    emp_name,
    salary,
    job_id,
    department_id
FROM employees

SELECT emp_name, salary, job_id
FROM employees
WHERE CAST(salary AS DECIMAL(10,2)) >
      (SELECT AVG(CAST(salary AS DECIMAL(10,2)))
       FROM employees)
ORDER BY CAST(salary AS DECIMAL(10,2)) DESC;
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))), 2) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC;
SELECT emp_name, salary, job_id, department_id
FROM employees
ORDER BY CAST(salary AS DECIMAL(10,2)) DESC
LIMIT 5;
SELECT e.emp_name, e.salary, e.department_id
FROM employees e
WHERE CAST(e.salary AS DECIMAL(10,2)) >
(
    SELECT AVG(CAST(e2.salary AS DECIMAL(10,2)))
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
SELECT
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
SELECT
    job_id,
    COUNT(*) AS employee_count,
    ROUND(AVG(CAST(salary AS DECIMAL(10,2))), 2) AS average_salary,
    MAX(CAST(salary AS DECIMAL(10,2))) AS highest_salary,
    MIN(CAST(salary AS DECIMAL(10,2))) AS lowest_salary
FROM employees
GROUP BY job_id
ORDER BY average_salary DESC;
SELECT
    department_id,
    SUM(CAST(salary AS DECIMAL(10,2))) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 5;
SELECT
    d.department_name,
    SUM(CAST(e.salary AS DECIMAL(10,2))) AS total_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_salary DESC
LIMIT 5;
SELECT
    d.department_name,
    ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))), 2) AS average_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC
LIMIT 5;
SELECT
    d.department_name,
    ROUND(AVG(CAST(e.salary AS DECIMAL(10,2))), 2) AS average_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC
LIMIT 5;
SELECT
    d.department_name,
    e.emp_name,
    CAST(e.salary AS DECIMAL(10,2)) AS salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE CAST(e.salary AS DECIMAL(10,2)) = (
    SELECT MAX(CAST(e2.salary AS DECIMAL(10,2)))
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY salary DESC;
SELECT
    e.emp_name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE CAST(e.salary AS DECIMAL(10,2)) > (
    SELECT AVG(CAST(e2.salary AS DECIMAL(10,2)))
    FROM employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY d.department_name, CAST(e.salary AS DECIMAL(10,2)) DESC;
SELECT
    emp_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY CAST(salary AS DECIMAL(10,2)) DESC
    ) AS salary_rank
FROM employees
ORDER BY department_id, salary_rank;

USE capstone;



SELECT
    CASE
        WHEN CAST(salary AS DECIMAL(10,2)) < 5000 THEN 'Low'
        WHEN CAST(salary AS DECIMAL(10,2)) <= 10000 THEN 'Medium'
        ELSE 'High'
    END AS salary_band,
    COUNT(*) AS employee_count
FROM employees
GROUP BY salary_band
ORDER BY
    CASE salary_band
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
    END;
    SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM employees;



SELECT
    emp_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

SELECT
    region,
    COUNT(*) AS total_countries
FROM countries
GROUP BY region
ORDER BY total_countries DESC;


SELECT
    j.job_title,
    COUNT(e.employee_id) AS employee_count
FROM jobs j
LEFT JOIN employees e
    ON j.job_id = e.job_id
GROUP BY j.job_id, j.job_title
ORDER BY employee_count DESC;

SELECT
    c.country_name,
    ROUND(AVG(e.salary), 2) AS average_salary,
    COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN countries c
    ON d.location_id = c.country_id
GROUP BY c.country_id, c.country_name
ORDER BY average_salary DESC;



DESCRIBE employees;

SELECT
    c.country_name,
    j.job_title,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
JOIN countries c
    ON e.country_id = c.country_id
JOIN jobs j
 
 WITH country_jobs AS (
    SELECT
        c.country_name,
        j.job_title,
        COUNT(e.employee_id) AS employee_count,
        ROUND(AVG(e.salary), 2) AS average_salary,
        RANK() OVER (
            PARTITION BY c.country_name
            ORDER BY AVG(e.salary) DESC
        ) AS salary_rank
    FROM employees e
    JOIN countries c
        ON e.country_id = c.country_id
    JOIN jobs j
        ON e.job_id = j.job_id
    GROUP BY c.country_name, j.job_title
)
SELECT
    country_name,
    job_title,
    employee_count,
    average_salary
FROM country_jobs
WHERE salary_rank = 1
ORDER BY average_salary DESC;
SELECT
    c.country_name,
    SUM(CAST(e.salary AS DECIMAL(10,2))) AS total_salary_cost
FROM employees e
JOIN countries c
    ON e.country_id = c.country_id
GROUP BY c.country_id, c.country_name
ORDER BY total_salary_cost DESC;
USE capstone;
SELECT
    j.job_id,
    j.job_title
FROM jobs j
LEFT JOIN employees e
    ON j.job_id = e.job_id
WHERE e.employee_id IS NULL
ORDER BY j.job_title;



-- =========================================
-- DATA ANALYSIS CAPSTONE PROJECT
-- PART A: SQL ASSIGNMENT
-- =========================================

-- QUESTION 1: Workforce Distribution
-- Count employees in each department.

-- QUESTION 2: Salary Comparison
-- Calculate average salary per department.

-- QUESTION 3: Salary Bands
-- Group employees into Low, Medium and High salary bands.

-- QUESTION 4: Country-Level Analysis
-- Limitation: The supplied dataset has no locations table.
-- Therefore, department counts by country cannot be reliably calculated.

-- QUESTION 5: High Earners
-- Identify employees earning above the company average.

-- QUESTION 6: Job Role Analysis
-- Calculate average salary by job title and identify averages above 12000.

-- QUESTION 7: Salary Growth Trend
-- Calculate total salary cost for each country.

-- QUESTION 8: Workforce Gaps
-- Identify job roles without assigned employees.