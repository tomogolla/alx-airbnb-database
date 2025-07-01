-- Sample data for User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_1', '0712345678', 'guest', NOW()),
('660e8400-e29b-41d4-a716-446655440001', 'Bob', 'Smith', 'bob.smith@example.com', 'hashed_password_2', '0723456789', 'host', NOW()),
('770e8400-e29b-41d4-a716-446655440002', 'Carol', 'Ochieng', 'carol.ochieng@example.com', 'hashed_password_3', '0734567890', 'admin', NOW()),
('880e8400-e29b-41d4-a716-446655440003', 'David', 'Kamau', 'david.kamau@example.com', 'hashed_password_4', '0745678901', 'guest', NOW()),
('990e8400-e29b-41d4-a716-446655440004', 'Eva', 'Ngugi', 'eva.ngugi@example.com', 'hashed_password_5', '0756789012', 'host', NOW());


-- Sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('a10e8400-e29b-41d4-a716-446655440100', '660e8400-e29b-41d4-a716-446655440001',
 'Cozy Loft in Nairobi', 'A spacious and modern loft in the heart of Nairobi with fast Wi-Fi and great views.', 
 'Nairobi, Kenya', 55.00, NOW(), NOW()),

('b10e8400-e29b-41d4-a716-446655440101', '990e8400-e29b-41d4-a716-446655440004',
 'Beach House Diani', 'A serene beachfront house perfect for family vacations and remote work.', 
 'Diani, Kenya', 120.00, NOW(), NOW()),

('c10e8400-e29b-41d4-a716-446655440102', '660e8400-e29b-41d4-a716-446655440001',
 'Urban Studio Westlands', 'Compact studio ideal for solo travelers or couples, walking distance to nightlife and cafes.', 
 'Nairobi, Kenya', 40.00, NOW(), NOW()),

('d10e8400-e29b-41d4-a716-446655440103', '990e8400-e29b-41d4-a716-446655440004',
 'Mountain Cabin Naivasha', 'A quiet cabin with mountain views and firewood heating, perfect for a retreat.', 
 'Naivasha, Kenya', 80.00, NOW(), NOW());


-- Sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('f10e8400-e29b-41d4-a716-446655440200', 'a10e8400-e29b-41d4-a716-446655440100', 
 '550e8400-e29b-41d4-a716-446655440000', '2025-07-10', '2025-07-12', 110.00, 'confirmed', NOW()),

('f20e8400-e29b-41d4-a716-446655440201', 'b10e8400-e29b-41d4-a716-446655440101', 
 '880e8400-e29b-41d4-a716-446655440003', '2025-08-01', '2025-08-05', 480.00, 'pending', NOW()),

('f30e8400-e29b-41d4-a716-446655440202', 'c10e8400-e29b-41d4-a716-446655440102', 
 '550e8400-e29b-41d4-a716-446655440000', '2025-06-20', '2025-06-22', 80.00, 'completed', NOW()),

('f40e8400-e29b-41d4-a716-446655440203', 'd10e8400-e29b-41d4-a716-446655440103', 
 '880e8400-e29b-41d4-a716-446655440003', '2025-09-10', '2025-09-13', 240.00, 'canceled', NOW());
