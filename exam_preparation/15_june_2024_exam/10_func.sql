CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30)) 
RETURNS INTEGER AS $$
DECLARE
    user_id INTEGER;
    photos_count INTEGER;
BEGIN
    SELECT id INTO user_id FROM accounts WHERE username = account_username;
    
    SELECT COUNT(*) INTO photos_count FROM accounts_photos WHERE account_id = user_id;
    
    RETURN photos_count;
END;
$$ LANGUAGE plpgsql;


-- CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
-- RETURNS INT AS
-- $$
-- 	BEGIN
-- 		RETURN (
-- 		    SELECT
-- 		        COUNT(*)
-- 		    FROM accounts_photos AS acc_ph
-- 		        JOIN accounts AS acc ON
-- 		            acc_ph.account_id = acc.id
-- 		    WHERE
-- 		        acc.username = account_username
-- 		    GROUP BY
-- 		        account_id
--             );
-- 	END;
-- $$
-- LANGUAGE plpgsql;