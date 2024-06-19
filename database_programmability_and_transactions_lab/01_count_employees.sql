CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR)
RETURNS INT AS
$$
    DECLARE e_count INT;
	BEGIN
        SELECT
            COUNT(employee_id) INTO e_count
        FROM towns AS t
            JOIN addresses AS a
                USING(town_id)
                    JOIN employees AS e
                        USING(address_id)
        WHERE t.name = town_name;
        RETURN e_count;
	END;
$$
LANGUAGE plpgsql;
