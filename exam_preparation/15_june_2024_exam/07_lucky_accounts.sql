SELECT
    CONCAT(ac.id, ' ', ac.username) AS id_username,
    ac.email
FROM accounts AS ac
    JOIN accounts_photos as ap ON
        ac.id = ap.account_id
        JOIN photos AS ph ON
            ap.photo_id = ph.id
WHERE
    ac.id = ph.id
ORDER BY
    ac.id
;