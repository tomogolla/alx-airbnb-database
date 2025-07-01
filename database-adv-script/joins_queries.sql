### all bookings and the respective users who made those bookings


SELECT booking.booking_id, user.first_name 
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id

### Properties and their associated reviews
 SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at AS review_date
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id
ORDER BY 
    Property.name ASC, Review.created_at DESC;


-- FULL OUTER JOIN to retrieve all users and all bookings, including:
    -- Users without any bookings
    -- Bookings not linked to any user
SELECT 
    U.user_id,
    U.first_name,
    U.last_name,
    B.booking_id,
    B.property_id,
    B.start_date,
    B.end_date,
    B.status
FROM 
    [User] U
FULL OUTER JOIN 
    Booking B ON U.user_id = B.user_id;

-- retrieves all users and all bookings for MySQL
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.status
FROM 
    Booking b
RIGHT JOIN 
    User u ON u.user_id = b.user_id;
