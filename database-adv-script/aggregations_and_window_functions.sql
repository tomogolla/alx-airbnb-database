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
FROM (
  SELECT 
    property_id,
    COUNT(*) AS total_bookings
  FROM booking
  GROUP BY property_id
) AS booking_counts;

-- Query: Rank Users by Total Payment Amount
SELECT 
  user_id,
  total_paid,
  RANK() OVER (ORDER BY total_paid DESC) AS payment_rank
FROM (
  SELECT 
    b.user_id,
    SUM(pay.amount) AS total_paid
  FROM booking b
  JOIN payment pay ON b.booking_id = pay.booking_id
  GROUP BY b.user_id
) AS user_payments;
