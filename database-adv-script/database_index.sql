-- User Table Indexes
CREATE INDEX idx_user_role ON user(role);
CREATE INDEX idx_user_id ON user(user_id);
CREATE INDEX idx_user_email ON user(email);

-- Property Table Indexes
CREATE INDEX idx_property_host ON property(host_id);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(pricepernight);
CREATE INDEX idx_property_created ON property(created_at);

-- Booking Table Indexes
CREATE INDEX idx_booking_property ON booking(property_id);
CREATE INDEX idx_booking_user ON booking(user_id);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_booking_dates ON booking(start_date, end_date); -- Composite index
CREATE INDEX idx_booking_created ON booking(created_at);

-- Query performance and monitoring
-- Using EXPLAIN (see index_perfomance.md)
EXPLAIN
SELECT 
	u.first_name,
    u.user_id,
	COUNT(b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name

-- monitor for query performance on booking table using ANALYZE
-- This returns status OK(see index_perfomance.md)
ANALYZE TABLE booking

-- EXPLAIN ANALYZE 
	-- returns query performance in detail including resource usage and time complexity
EXPLAIN ANALYZE
SELECT 
	u.first_name,
    u.user_id,
	COUNT(b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name
