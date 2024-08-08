CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS VARCHAR AS $$
DECLARE
    category_id_searched INT;
	result VARCHAR;
	count_of_prod INT;
BEGIN

    SELECT id INTO category_id_searched FROM categories WHERE categories.name = category_name;

    SELECT COUNT(*) INTO count_of_prod FROM categories_productions WHERE category_id = category_id_searched;

    SELECT CONCAT('Found ',count_of_prod,' productions.') INTO result;

    RETURN result;
END;
$$ LANGUAGE plpgsql;
