-- seed.sql
-- Version: 1.0
-- Purpose: Populates the Airbnb-like database with realistic sample data for testing and development.
-- Database: Optimized for PostgreSQL; see README.md for MySQL adjustments.

-- Note: Static UUIDs are used for simplicity and reproducibility. In production, use:
-- PostgreSQL: uuid_generate_v4() with CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- MySQL: UUID() with CHAR(36) for user_id, property_id, etc.

-- Optional: Clear existing data for clean seeding (uncomment only if data loss is acceptable)
-- TRUNCATE TABLE message, review, payment, booking, property, user RESTART IDENTITY CASCADE;

-- User Data: 5 users (2 guests, 2 hosts, 1 admin) with names and unique emails
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('550e8400-e29b-41d4-a716-446655440000', 'John', 'Mwangi', 'john.mwangi@example.com', 'hashed_pass_123', '254-700-123456', 'guest', CURRENT_TIMESTAMP),
    ('550e8400-e29b-41d4-a716-446655440001', 'Aisha', 'Oluwaseun', 'aisha.olu@example.com', 'hashed_pass_456', '234-800-654321', 'host', CURRENT_TIMESTAMP),
    ('550e8400-e29b-41d4-a716-446655440002', 'Mary', 'Kamau', 'mary.kamau@example.com', 'hashed_pass_789', '254-712-987654', 'guest', CURRENT_TIMESTAMP),
    ('550e8400-e29b-41d4-a716-446655440003', 'Chinedu', 'Okeke', 'chinedu.okeke@example.com', 'hashed_pass_012', '234-810-456789', 'host', CURRENT_TIMESTAMP),
    ('550e8400-e29b-41d4-a716-446655440004', 'Admin', 'User', 'admin@example.com', 'hashed_pass_admin', NULL, 'admin', CURRENT_TIMESTAMP);

-- Property Data: 3 properties owned by hosts (Aisha and Chinedu) with realistic locations and prices
INSERT INTO property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    ('660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Coastal Villa', 'A serene villa with ocean views, perfect for a getaway.', 'Mombasa, Kenya', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Urban Loft', 'Modern loft in the heart of the city with great amenities.', 'Nairobi, Kenya', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440003', 'Lagos Beach House', 'Spacious beach house with direct access to the shore.', 'Lagos, Nigeria', 90.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Booking Data: 3 bookings by guests (John and Mary) with varied statuses and calculated prices
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('770e8400-e29b-41d4-a716-446655440000', '660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', '2025-11-01', '2025-11-04', 225.00, 'confirmed', CURRENT_TIMESTAMP), -- 3 nights × $75
    ('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '2025-11-10', '2025-11-12', 240.00, 'pending', CURRENT_TIMESTAMP), -- 2 nights × $120
    ('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440000', '2025-12-01', '2025-12-03', 180.00, 'canceled', CURRENT_TIMESTAMP); -- 2 nights × $90

-- Payment Data: 2 payments for the confirmed booking (full and partial)
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('880e8400-e29b-41d4-a716-446655440000', '770e8400-e29b-41d4-a716-446655440000', 225.00, CURRENT_TIMESTAMP, 'credit_card'), -- Full payment for booking
    ('880e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440000', 100.00, CURRENT_TIMESTAMP, 'paypal'); -- Partial payment for same booking

-- Review Data: 2 reviews by John for different properties
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('990e8400-e29b-41d4-a716-446655440000', '660e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', 4, 'Amazing villa, great views, but slightly pricey.', CURRENT_TIMESTAMP),
    ('990e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440000', 5, 'Fantastic beach house, highly recommend!', CURRENT_TIMESTAMP);

-- Message Data: 2 messages simulating guest-host communication
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('aa0e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Is the Coastal Villa available for November?', CURRENT_TIMESTAMP),
    ('aa0e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Yes, it’s available. Please confirm your dates.', CURRENT_TIMESTAMP);
