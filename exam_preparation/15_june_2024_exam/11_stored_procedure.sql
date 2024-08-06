CREATE OR REPLACE PROCEDURE udp_modify_account(
    IN address_street VARCHAR(30),
    IN address_town VARCHAR(30)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts AS acc
    SET job_title = '(Remote) ' || job_title
    FROM addresses AS a
    WHERE a.account_id = acc.id
    AND a.street = address_street
    AND a.town = address_town;
END;
$$;