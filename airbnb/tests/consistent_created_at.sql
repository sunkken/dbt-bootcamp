SELECT *
FROM {{ ref('fct_reviews') }} r
  INNER JOIN {{ ref('dim_listings_cleansed') }} l
  USING (listing_id)
WHERE r.review_date < l.created_at
LIMIT 10