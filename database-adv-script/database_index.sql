-- database_index.sql
-- Task 3: Indexing for Query Optimization
-- ALX Airbnb Database
-- Author: Phinehas Macharia
-- Date: 2025-10-28

-- ========================================
-- INDEX 1: On Booking.user_id
-- ========================================
-- Purpose: Speed up:
--   - JOIN with User
--   - GROUP BY user_id (Task 2)
--   - Correlated subqueries (Task 1)
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- ========================================
-- INDEX 2: On Booking.property_id
-- ========================================
-- Purpose: Speed up:
--   - JOIN with Property
--   - GROUP BY property_id (Task 2)
--   - Window function ranking
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- ========================================
-- INDEX 3: Composite Index (Advanced)
-- ========================================
-- Purpose: Optimize queries filtering + joining on both
-- Example: "Bookings by user for a property"
CREATE INDEX idx_booking_user_property ON Booking(user_id, property_id);

-- =============================================================================
-- END OF FILE
-- =============================================================================
