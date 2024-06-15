SELECT
	e.employee_id,
	CONCAT(e.first_name, ' ', e.last_name) AS full_name,
	ep.project_id,
	p.name
FROM employees AS e
	JOIN employees_projects AS ep
		ON e.employee_id = ep.employee_id
			JOIN projects as p
				ON p.project_id = ep.project_id
WHERE ep.project_id = 1
;