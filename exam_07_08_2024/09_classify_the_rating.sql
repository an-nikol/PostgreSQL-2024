SELECT
    p.title,
    CASE
        WHEN pr_info.rating <= 3.50 THEN 'poor'
        WHEN pr_info.rating > 3.50 AND pr_info.rating <= 8.00  THEN 'good'
        WHEN pr_info.rating > 8.00 THEN 'excellent'
    END AS rating,

    CASE
        WHEN pr_info.has_subtitles IS TRUE THEN 'Bulgarian'
    ELSE
        'N/A'
    END AS subtitles,

    COUNT(pr_actors.actor_id) AS actors_count

FROM productions AS p
    JOIN productions_info AS pr_info ON
        p.production_info_id = pr_info.id
            JOIN productions_actors AS pr_actors ON
                p.id = pr_actors.production_id

GROUP BY
    p.title,
    pr_info.rating,
    pr_info.has_subtitles
ORDER BY
    rating,
    actors_count DESC,
    p.title
;