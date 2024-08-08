DELETE FROM countries
WHERE
    id NOT IN ( SELECT country_id FROM actors)
    AND
    id NOT IN ( SELECT country_id FROM productions)
;