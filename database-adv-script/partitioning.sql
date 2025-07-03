
-- 1. Drop foreign keys if they reference booking
ALTER TABLE payment DROP FOREIGN KEY fk_payment_booking;

-- 2. Drop existing primary key and recreate it including start_date
ALTER TABLE booking
DROP PRIMARY KEY,
ADD PRIMARY KEY (booking_id, start_date);

-- 3. Apply range partitioning on YEAR(start_date)
ALTER TABLE booking
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2020 VALUES LESS THAN (2021),
  PARTITION p2021 VALUES LESS THAN (2022),
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- 4. Recreate foreign key
ALTER TABLE payment
ADD CONSTRAINT fk_payment_booking
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
