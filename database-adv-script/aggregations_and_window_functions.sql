-- total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT u.first_name, COUNT(b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name;

-- rank properties based on the total number of bookings they have received.
SELECT u.first_name, COUNT(b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name;
