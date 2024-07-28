SELECT
    clients.full_name,
    COUNT(car_id) AS count_of_cars,
    SUM(courses.bill)
FROM clients
    JOIN courses ON
        clients.id = courses.client_id
WHERE
    full_name LIKE '_a%'
GROUP BY
    full_name
HAVING
    COUNT(car_id) > 1
ORDER BY
    clients.full_name
;