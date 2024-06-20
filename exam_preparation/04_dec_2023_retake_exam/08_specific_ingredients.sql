SELECT
    i.name,
    p.name,
    d.name
FROM products_ingredients AS p_i
    JOIN ingredients AS i
        ON p_i.ingredient_id = i.id
            JOIN products AS p
                ON p_i.product_id = p.id
                    JOIN distributors AS d ON
                        i.distributor_id = d.id
WHERE i.name in ('Mustard', 'mustard') AND d.country_id = 16
ORDER BY p.name
;