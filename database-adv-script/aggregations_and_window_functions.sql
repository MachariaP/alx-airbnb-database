-- aggregations_and_window_functions.sql
-- Task 2: Aggregations & Window Functions
-- Advanced SQL Analytics for Airbnb Database

-- ========================================
-- 1. AGGREGATION: Total bookings per user
-- ========================================
SELECT 
    u.id AS user_id,
    u.name,
    COUNT(b.id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC, u.name;

-- ========================================
-- 2. WINDOW FUNCTION: Rank properties by booking count
-- ========================================
WITH property_bookings AS (
    SELECT 
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS booking_count
    FROM Property p
    LEFT JOIN Booking b ON p.id = b.property_id
    GROUP BY p.id, p.name
)
SELECT 
    property_id,
    property_name,
    booking_count,
    RANK() OVER (ORDER BY booking_count DESC) AS booking_rank
FROM property_bookings
ORDER BY booking_rank, property_name;
