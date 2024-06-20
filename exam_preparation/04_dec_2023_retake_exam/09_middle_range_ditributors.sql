SELECT
    d.name AS distributor_name,
    i.name AS ingredient_name,
    p.name AS product_name,
    AVG(f.rate) AS average_rate
FROM distributors AS d
    JOIN ingredients AS i ON
        d.id = i.distributor_id
            JOIN products_ingredients AS p_i ON
                    i.id = p_i.ingredient_id
                JOIN products AS p ON
                    p_i.product_id = p.id
                        JOIN feedbacks as f ON
                          f.product_id = p.id

GROUP BY d.name, i.name, p.name
HAVING AVG(f.rate) BETWEEN  5.00 AND 8.00
ORDER BY d.name, i.name, p.name
;




