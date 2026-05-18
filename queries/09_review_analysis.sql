SELECT
    review_score,

    COUNT(*) AS total_reviews

FROM reviews

GROUP BY review_score

ORDER BY review_score DESC;
