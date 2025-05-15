-- Indexes for the User table
CREATE INDEX idx_user_role ON "User" (role); -- Filter users by role (e.g., 'host', 'admin')

-- Indexes for the Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id); -- JOINs with User or filter by user
CREATE INDEX idx_booking_property_id ON Booking (property_id); -- JOINs with Property
CREATE INDEX idx_booking_status ON Booking (status); -- Filter by booking status (e.g., 'confirmed')
CREATE INDEX idx_booking_start_date ON Booking (start_date); -- Filter by date ranges

-- Indexes for the Property table
CREATE INDEX idx_property_host_id ON Property (host_id); -- JOINs with User (hosts)
CREATE INDEX idx_property_location ON Property (location); -- Search properties by location
CREATE INDEX idx_property_price ON Property (price_per_night); -- Filter by price ranges

-- Example 1: Filter bookings by user_id
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 123;

-- Example 2: Filter properties by location
EXPLAIN ANALYZE
SELECT * FROM Property WHERE location = 'New York';

-- Example 3: Filter bookings by status
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE status = 'confirmed';

-- Example 4: Join User and Booking
EXPLAIN ANALYZE
SELECT * 
FROM "User" u
JOIN Booking b ON u.user_id = b.user_id
WHERE u.role = 'host';