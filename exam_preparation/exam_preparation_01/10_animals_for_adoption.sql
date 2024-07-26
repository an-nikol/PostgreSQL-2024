SELECT
    a.name AS animal,
    EXTRACT (YEAR FROM birthdate) AS birth_year,
    a_t.animal_type AS animal_type
FROM animals AS a
    JOIN animal_types AS a_t ON
        a.animal_type_id = a_t.id
WHERE
    owner_id is NULL
    AND
    EXTRACT(YEAR FROM birthdate) >= 2017
    AND
    a_t.animal_type <> 'Birds'
ORDER BY
    a.name
;