

# Database Schema

## Overview

The `schema.sql` file defines the database schema for an Airbnb-like application as part of the DataScape: Mastering Database Design project. The schema includes six tables: User, Property, Booking, Payment, Review, and Message. Each table is designed with appropriate data types, primary keys, foreign keys, constraints, and indexes to ensure data integrity, scalability, and optimal query performance. Exception handling is implemented to prevent errors if tables or indexes already exist.

## Schema Details

- **Tables**:
  - **User**: Stores user information (e.g., email, role) with a UNIQUE constraint on `email`.
  - **Property**: Stores property details (e.g., name, pricepernight) linked to a host via `host_id`.
  - **Booking**: Manages bookings with references to Property and User, including status and dates.
  - **Payment**: Tracks payments linked to bookings, with payment method and amount.
  - **Review**: Captures property reviews with a rating (1-5) and comment.
  - **Message**: Facilitates communication between users via sender and recipient IDs.

- **Constraints**:
  - Primary keys use UUIDs for uniqueness.
  - Foreign keys enforce referential integrity with `ON DELETE CASCADE` to handle deletions gracefully.
  - `UNIQUE` constraint on `User.email` prevents duplicate emails.
  - `CHECK` constraint on `Review.rating` ensures ratings are between 1 and 5.
  - `NOT NULL` constraints applied to required fields.

- **Indexing Decisions**:
  - Primary keys are automatically indexed.
  - Additional indexes created for:
    - `User.email` for fast login and lookup queries.
    - Foreign keys (e.g., `Property.host_id`, `Booking.property_id`, `Payment.booking_id`) to optimize joins and lookups.
    - `Message.sender_id` and `recipient_id` for efficient message retrieval.
  - Indexes improve performance for common queries, such as retrieving bookings by property or user.

- **Exception Handling**:
  - `CREATE TABLE IF NOT EXISTS` ensures tables are only created if they do not exist, preventing errors on re-execution.
  - `CREATE INDEX IF NOT EXISTS` (PostgreSQL) prevents errors if indexes already exist. For MySQL, alternative checks may be needed (see notes below).

## Usage

To implement the schema:
1. Execute the `schema.sql` file in a database management system (e.g., PostgreSQL, MySQL).
2. Verify that all tables, constraints, and indexes are created correctly.
3. Test foreign key relationships and constraints with sample data (see Task 3: seed.sql).

## Database Compatibility

- **PostgreSQL**: The script is fully compatible, using `UUID`, `ENUM`, and `IF NOT EXISTS` for tables and indexes.
- **MySQL**:
  - Replace `UUID` with `CHAR(36)` for primary keys.
  - For MySQL versions before 8.0, replace `ENUM` with `VARCHAR` and enforce values via application logic or `CHECK` constraints (if supported).
  - MySQL does not support `CREATE INDEX IF NOT EXISTS`. Use a conditional check in the script or drop existing indexes before creation if needed.


```
