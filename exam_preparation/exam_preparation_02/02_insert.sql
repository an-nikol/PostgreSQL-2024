INSERT INTO clients (full_name, phone_number)
SELECT
    CONCAT(first_name, ' ', last_name),
    CONCAT('(088) 9999', CAST(id * 2 AS VARCHAR))
FROM
    drivers
WHERE
    id BETWEEN 10 AND 20
;