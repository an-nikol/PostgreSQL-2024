CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))

RETURNS TABLE (
    team_name VARCHAR(45)
)
AS
$$
	BEGIN
		RETURN
		QUERY
		SELECT
		    t.name
		FROM teams AS t
		    JOIN stadiums AS s ON
		        t.stadium_id = s.id
		GROUP BY t.name, s.name
		HAVING s.name = stadium_name
	    ORDER BY t.name;
	END;
$$
LANGUAGE plpgsql;


SELECT fn_stadium_team_name('Quaxo')