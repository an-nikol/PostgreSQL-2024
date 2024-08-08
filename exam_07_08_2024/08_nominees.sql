SELECT
    c.name AS country_name,
    COUNT(p.id) AS productions_count,
    COALESCE(AVG(pro_info.budget), 0) AS avg_budget
FROM countries AS c
    JOIN productions AS p ON
        c.id = p.country_id
            JOIN productions_info AS pro_info ON
                p.production_info_id = pro_info.id
WHERE
    c.id in (SELECT country_id FROM productions)
GROUP BY
    c.name
ORDER BY
    productions_count DESC,
    c.name
;
