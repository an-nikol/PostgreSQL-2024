SELECT
    p.name AS product_name,
    ROUND(AVG(p.price), 2) AS average_price,
    COUNT(product_id) AS total_feedbacks
FROM products AS p
    JOIN feedbacks AS f ON
        p.id = f.product_id
GROUP BY p.name, p.price
HAVING p.price > 15.00 AND COUNT(product_id) > 1
ORDER BY total_feedbacks, average_price DESC
;
