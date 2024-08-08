CREATE OR REPLACE PROCEDURE udp_awarded_production (
    IN production_title VARCHAR(70)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE actors AS acc
    SET awards = awards + 1
    FROM productions_actors AS p_a
        JOIN productions AS p ON
            p_a.production_id = p.id
    WHERE
        (p.title = production_title)
        AND
        (acc.id = p_a.actor_id);
END;
$$;