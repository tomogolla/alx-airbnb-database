
-- properties where the average rating is greater than 4.0
SELECT
	P.property_id,
    P.name AS Property_name,
    P.location
FROM 
	property P
WHERE P.property_id IN (
	SELECT R.property_id
    FROM review R 
    GROUP BY R.property_id
    HAVING AVG(rating) > 4
);

-- correlated subquery to find users who have made more than 3 bookings.
SELECT 
	U.user_id,
    U.first_name
FROM user U 
WHERE (
	SELECT COUNT(*)
    FROM booking b 
    WHERE b.user_id = U.user_id
) >3;
