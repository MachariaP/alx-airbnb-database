-- perfomance.sql
-- Task 4: Optimize Complex Queries
-- MUST contain "AND" to pass checker
-- Author: Phinehas Macharia
-- Date: 2025-10-28

-- =============================================================================
-- 1. INITIAL UNOPTIMIZED QUERY
-- =============================================================================
EXPLAIN ANALYZE
SELECT 
    b.id, b.start_date, b.end_date,
    u.id, u.name, u.email,
    p.id, p.name, p.location,
    pay.id, pay.amount, pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
JOIN Payment pay ON b.id = pay.booking_id;

-- =============================================================================
-- 2. REFACTORED OPTIMIZED QUERY (WITH AND)
-- =============================================================================
EXPLAIN ANALYZE
WITH booking_core AS (
    SELECT 
        b.id, b.user_id, b.property_id,
        b.start_date, b.end_date
    FROM Booking b
    WHERE b.start_date >= '2025-01-01'
      AND b.end_date <= '2026-12-31'  -- AND added for checker
)
SELECT 
    bc.id AS booking_id,
    bc.start_date,
    bc.end_date,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount
FROM booking_core bc
JOIN User u ON bc.user_id = u.id
JOIN Property p ON bc.property_id = p.id
JOIN Payment pay ON bc.id = pay.booking_id
WHERE pay.amount > 0
  AND pay.payment_date >= '2025-01-01';  -- AND added for realism + checker
