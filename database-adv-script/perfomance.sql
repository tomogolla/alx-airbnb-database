-- all bookings along with the user details, property details, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at,
    
    u.user_id,
    u.first_name AS user_name,
    u.email AS user_email,
    
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date

FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id;

-- all booking along with user details and payment info
SELECT
	b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    
    u.user_id,
    u.first_name as user_name,
    u.email AS user_email,
    
    p.property_id,
    p.name AS property_name,
    p.location,
    
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.booking_id
    
    FROM booking b
    JOIN user u ON b.user_id = u.user_id
    JOIN property p ON p.property_id = b.property_id
    LEFT JOIN payment pay on b.booking_id = pay.booking_id
    
    
-- refactored query retrieving booking with user details and payment details
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at,

    u.first_name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount

FROM booking b
STRAIGHT_JOIN user u ON b.user_id = u.user_id
STRAIGHT_JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pay ON b.booking_id = pay.booking_id;
    
