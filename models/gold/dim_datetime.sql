WITH silver_trips AS 
( 
    SELECT DISTINCT tpep_pickup_datetime AS trip_datetime 
    FROM {{ source('silver', 'yellow_tripdata_2024_01') }} 
)
SELECT trip_datetime, EXTRACT(YEAR FROM trip_datetime) AS year, 
EXTRACT(MONTH FROM trip_datetime) AS month, EXTRACT(DAY FROM trip_datetime) AS day, 
EXTRACT(HOUR FROM trip_datetime) AS hour, EXTRACT(DOW FROM trip_datetime) AS day_of_week, 
CASE WHEN EXTRACT(DOW FROM trip_datetime) IN (0,6) THEN TRUE 
    ELSE FALSE 
END AS is_weekend 
FROM silver_trips