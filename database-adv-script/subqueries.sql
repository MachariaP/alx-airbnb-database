-- subqueries.sql
-- Task 1: Advanced Subqueries (Non-Correlated & Correlated)
-- Author: Phinehas Macharia
-- Date: 2025-10-28

-- ========================================
-- 1. NON-CORRELATED SUBQUERY
-- Properties with average rating > 4.0
-- ========================================
SELECT p.id, p.name, p.location
FROM Property p
WHERE p.id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- ========================================
-- 2. CORRELATED SUBQUERY
-- Users with more than 3 bookings
-- ========================================
SELECT u.id, u.name, u.email
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.id
) > 3;

-- ========================================
-- BONUS: PERFORMANCE-OPTIMIZED VERSION
-- Recommended for production (uses JOIN + GROUP BY)
-- ========================================
/*
SELECT u.id, u.name, u.email
FROM User u
JOIN (
    SELECT user_id
    FROM Booking
    GROUP BY user_id
    HAVING COUNT(*) > 3
) active_users ON u.id = active_users.user_id;
*/
