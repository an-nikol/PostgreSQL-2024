SELECT
    p.id AS production_id,
    p.title,
    pr_info.duration,
    ROUND(budget, 1) AS budget,
    TO_CHAR(pr_info.release_date, 'MM-YY')
FROM productions AS p
    JOIN productions_info AS pr_info ON
        p.production_info_id = pr_info.id
WHERE
    EXTRACT(YEAR FROM pr_info.release_date) IN (2023, 2024)
    AND
    pr_info.budget > 1500000.00
ORDER BY
    budget,
    pr_info.duration DESC,
    p.id
LIMIT 3
;