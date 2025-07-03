-- create sample table booking to apply partitioning
CREATE TABLE Booking_HP
  booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID),
  property_id CHAR NOT NULL,
  user_id CHAR NOT NUll,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  booking_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

--insert sample data (include start_date and end_date as columns)
eg:
INSERT INTO Booking_HP
  (booking_id, property_id, user_id, start_date, end_date. booking_price, status, created_at)
VALUES 
  ('21', '31', '41', '2023-01-12', '2023-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2024-01-12', '2024-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2022-01-12', '2024-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2021-01-12', '2025-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2024-01-12', '2022-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2023-01-12', '2023-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2023-01-22', '2023-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2023-01-02', '2023-01-23', '121', 'guest', NOW())
  ('21', '31', '41', '2024-01-21', '2021-01-23', '121', 'guest', NOW());

-- 1. Drop foreign keys if they reference booking
ALTER TABLE Booking_HP DROP FOREIGN KEY fk_booking_hp_user;

-- 2. Drop existing primary key and recreate it including start_date
ALTER TABLE payment
DROP PRIMARY KEY,
ADD PRIMARY KEY (payment_id, start_date);

-- 3. Apply range partitioning on YEAR(start_date)
ALTER TABLE Booking_HP
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
