# **AirBnB Clone - Database Schema Documentation**
## **Overview**
This document describes the database schema for an AirBnB-style accommodation booking platform. The schema supports core functionality including user management, property listings, bookings, payments, reviews, and messaging.

### Database Schema
Entity-Relationship Diagram
[https://er_diagram.png (Note: Add your actual ER diagram image file)](https://github.com/tomogolla/airbnb-clone-project/blob/main/ERD/requirements.md)

### Tables Structure
1. Users
Stores all user accounts and authentication details
Primary Key: user_id (UUID)
Fields:
  first_name, last_name: User's name
  email: Unique login identifier
  password_hash: Securely stored credentials
  role: Defines access level (guest/host/admin)
2. Properties
  Contains all rental property listings
  Primary Key: property_id (UUID)

Relationships:
  Many-to-one with Users (host relationship)

3. Bookings
  Manages all reservation transactions

  Relationships:
    Many-to-one with Users (guest)
    Many-to-one with Properties

4. Payments
  Records financial transactions
    Relationships:
      One-to-one with Bookings
5. Reviews
  Stores guest feedback for properties
    Relationships:
      Many-to-one with Users (guest)
      Many-to-one with Properties
6. Messages
  Handles communication between users
    Relationships:
      Many-to-one with Users (sender and recipient)
  Schema Features
    Data Integrity
      Referential Integrity: Foreign key constraints with ON DELETE CASCADE
      Validation: CHECK constraints for enums and value ranges
      Nullability: NOT NULL constraints for required fields
  Performance Optimization
    UUID primary keys for global uniqueness
    Indexes on all foreign keys and frequently queried columns
    Composite index on booking date ranges
Security
  Password hashing (implementation in application layer)
  Role-based access control foundation

Normalization
  The schema adheres to 3rd Normal Form (3NF) with:
  No repeating groups
  No partial dependencies
  No transitive dependencies
Future Enhancements
  Add geospatial indexing for location-based searches
  Implement soft deletes for data retention
Add audit trails for sensitive operations
