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
