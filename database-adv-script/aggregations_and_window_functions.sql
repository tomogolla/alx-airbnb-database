-- total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT u.first_name, COUNT (b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name;

-- rank properties based on the total number of bookings they have received.
SELECT 
  property_id,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
  RANK(total_bookings)
FROM (
  SELECT 
    property_id,
    COUNT(*) AS total_bookings
  FROM booking
  GROUP BY property_id
) AS booking_counts;

