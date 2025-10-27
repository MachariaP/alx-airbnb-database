-- joins_queries.sql

-- 1. INNER JOIN: Retrieve all bookings with respective user details
SELECT b.id, b.start_date, b.end_date, u.name, u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT p.id, p.name, p.location, r.rating
FROM Property p
LEFT JOIN Review r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and bookings, including users without bookings and bookings without users
SELECT u.id, u.name, b.id AS booking_id, b.start_date
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.user_id;
