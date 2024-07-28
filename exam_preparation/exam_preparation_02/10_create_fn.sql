CREATE OR REPLACE FUNCTION fn_courses_by_client(
	phone_num VARCHAR(20)
)
RETURNS INT
AS $$
DECLARE
    course_count INT;
BEGIN
    SELECT 
		COUNT(*) 
	INTO 
		course_count
    FROM 
		courses AS cou
    JOIN 
		clients AS cl 
		ON
		cou.client_id = cl."id"
    WHERE 
		cl.phone_number = phone_num;

    RETURN course_count;
END;
$$ 
LANGUAGE plpgsql;
