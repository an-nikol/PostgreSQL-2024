CREATE OR REPLACE PROCEDURE sp_withdraw_money(account_id INT, money_amount NUMERIC(10, 4))
AS
$$
	BEGIN
	    IF
            money_amount > (SELECT balance
                            FROM accounts
                            WHERE account_id = accounts.id)
	        THEN
	            RAISE NOTICE 'Insufficient balance';

	    ELSE
            UPDATE accounts
                SET balance = balance - money_amount
            WHERE account_id = accounts.id;

	    END IF;

    COMMIT;
	END;
$$
LANGUAGE plpgsql;
