CREATE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT AS
$$
	BEGIN
		RETURN (
		    SELECT
		        COUNT(*)
		    FROM volunteers AS v
		        JOIN volunteers_departments AS v_d ON
		            v.department_id = v_d.id
            WHERE
                department_name = searched_volunteers_department
            );
	END;
$$
LANGUAGE plpgsql;


