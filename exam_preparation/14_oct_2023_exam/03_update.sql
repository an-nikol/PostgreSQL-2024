UPDATE coaches
SET salary = salary * coach_level
WHERE
    id IN (
        SELECT
            coach_id
            FROM players_coaches
        )
    AND
    first_name LIKE 'C%'
;