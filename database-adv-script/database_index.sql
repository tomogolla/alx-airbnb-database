-- User Table Indexes
CREATE INDEX idx_user_role ON user(role);
CREATE INDEX idx_user_created_at ON user(created_at);

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
