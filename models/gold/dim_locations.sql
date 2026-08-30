WITH pickup_locations AS 
( 
    SELECT DISTINCT "PULocationID" AS location_id 
    FROM {{ source('silver', 'yellow_tripdata_2024_01') }} 
), 
dropoff_locations AS 
( 
    SELECT DISTINCT "DOLocationID" AS location_id 
    FROM {{ source('silver', 'yellow_tripdata_2024_01') }} 
), 
all_locations AS 
( 
    SELECT location_id 
    FROM pickup_locations 
    UNION 
    SELECT location_id 
    FROM dropoff_locations 
) 
SELECT location_id 
FROM all_locations 
WHERE location_id IS NOT NULL