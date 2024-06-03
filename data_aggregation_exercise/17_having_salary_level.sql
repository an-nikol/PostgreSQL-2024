SELECT
	department_id,
	COUNT(department_id) AS num_employees,
	CASE
		WHEN AVG(SALARY) > 50000 THEN 'Above average'
		ELSE 'Below average'
	END AS salary_level
FROM employees
GROUP BY department_id
HAVING 	AVG(SALARY) > 30000
ORDER BY department_id
;