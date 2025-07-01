SELECT booking.booking_id, user.first_name 
FROM booking
INNER JOIN user
ON booking.user_id = user.user_id
