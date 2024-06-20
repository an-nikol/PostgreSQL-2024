CREATE TABLE gift_recipients(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    country_id INT,
    gift_sent BOOLEAN DEFAULT FALSE
);

INSERT INTO gift_recipients (name, country_id)
SELECT
    CONCAT(first_name,' ', customers.last_name),
    country_id
FROM customers
;

UPDATE gift_recipients
SET gift_sent = TRUE
WHERE country_id in (7, 8, 14, 17, 26)
;
