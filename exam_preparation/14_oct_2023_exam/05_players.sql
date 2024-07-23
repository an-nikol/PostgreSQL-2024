SELECT
    CONCAT(first_name,' ', last_name) as full_name,
    age,
    hire_date
FROM players
WHERE
    first_name LIKE 'M%'
ORDER BY age DESC, full_name
;