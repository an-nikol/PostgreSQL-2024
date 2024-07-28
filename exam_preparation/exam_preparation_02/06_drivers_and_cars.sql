SELECT
    d.first_name,
    d.last_name,
    c.make,
    c.model,
    c.mileage
FROM cars_drivers AS c_d
    JOIN cars AS c ON
        c_d.car_id = c.id
            JOIN drivers AS d ON
                c_d.driver_id = d.id
WHERE mileage IS NOT NULL
ORDER BY
    c.mileage DESC,
    d.first_name