SELECT
    a.name AS address,
    CASE
        WHEN EXTRACT(HOUR FROM c.start) BETWEEN 6 and 20 THEN 'Day'
        WHEN EXTRACT(HOUR FROM c.start)  BETWEEN 0 and 5 THEN 'Night'
    ELSE
        'Night'
    END AS day_time,
    c.bill,
    cl.full_name,
    cr.make,
    cr.model,
    cg.name
FROM courses AS c
    JOIN addresses AS a ON
        c.from_address_id = a.id
            JOIN clients AS cl ON
                c.client_id = cl.id
                    JOIN cars AS cr ON
                        c.car_id = cr.id
                            JOIN categories AS cg ON
                                cr.category_id = cg.id
ORDER BY
    c.id
;