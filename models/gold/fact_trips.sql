SELECT ROW_NUMBER() OVER (ORDER BY tpep_pickup_datetime) AS trip_id, 
"VendorID" AS vendor_id, tpep_pickup_datetime, tpep_dropoff_datetime, 
"PULocationID" AS pickup_location_id, "DOLocationID" AS dropoff_location_id, 
passenger_count, trip_distance, trip_duration_minutes, fare_amount, tip_amount, 
tolls_amount, total_amount, payment_type 
FROM {{ source('silver', 'yellow_tripdata_2024_01') }}