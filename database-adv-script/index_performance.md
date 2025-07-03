## Implementing Indexes for Optimization

### Identifying high resource usage columns

#### User table
Columns needing indexes:
  - email (UNIQUE constraint already creates an index)
  - role (Frequently filtered in queries like "find all hosts")
  - created_at (Often used for sorting/analytics)

#### Property Table
Columns needing indexes:
  - host_id (Foreign key, frequently joined with User table)
  - location (Common search filter)
  - pricepernight (Often filtered in price range queries)
  - created_at (For sorting new listings)

#### Booking Table
Columns needing indexes:
  - property_id (Foreign key, frequently joined)
  - user_id (Foreign key, frequently joined)
  - status (Often filtered by booking state)
  - start_date and end_date (Critical for availability queries)
  - created_at (For sorting recent bookings)

# Query index performance
Execution Plan Breakdown

| id |	select_type |	table	partitions |	type |	possible_keys |	key	key_len |	ref	rows |	filtered |	Extra |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 |	SIMPLE |	b |	NULL |	index |	idx_booking_user |	idx_booking_user |	144	| NULL |	13 |	100.00 |	Using index; Using temporary |
| 1 |	SIMPLE |	u |	NULL |	eq_ref |	PRIMARY,idx_user_user_id	| PRIMARY |	144 |	airbnb_clone.b.user_id	| 1 |	100.00 |	NULL |

EXPLAIN
SELECT 
	u.first_name,
    u.user_id,
	COUNT(b.booking_id) AS total_bookings
FROM user u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name


## Key Findings
### Join Execution Order:
  - MySQL starts with the booking table (aliased as b)
  - Then joins to the user table (aliased as u)

### Index Utilization:

For booking table:
  - Uses the idx_booking_user index (covering index on user_id)
  - Scans all 13 rows in the booking table
  - Note: "Using index" indicates an index-only scan

For user table:
 - Uses the PRIMARY key (user_id) for efficient lookups
 - "eq_ref" join type indicates optimal one-row-per-match access

Performance Observations:

  - The query creates a temporary table ("Using temporary") for the GROUP BY operation
  - No filesort operation is needed (good)
  - 100% filtering on both tables indicates no wasted rows

## Optimization recomendation
**Composite index on booking table with user table**

### Current Index Status:

  - The existing idx_booking_user is being properly utilized
  - Primary key access on users is optimal

**Monitoring Suggestion:**

Watch for growth in the booking table - if rows exceed 10,000, consider:

ANALYZE TABLE booking;
Review temporary table usage if this query becomes slower over time

## **Explain analyze**
'-> Table scan on <temporary>  (actual time=3.72..3.72 rows=5 loops=1)\n    -> Aggregate using temporary table  (actual time=3.71..3.71 rows=5 loops=1)\n        -> Nested loop inner join  (cost=7 rows=15) (actual time=1.07..2.23 rows=15 loops=1)\n            -> Covering index scan on b using idx_booking_user  (cost=1.75 rows=15) (actual time=0.521..1.62 rows=15 loops=1)\n            -> Single-row index lookup on u using PRIMARY (user_id=b.user_id)  (cost=0.257 rows=1) (actual time=0.0156..0.0156 rows=1 loops=15)\n'

